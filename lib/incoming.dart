import 'db_helper.dart';

class Car {
  int id;
  String name;
  String names;
  int miles;
  String dates;

  Car(this.id, this.name,this.names, this.miles,this.dates);

  Car.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    names= map['names'];
    miles = map['miles'];
    dates= map['dates'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnNames: names,
      DatabaseHelper.columnMiles: miles,
      DatabaseHelper.columnDates: dates,
    };
  }
}