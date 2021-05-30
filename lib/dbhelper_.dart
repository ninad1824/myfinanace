import 'finance.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelpero {

  static final _databaseName = "findb.db";
  static final _databaseVersion = 1;

  static final table = 'cars_table';

  static final columnId = 'id';
  static final columnTypes='types';
  static final columnName = 'name';
  static final columnNames = 'names';
  static final columnMiles = 'miles';
  static final columnDates = 'dates';

  // make this a singleton class
  DatabaseHelpero._privateConstructor();

  static final DatabaseHelpero instance = DatabaseHelpero._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTypes TEXT NOT NULL,
            $columnName TEXT NOT NULL,
            $columnNames TEXT NOT NULL,
            $columnMiles INTEGER NOT NULL,
            $columnDates TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Caro car) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'types':car.types,
      'name': car.name,
      'names': car.names,
      'miles': car.miles,
      'dates': car.dates
    });
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // Queries rows based on the argument received
  Future<List<Map<String, dynamic>>> queryRows(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnDates LIKE '%$name%'");
  }


  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCountd() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT SUM($columnMiles) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Caro car) async {
    Database db = await instance.database;
    int id = car.toMap()['id'];
    return await db.update(
        table, car.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryRow(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnTypes LIKE '%$name%'");
  }
  Future<List<Map<String, dynamic>>> queryRowd(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnTypes LIKE '%$name%'");
  }
  Future<List<Map<String, dynamic>>> queryRowe(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnName LIKE '%$name%'");
  }
}
// Deletes the row specified by the id. The number of affected rows is
// returned. This should be 1 as long as the row exists.
