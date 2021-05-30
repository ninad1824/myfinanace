import 'dbhelper_.dart';

class Caro {
  int id;
  String types;
  String name;
  String names;
  int miles;
  String dates;

  Caro(this.id,this.types, this.name,this.names, this.miles,this.dates);

  Caro.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    types=map['types'];
    name = map['name'];
    names= map['names'];
    miles = map['miles'];
    dates= map['dates'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelpero.columnId: id,
      DatabaseHelpero.columnTypes:types,
      DatabaseHelpero.columnName: name,
      DatabaseHelpero.columnNames: names,
      DatabaseHelpero.columnMiles: miles,
      DatabaseHelpero.columnDates: dates,
    };
  }
}