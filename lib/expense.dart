import '_dbhelper.dart';

class Care {
  int id;
  String name;
  String names;
  int miles;
  String dates;

  Care(this.id, this.name,this.names, this.miles,this.dates);

  Care.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    names= map['names'];
    miles = map['miles'];
    dates= map['dates'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelperS.columnId: id,
      DatabaseHelperS.columnName: name,
      DatabaseHelperS.columnNames: names,
      DatabaseHelperS.columnMiles: miles,
      DatabaseHelperS.columnDates: dates,
    };
  }
}