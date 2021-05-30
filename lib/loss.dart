import 'db-helper.dart';

class Caru {
  int id;
  String name;
  String names;
  int miles;
  String dates;

  Caru(this.id, this.name,this.names, this.miles,this.dates);

  Caru.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    names= map['names'];
    miles = map['miles'];
    dates= map['dates'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelperd.columnId: id,
      DatabaseHelperd.columnName: name,
      DatabaseHelperd.columnNames: names,
      DatabaseHelperd.columnMiles: miles,
      DatabaseHelperd.columnDates: dates,
    };
  }
}