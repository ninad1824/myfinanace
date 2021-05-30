import 'dbhelper.dart';

class Cars {
  int id;
  String name;
  String names;
  int miles;
  String dates;

  Cars(this.id, this.name,this.names, this.miles,this.dates);

  Cars.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    names= map['names'];
    miles = map['miles'];
    dates= map['dates'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelpers.columnId: id,
      DatabaseHelpers.columnName: name,
      DatabaseHelpers.columnNames: names,
      DatabaseHelpers.columnMiles: miles,
      DatabaseHelpers.columnDates: dates,
    };
  }
}