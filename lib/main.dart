import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'incoming.dart';
import 'db_helper.dart';
import 'invest.dart';
import 'dbhelper.dart';
import '_dbhelper.dart';
import 'expense.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'db-helper.dart';
import 'loss.dart';
import 'package:flutter/services.dart';
import 'finance.dart';
import 'dbhelper_.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFinance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstRoute(),
    );
  }
}
class MyNativePage extends StatefulWidget {
  MyNativePage({Key key}) : super(key: key);

  @override
  _MyNativePageState createState() => _MyNativePageState();
}

class _MyNativePageState extends State<MyNativePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final dbHelper = DatabaseHelper.instance;
  final dbHelpers = DatabaseHelpers.instance;
  final dbHelperS = DatabaseHelperS.instance;
  final dbHelperd=DatabaseHelperd.instance;
  List<Caro> caro = [];

  int incoming=0;
  int investment=0;
  int expense=0;
  int loss=0;
  int total=0;
  int count=1;
double i;
double e;
double o;
double l;

  void _queryRowCounts() async{
    final RowCount=await dbHelper.queryRowCountd();
    incoming=RowCount;

  }
  void _queryRowCounte() async{
    final RowCount=await dbHelperS.queryRowCounte();
    expense=RowCount;

  }
  void _queryRowCountc() async{
    final RowCount=await dbHelperd.queryRowCountc();
    loss=RowCount;

  }
  void _queryRowCountf() async{
    final RowCount=await dbHelpers.queryRowCountf();
    investment=RowCount;

  }


  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(


    title: Text('Incoming Amount'),
    ),
    body:

    Container(decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFB3E5FC),
          Color(0xFF81D4FA),
          Color(0xFF4FC3F7),
          Color(0xFF29B6F6),
        ],
        stops: [0.1, 0.4, 0.7, 0.9],
      ),
    ),


      child:ListView.builder(
    padding: const EdgeInsets.all(60),
    itemCount: count + 1,
    itemBuilder: (BuildContext context, int index) {
    if (index == count) {
    return RaisedButton(
      elevation: 5.0,
    child: Text('Refresh',
        style: TextStyle(
        color: Color(0xFF527DAA),
      letterSpacing: 1.5,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'OpenSans',
    ),
    ),
    onPressed: () {
    setState(() {
    _queryRowCounts();
    _queryRowCounte();
    _queryRowCountc();
    _queryRowCountf();
    total=incoming-expense-investment-loss;
    _showMessageInScaffold('Query done.');
    });
    },
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
    ),
    );
    }
    return Container(

    height: 400,
    padding: EdgeInsets.all(5),
    child:Column(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:<Widget>[

    Container(

    child: Text("Incoming till date", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),
    ),
    Container(
    child: Text("$incoming", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),
    ),
    Container(

    child: Text("Investment till date", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),

    ),
    Container(

    child: Text("$investment", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),
    ),
    Container(

    child: Text("Expense till date", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),
    ),
    Container(

    child: Text("$expense", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),
    ),
    Container(

    child: Text("Loss till date", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),
    ),
    Container(

    child: Text("$loss", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),
    ),
    Container(

    child: Text("Cash in Hand", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),
    ),
    Container(

    child: Text("$total", style: TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),),
    ),
    ]
    ),

    );
    },
    ),


    ),


    drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ninad Shetye"),
              accountEmail: Text("carpedium1824@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "N",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Home",style: TextStyle(
              color: Color(0xFF212121),
              letterSpacing: 0.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyNativePages()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.stacked_bar_chart), title: Text("Stats",style: TextStyle(
              color: Color(0xFF212121),
              letterSpacing: 0.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyNativePage()),
                );
              },
            ),
            ListTile(
              title: Text("Transactions"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EightRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Incoming",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Investment",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text("Expense",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ThirdRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Loss",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>_fourthroute()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart), title: Text("Piechart",style: TextStyle(
              color: Color(0xFF212121),
              letterSpacing: 0.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyNativePaged()),
                );
              },
            ),

          ],
        ),
      ),
        ),
    );
  }
}
class MyNativePaged extends StatefulWidget {
  MyNativePaged({Key key}) : super(key: key);

  @override
  _MyNativePagedState createState() => _MyNativePagedState();
}

class _MyNativePagedState extends State<MyNativePaged> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final dbHelper = DatabaseHelper.instance;
  final dbHelpers = DatabaseHelpers.instance;
  final dbHelperS = DatabaseHelperS.instance;
  final dbHelperd=DatabaseHelperd.instance;
  List<Caro> caro = [];

  int incoming;
  int investment;
  int expense;
  int loss;
  int total;
  int count=1;
  int incomings;

  double i;
  double e;
  double o;
  double l;

  void _queryRowCounts() async{
    final RowCount=await dbHelper.queryRowCountd();
    incoming=RowCount;

  }
  void _queryRowCounte() async{
    final RowCount=await dbHelperS.queryRowCounte();
    expense=RowCount;

  }
  void _queryRowCountc() async{
    final RowCount=await dbHelperd.queryRowCountc();
    loss=RowCount;

  }
  void _queryRowCountf() async{
    final RowCount=await dbHelpers.queryRowCountf();
    investment=RowCount;

  }


  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(


          title: Text('Piechart'),
        ),
        body:



          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFB3E5FC),
                Color(0xFF81D4FA),
                Color(0xFF4FC3F7),
                Color(0xFF29B6F6),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(55.0),
                child:RaisedButton(
              elevation: 5.0,
              child: Text('Refresh Piechart',
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
              onPressed: () {
                setState(() {
                  _queryRowCounts();
                  _queryRowCounte();
                  _queryRowCountc();
                  _queryRowCountf();

                });


              },
              color: Colors.white,
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
                ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                  child:RaisedButton(
                    elevation: 5.0,
                    child: Text('Get Piechart',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    onPressed: () {

                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>fifthpage(incoming : incoming,expense: expense,investment:investment,loss:loss)),
                        );
                      };

                    },
                    color: Colors.white,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  ),
          ],
            ),
          ),




        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ninad Shetye"),
                accountEmail: Text("carpedium1824@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "N",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home), title: Text("Home",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePages()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.stacked_bar_chart), title: Text("Stats",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Transactions",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EightRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Incoming",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Investment",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Expense",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ThirdRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Loss",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>_fourthroute()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.pie_chart), title: Text("Piechart",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyNativePaged()),
                  );
                },
              ),

            ],
          ),
        ),
      );
  }
}

class MyNativePages extends StatefulWidget {
  MyNativePages({Key key}) : super(key: key);

  @override
  _MyNativePagesState createState() => _MyNativePagesState();
}

class _MyNativePagesState extends State<MyNativePages> {
  List<PieChartSectionData> _sections = List<PieChartSectionData>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final dbHelper = DatabaseHelper.instance;
  final dbHelpers = DatabaseHelpers.instance;
  final dbHelperS = DatabaseHelperS.instance;
  final dbHelpero=DatabaseHelpero.instance;  final dbHelperd=DatabaseHelperd.instance;
  TextEditingController datesController = TextEditingController();
  int incoming;
  int investment;
  int expense;
  int loss;
  int total;
  int count=1;
  int incomings;
  String dates;
String value;
  double i;
  double e;
  double o;
  double l;
  List<Caro> caro = [];
  List<Caro> carsByName = [];

  void _queryRowCounts() async{
    final RowCount=await dbHelper.queryRowCountd();
    incoming=RowCount;

  }
  void _queryRowCounte() async{
    final RowCount=await dbHelperS.queryRowCounte();
    expense=RowCount;

  }
  void _queryRowCountc() async{
    final RowCount=await dbHelperd.queryRowCountc();
    loss=RowCount;

  }
  void _queryRowCountf() async{
    final RowCount=await dbHelpers.queryRowCountf();
    investment=RowCount;

  }


  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }

  DateTime _dateTime=DateTime.now();
  _selectedTododate(BuildContext) async{
    var _pickeddate=await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2000), lastDate: DateTime(2100));

    if(_pickeddate!=null){
      setState(() {
        _dateTime=_pickeddate;
        datesController.text=DateFormat('dd-MM-yyyy').format(_pickeddate);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(


          title: Text('Home'),
        ),
        body:

        Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
              Color(0xFFB3E5FC),
          Color(0xFF81D4FA),
          Color(0xFF4FC3F7),
          Color(0xFF29B6F6),
          ],
        stops: [0.1, 0.4, 0.7, 0.9],
        ),
    ),
          child: Column(

              children: <Widget>[
            Container(
            padding: EdgeInsets.all(5),
            child: TextField(
            controller: datesController,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pick a Date',
            hintText: 'Pick a Date',
            prefixIcon: InkWell(
            onTap:(){
              _selectedTododate(context);
              },
              child: Icon(Icons.calendar_today),
                )
                ),




            ),
          height: 100,
            ),
                Container(
                  padding: EdgeInsets.all(5.0),
                child:RaisedButton(
                  elevation: 5.0,
                  child: Text('Enter Details',
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      value=datesController.text;
                    });

                    {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>SeventhRoute(value : value)),
                      );
                    };

                  },
                  color: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                child:RaisedButton(
                  elevation: 5.0,
                  child: Text('Get Details',
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  onPressed: () {
                      setState(() {
                        dates=datesController.text;
                    _query(dates);
                  });

                  },
                  color: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                ),
                Container(
                        height: 40,
                        padding: EdgeInsets.all(5),
                        child:Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:<Widget>[

                              Container(
                                padding: EdgeInsets.only(left:50.0),
                                child: Text("Type",style: TextStyle(color:Colors.black,letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ),),
                              ),

                              Container(
                                padding: EdgeInsets.only(left:50.0),
                                child: Text("Amount",style: TextStyle(color:Colors.black,letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ),),
                              ),
                            ]
                        ),

                      ),


                Container(
                      height: 180,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: carsByName.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 40,
                            padding: EdgeInsets.all(5),
                            child:Row(

                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:<Widget>[

                                  Container(

                                    child: Text("${carsByName[index].types}",style: TextStyle(color:Colors.black,letterSpacing: 1.5,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),),
                                  ),

                                  Container(
                                  padding: EdgeInsets.only(left:40.0),
                                    child: Text("${carsByName[index].miles}",style: TextStyle(color:Colors.black,letterSpacing: 1.5,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),),
                                  ),
                                ]
                            ),

                          );
                        },
                      ),
                    ),

      ],
          ),
        ),


      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ninad Shetye"),
              accountEmail: Text("carpedium1824@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "N",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Home",style: TextStyle(
              color: Color(0xFF212121),
              letterSpacing: 0.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyNativePages()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.stacked_bar_chart), title: Text("Stats",style: TextStyle(
              color: Color(0xFF212121),
              letterSpacing: 0.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyNativePage()),
                );
              },
            ),
            ListTile(
              title: Text("Transactions",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EightRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Incoming",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Investment",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text("Expense",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ThirdRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Loss",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>_fourthroute()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart), title: Text("Piechart",style: TextStyle(
              color: Color(0xFF212121),
              letterSpacing: 0.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyNativePaged()),
                );
              },
            ),


          ],
        ),
      ),
      );
  }
  void _queryAll() async {
    final allRows = await dbHelpero.queryAllRows();
    caro.clear();
    allRows.forEach((row) => caro.add(Caro.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }
  void _query(name) async {
    final allRows = await dbHelpero.queryRows(name);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Caro.fromMap(row)));
  }


}

class FirstRoute extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FirstRoute> {
  String name="Ninad";
  String password="123";
  TextEditingController nameController = TextEditingController();
  TextEditingController namesController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }


  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            controller: nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            controller: namesController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }




  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          String uname=nameController.text;
          String pass=namesController.text;
          if(uname==name && pass==password) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyNativePages()),
            );
          }
          else {
            _showMessageInScaffold('Please enter right credentials');
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 200.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WELCOME',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildLoginBtn(),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class SeventhRoute extends StatefulWidget {
  String value;
  SeventhRoute({this.value});

  @override
  _MySeventhRoute createState() => _MySeventhRoute(value);
}

class _MySeventhRoute extends State<SeventhRoute> {
  bool disableddropdown= true;
  bool disableddropdowns= true;
  int _value;
  String _values;
  String types;
  int count=1;
  int incoming;
  String name=" ";
  String names=" ";
  final dbHelper = DatabaseHelper.instance;
  final dbHelpers = DatabaseHelpers.instance;
  final dbHelperS = DatabaseHelperS.instance;
final dbHelperd=DatabaseHelperd.instance;


  final emi={
    "1" : "Home",
    "2" : "Car",
    "3" : "Travel",
    "4" : "Business",
    "5" : "Miscellaneuos",
  };

  final insurance={
    "1" : "Professional Indemnity",
    "2" : "Life",
    "3" : "Car",
    "4" : "Health",
    "5" : "Equipments",
  };

  final car={
    "1" : "Petrol",
    "2" : "Car Related Maintanance",
  };

  final bill={
    "1" : "Phone",
    "2" : "Internet",
    "3" : "Home Maintainance",
    "4" : "Club Membership",
    "5" : "Tax Consultant",
    "6" : "Others",
  };

  final shopping={
    "1" : "Electronics",
    "2" : "Clothing",
    "3" : "Home and Beauty Products",
    "4" : "Fitness",
    "5" : "Parlours",
    "6" : "Pets",
    "7" : "Kids",
  };

  final health={
    "1" : "Hospital",
    "2" : "Medicines",
    "3" : "Fitness and Health Related Equipment",
  };

  final food={
    "1" : "Flight",
    "2" : "Train",
    "3" : "Stay",
    "4" : "Food(Out Of City)",
  };

  final education={
    "1" : "School Fees",
    "2" : "Books",
    "3" : "Classes",
    "4" : "Conferences or Courses",
  };

  final repair={
    "1" : "Household Equipment",
    "2" : "Electronics",
    "3" : "Miscellaneous",
  };
  final entertainment={
    "1" : "Movies",
    "2" : "Dinners",
    "3" : "Parties",
    "4" : "Others",
  };

  final down={
    "1" : "Business",
    "2" : "Purchase Of Property",
  };
  final dbHelpero=DatabaseHelpero.instance;
  String value;
  String values;
  _MySeventhRoute(this.value);
  final incomings={
    "1" : "Professional fees",
    "2" : "Rental Income",
    "3" : "Refunds",
    "4" : "Rebate",
    "5" : "Scholarships",
    "6" : "Grants",
    "7" : "Insurance Received",
    "8" : "Dividends",
    "9" : "Profit",
    "10" : "Profit from sale of asset",
    "11" : "Agricultural Income",
  };
  final expenses={
    "1" : "EMI",
    "2" : "Insurance",
    "3" : "Fuel and Car Maintainance",
    "4" : "Bills",
    "5" : "Shopping",
    "6" : "Health Related",
    "7" : "Food and Travel",
    "8" : "Educations",
    "9" : "Repairs",
    "10" : "Entertainment",
    "11" : "Agricultural Expenses",
  };

  final investments={
    "1" : "Transfer to Demat Account",
    "2" : "Purchase of Bonds",
    "3" : "FD",
    "4" : "Other Financial Products",
    "5" : "Purchase of Heavy Metals",
    "6" : "Purchase of Paintings",
    "7" : "Down Payment",
  };
  final loss={
    "1" : "Loss Booking in Mutual Funds",
    "2" : "Loss Booking in Shares",
    "3" : "Loss Booking in FNO",
    "4": "Loss in Business",
    "5": "Loss in Agriculture",
    "6": "Fines/Challans",
    "7": "Convenience Fees(Bribe)",
    "8": "Tax Paid",
  };



  final web={
    "1" : "Wadia Hospital",
    "2" : "Holy Family Hospital",
    "3" : "Others",
  };

  final app={
    "1" : "Home",
    "2" : "Equipment",
    "3" : "Miscellaneous",
  };

  final profit={
    "1" : "Shares",
    "2" : "Mutual Funds",
    "3" : "FNO",
    "4": "Other Business",
  };

  final asset={
    "1" : "Precious Metals",
    "2" : "Gems",
    "3" : "Property",
    "4": "Intelluctual",
    "5":"Cattle",
  };
  List<DropdownMenuItem<String>>menuitems=List();
  List<DropdownMenuItem<String>>menuitemss=List();

  List<Car> cars= [];
  List<Caro> caro = [];
  List<Care> care = [];
  List<Cars> carss = [];
  List<Caru> caru = [];
  List<Caro> carsByName = [];
  List<Caro> carsByNames = [];

  //controllers used in insert operation UI
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();

  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController namesUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController datesController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void populateweb(){
    for(String key in web.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(web[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: web[key],
      ));
    }
  }
  void populateapp(){
    for(String key in app.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(app[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: app[key],
      ));
    }
  }
  void populateprofit(){
    for(String key in profit.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(profit[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: profit[key],
      ));
    }
  }
  void populateasset(){
    for(String key in asset.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(asset[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: asset[key],
      ));
    }
  }
  void populateincome(){
    for(String key in incomings.keys){
      menuitemss.add(DropdownMenuItem<String>(
        child: Text(incomings[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: incomings[key],
      ));
    }
  }
  void populateinvest(){
    for(String key in investments.keys){
      menuitemss.add(DropdownMenuItem<String>(
        child: Text(investments[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: investments[key],
      ));
    }
  }
  void populateexpense(){
    for(String key in expenses.keys){
      menuitemss.add(DropdownMenuItem<String>(
        child: Text(expenses[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: expenses[key],
      ));
    }
  }
  void populateloss(){
    for(String key in loss.keys){
      menuitemss.add(DropdownMenuItem<String>(
        child: Text(loss[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: loss[key],
      ));
    }
  }


  void populatedown(){
    for(String key in down.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(down[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: down[key],
      ));
    }
  }

  void populateemi(){
    for(String key in emi.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(emi[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: emi[key],
      ));
    }
  }
  void populateinsurance(){
    for(String key in insurance.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(insurance[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: insurance[key],
      ));
    }
  }
  void populatecar(){
    for(String key in car.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(car[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: car[key],
      ));
    }
  }
  void populatebills(){
    for(String key in bill.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(bill[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: bill[key],
      ));
    }
  }
  void populateshopping(){
    for(String key in shopping.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(shopping[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: shopping[key],
      ));
    }
  }
  void populatehealth(){
    for(String key in health.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(health[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: health[key],
      ));
    }
  }
  void populatefood(){
    for(String key in food.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(food[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: food[key],
      ));
    }
  }
  void populateedu(){
    for(String key in education.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(education[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: education[key],
      ));
    }
  }
  void populaterepair(){
    for(String key in repair.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(repair[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: repair[key],
      ));
    }
  }
  void populateent(){
    for(String key in entertainment.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(entertainment[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: entertainment[key],
      ));
    }
  }


  DateTime _dateTime=DateTime.now();
  _selectedTododate(BuildContext) async{
    var _pickeddate=await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2000), lastDate: DateTime(2100));

    if(_pickeddate!=null){
      setState(() {
        _dateTime=_pickeddate;
        datesController.text=DateFormat('dd-MM-yyyy').format(_pickeddate);
      });
    }
  }
  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }
void thirdvaluechanged(value){
    if(value==1) {
      menuitemss = [];
      populateincome();
      disableddropdowns = false;
    }
    else if(value==2) {
      menuitemss = [];
      populateinvest();
      disableddropdowns = false;
    }
    else if(value==3) {
      menuitemss = [];
      populateexpense();
      disableddropdowns = false;
    }
    else if(value==4) {
      menuitemss = [];
      populateinvest();
      disableddropdowns = false;
    }

    setState(() {
        _value = value;
      });


}
  void valuechanged(value){
    if(value=="Professional fees"){
      menuitems=[];
      populateweb();
      disableddropdown= false;
    }
    else if(value=="Rental Income"){
      menuitems=[];
      populateapp();
      disableddropdown= false;
    }
    else if(value=="Refunds"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Rebate"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Scholarships"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Grants"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Insurance"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Dividends"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Profit"){
      menuitems=[];
      populateprofit();
      disableddropdown= false;
    }
    else if(value=="Sale of Asset") {
      menuitems = [];
      populateasset();
      disableddropdown = false;
    }
    else if(value=="Agricultural Income"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Transfer To Demat Account"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Purchase Of Bonds"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="FD"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Other Financial Products"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Purchase of Heavy Metals"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Paintings"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Down Payment"){
      menuitems=[];
      populatedown();
      disableddropdown= false;

    }
    if(value=="EMI"){
      menuitems=[];
      populateemi();
      disableddropdown= false;
    }
    else if(value=="Insurance"){
      menuitems=[];
      populateinsurance();
      disableddropdown= false;
    }
    else if(value=="Fuel and Car Maintainance") {
      menuitems = [];
      populatecar();
      disableddropdown = false;
    }
    else if(value=="Bills") {
      menuitems = [];
      populatebills();
      disableddropdown = false;
    }
    else if(value=="Shopping") {
      menuitems = [];
      populateshopping();
      disableddropdown = false;
    }
    else if(value=="Health Related") {
      menuitems = [];
      populatehealth();
      disableddropdown = false;
    }
    else if(value=="Food and Travel") {
      menuitems = [];
      populatefood();
      disableddropdown = false;
    }
    else if(value=="Educations") {
      menuitems = [];
      populateedu();
      disableddropdown = false;
    }
    else if(value=="Repairs") {
      menuitems = [];
      populaterepair();
      disableddropdown = false;
    }
    else if(value=="Entertainment") {
      menuitems = [];
      populateent();
      disableddropdown = false;
    }
    else if(value=="Agricultural Expenses") {
      menuitems = [];
      disableddropdown = false;
    }


    setState(() {
      values = value;
    });
  }

  void secondvaluechanged(value){


    setState(() {
      _values = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(

          title: Text('New Transaction'),
        ),
        body:
            Center(

              child: Column(

                children: <Widget>[

                  Container(
                    padding: EdgeInsets.all(0),
                    child:DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("Incoming", style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          )

                          ),

                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Investment", style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),

                          value: 2,
                        ),

                        DropdownMenuItem(
                          child: Text("Expense", style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),

                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text("Loss", style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),

                          value: 4,
                        ),

                      ],


                      onChanged: (int value) => thirdvaluechanged(value),

                      hint:Text("Select item"),

                      isExpanded: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child:DropdownButton<String>(
                      value: values,
                      items: menuitemss,


                      onChanged: disableddropdowns ? null : (value) => valuechanged(value),

                      hint:Text("Select item"),
                      disabledHint: Text("Please select first field"),
                      isExpanded: true,
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.all(5),
                    child:DropdownButton<String>(
                      value: _values,
                      items: menuitems,


                      onChanged: disableddropdown ? null : (value) => secondvaluechanged(value),

                      hint:Text("Select item"),
                      disabledHint: Text("Please select second field"),
                      isExpanded: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: milesController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter amount',
                      ),
                    ),
                  ),

                  RaisedButton(
                    child: Text('Insert Details',style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                    ),
                    onPressed: () {


                      if (_values == "Wadia Hospital") {
                        names = "Wadia Hospital";
                      }
                      else if (_values == "Holy Family Hospital") {
                        names = "Holy Family Hospital";
                      }
                      else if (_values == "Others") {
                        names = "Others";
                      }
                        else if (_values == "Home") {
                          names = "Home";
                        }
                        else if (_values == "Equipment") {
                          names = "Equipment";
                        }
                        else if (_values == "Miscellaneuos") {
                          names = "Miscellaneous";
                        }
                        else if (_values == "Shares") {
                          names = "Shares";
                        }
                        else if (_values == "Mutual Funds") {
                          names = "Mutual Funds";
                        }
                        else if (_values == "FNO") {
                          names = "FNO";
                        }
                        else if (_values == "Other Business") {
                          names = "Other Business";
                        }
                        else if (_values == "Precious Metals") {
                          names = "Precious Metals";
                        }
                        else if (_values == "Gems") {
                          names = "Gems";
                        }
                        else if (_values == "Property") {
                          names = "Property";
                        }
                        else if (_values == "Intellectual") {
                          names = "Intellectual";
                        }
                        else if (_values == "Cattle") {
                          names = "Cattle";
                        }
                        else if (_values == "Business") {
                          names = "Business";
                        }
                        else if (_values == "Purchase Of Property") {
                          names = "Purchase Of Property";
                        }
                      else if (_values == "Home") {
                        names = "Home";
                      }
                      else if (_values == "Car") {
                        names = "Car";
                      }
                      else if (_values == "Travel") {
                        names = "Travel";
                      }
                      else if (_values == "Business") {
                        names = "Business";
                      }
                      else if (_values == "Miscellaneous") {
                        names = "Miscellaneous";
                      }
                      else if (_values == "Professional Indemnity") {
                        names = "Professional Indemnity";
                      }
                      else if (_values == "Life") {
                        names = "Life";
                      }
                      else if (_values == "Car") {
                        names = "Car";
                      }
                      else if (_values == "Health") {
                        names = "Health";
                      }
                      else if (_values == "Equipments") {
                        names = "Equipments";
                      }
                      else if (_values == "Phone") {
                        names = "Phone";
                      }
                      else if (_values == "Internet") {
                        names = "Internet";
                      }
                      else if (_values == "Home Maintainance") {
                        names = "Home Maintainance";
                      }
                      else if (_values == "Club Memberships") {
                        names = "Club Memberships";
                      }
                      else if (_values == "Tax Consultant") {
                        names = "Tax Consultant";
                      }
                      else if (_values == "Others") {
                        names = "Others";
                      }
                      else if (_values == "Petrol") {
                        names = "Petrol";
                      }
                      else if (_values == "Car Related Maintainance") {
                        names = "Car Related Maintainance";
                      }
                      else if (_values == "Electronics") {
                        names = "Electronics";
                      }
                      else if (_values == "Clothing") {
                        names = "Clothing";
                      }
                      else if (_values == "Home and Beauty Products") {
                        names = "Home and Beauty Products";
                      }
                      else if (_values == "Fitness") {
                        names = "Fitness";
                      }
                      else if (_values == "Parlours") {
                        names = "Parlours";
                      }
                      else if (_values == "Pets") {
                        names = "Pets";
                      }
                      else if (_values == "Kids") {
                        names = "Kids";
                      }
                      else if (_values == "Flight") {
                        names = "Flight";
                      }
                      else if (_values == "Train") {
                        names = "Train";
                      }
                      else if (_values == "Stay") {
                        names = "Stay";
                      }
                      else if (_values == "Food(Out of City)") {
                        names = "Food(Out of City)";
                      }
                      else if (_values == "School Fees") {
                        names = "School Fees";
                      }
                      else if (_values == "Books") {
                        names = "Books";
                      }
                      else if (_values == "Classes") {
                        names = "Classes";
                      }
                      else if (_values == "Conferences") {
                        names = "Conferences";
                      }
                      else if (_values == "Courses") {
                        names = "Courses";
                      }
                      else if (_values == "Hospital") {
                        names = "Hospital";
                      }
                      else if (_values == "Medicines") {
                        names = "Medicines";
                      }
                      else if (_values == "Fitness and Health Equipments") {
                        names = "Fitness and Health Equipments";
                      }
                      else if (_values == "Movies") {
                        names = "Movies";
                      }
                      else if (_values == "Dinners") {
                        names = "Dinners";
                      }
                      else if (_values == "Parties") {
                        names = "Parties";
                      }
                      else if (_values == "Others") {
                        names = "Others";
                      }
                      else if (_values == "Household Equipments") {
                        names = "Household Equipments";
                      }
                      else if (_values == "Electronics") {
                        names = "Electronics";
                      }
                      else if (_values == "Miscellaneuos") {
                        names = "Miscellaneuos";
                      }

                      if (values == "Professional fees") {
                          name = "Professional fees";
                         }
                        else if (values == "Rental Income") {
                          name = "Rental Income";
                        }
                        else if (values == "Refunds") {
                          name = "Refunds";
                        }
                        else if (values == "Rebate") {
                          name = "Rebate";
                        }
                        else if (values == "Scholarships") {
                          name = "Scholarships";
                        }
                        else if (values == "Grants") {
                          name = "Grants";
                        }
                        else if (values == "Insurance") {
                          name = "Insurance";
                        }
                        else if (values == "Dividends") {
                          name = "Dividends";
                        }
                        else if (values == "Profit") {
                          name = "Profit";

                        }
                        else if (values == "Sales of Asset") {
                          name = "Sale of Asset";
                        }
                        else if (values == "Agricultural Income") {
                          name = "Agricultual Income";
                        }
                        else if (values == "Transfer to Demat Account") {
                            name = "Transfer to Demat Account";
                        }
                          else if (values == "Purchase of Bonds") {
                            name = "Purchase of Bonds";
                          }
                          else if (values == "FD") {
                            name = "FD";
                          }
                          else if (values == "Other Financial Products") {
                            name = "Other Financial Products";
                          }
                          else if (values == "Purchase of Heavy Metals") {
                            name = "Purchase of Heavy Metals";
                          }
                          else if (values == "Purchase of Paintings") {
                            name = "Purchase of Paintings";
                          }
                          else if (values == "Down Payment") {
                            name = "Down payment";

                          }

                          else if (values == "EMI") {
                            name = "EMI";

                          }
                          else if (values == "Insurance") {
                            name = "Insurance";

                          }

                          else if (values == "Fuel and Car Maintainance") {
                            name = "Fuel and Car Maintainance";

                          }
                          else if (values == "Bills") {
                            name = "Bills";

                          }
                          else if (values == "Shopping") {
                            name = "Shopping";

                          }
                          else if (values == "Health Related") {
                            name = "Health Related";

                          }
                          else if (values == "Food and Travel") {
                            name = "Food and Travel";

                          }
                          else if (values == "Educations") {
                            name = "Educations";

                          }
                          else if (values == "Repairs") {
                            name = "Repairs";

                          }
                          else if (values == "Entertainment") {
                            name = "Entertainment";

                          }
                          else if (values == "Agricultural Expenses") {
                            name = "Agricultual Expenses";
                          }

                          else if (values == "Loss Booking in Mutual Funds") {
                            name = "Loss Booking in Mutual Funds";
                          }
                          else if (values == "Loss Booking in Shares") {
                            name = "Loss Booking in Shares";
                          }

                          else if (values == "Loss Booking in FNO") {
                            name = "Loss Booking in FNO";
                          }
                          else if (values == "Loss in Business") {
                            name = "Loss in Business";
                          }
                          else if (values == "Loss in Agriculture") {
                            name = "Loss in Agriculture";
                          }
                          else if (values == "Fines/Challans") {
                            name = "Fines/Challans";
                          }
                          else if (values == "Convenience fees(Bribe)") {
                            name = "Convenience fees(Bribe)";
                          }
                          else if (values == "Tax Paid") {
                            name = "Tax Paid";
                          }


                      int miles = int.parse(milesController.text);
                      if (_value == 1) {
                        types = "Incoming";
                        _insert(name,names, miles,value);
                        _inserto(types,name,names,miles,value);
                      }
                      else if (_value == 2) {
                        types = "Investment";
                        _inserts(name, names, miles, value);
                        _inserto(types,name,names,miles,value);
                      }
                      else if (_value == 3) {
                        types = "Expense";
                        _insertS(name, names, miles, value);
                        _inserto(types,name,names,miles,value);
                      }
                      else if (_value == 4) {
                        types = "Loss";
                        _insertd(name, names, miles, value);
                        _inserto(types,name,names,miles,value);
                      }




                      disableddropdown= true;
                      disableddropdowns= true;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>EightRoute()),
                      );
                    },
                    color: Color(0XFF80CBC4),
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),

                    ),

                  ),
                ],
              ),
            ),


      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ninad Shetye"),
              accountEmail: Text("carpedium1824@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "N",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyNativePages()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.stacked_bar_chart), title: Text("Stats"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyNativePage()),
                );
              },
            ),
            ListTile(
              title: Text("Transactions"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EightRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Incoming"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Investment"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text("Expense"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ThirdRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Loss"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>_fourthroute()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart), title: Text("Piechart"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyNativePaged()),
                );
              },
            ),


          ],
        ),
      ),
      );

  }

  void _insert(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnNames:names,
      DatabaseHelper.columnMiles: miles,
      DatabaseHelper.columnDates: dates,

    };



    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }
  void _insertS(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelperS.columnName: name,
      DatabaseHelperS.columnNames:names,
      DatabaseHelperS.columnMiles: miles,
      DatabaseHelperS.columnDates: dates,

    };



    Care care = Care.fromMap(row);
    final id = await dbHelperS.insert(care);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _inserts(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelpers.columnName: name,
      DatabaseHelpers.columnNames:names,
      DatabaseHelpers.columnMiles: miles,
      DatabaseHelpers.columnDates: dates,

    };



    Cars carss = Cars.fromMap(row);
    final id = await dbHelpers.insert(carss);
    _showMessageInScaffold('inserted row id: $id');
  }
  void _insertd(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelperd.columnName: name,
      DatabaseHelperd.columnNames:names,
      DatabaseHelperd.columnMiles: miles,
      DatabaseHelperd.columnDates: dates,

    };



    Caru caru = Caru.fromMap(row);
    final id = await dbHelperd.insert(caru);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _inserto(type,name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelpero.columnTypes: type,
      DatabaseHelpero.columnName: name,
      DatabaseHelpero.columnNames:names,
      DatabaseHelpero.columnMiles: miles,
      DatabaseHelpero.columnDates: dates,

    };



    Caro cars = Caro.fromMap(row);
    final id = await dbHelpero.insert(cars);
    _showMessageInScaffold('inserted row id: $id');
  }



  void _queryAll() async {
    final allRows = await dbHelpero.queryAllRows();
    caro.clear();
    allRows.forEach((row) => caro.add(Caro.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }

  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Caro.fromMap(row)));
  }

  void _queryRowCount() async{
    final RowCount=await dbHelper.queryRowCountd();
    incoming=RowCount;
  }

  void _update(id, name,names, miles,dates) async {
    // row to update
    Car car = Car(id, name, names,miles,dates);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }

  void _queries(names) async {
    final allRows = await dbHelper.queryRow(names);
    carsByNames.clear();
    allRows.forEach((row) => carsByNames.add(Caro.fromMap(row)));
  }
}
class EightRoute extends StatefulWidget {
  EightRoute({Key key}) : super(key: key);

  @override
  _MyEightRoute createState() => _MyEightRoute();
}

class _MyEightRoute extends State<EightRoute> {
  bool disableddropdown= true;
  bool disableddropdowns= true;
  int _value;
  String _values;
  String types;
  int count=1;
  int incoming;
  String name=" ";
  String names=" ";
  final dbHelper = DatabaseHelper.instance;
  final dbHelpers = DatabaseHelpers.instance;
  final dbHelperS = DatabaseHelperS.instance;
  final dbHelperd=DatabaseHelperd.instance;


  final emi={
    "1" : "Home",
    "2" : "Car",
    "3" : "Travel",
    "4" : "Business",
    "5" : "Miscellaneuos",
  };

  final insurance={
    "1" : "Professional Indemnity",
    "2" : "Life",
    "3" : "Car",
    "4" : "Health",
    "5" : "Equipments",
  };

  final car={
    "1" : "Petrol",
    "2" : "Car Related Maintanance",
  };

  final bill={
    "1" : "Phone",
    "2" : "Internet",
    "3" : "Home Maintainance",
    "4" : "Club Membership",
    "5" : "Tax Consultant",
    "6" : "Others",
  };

  final shopping={
    "1" : "Electronics",
    "2" : "Clothing",
    "3" : "Home and Beauty Products",
    "4" : "Fitness",
    "5" : "Parlours",
    "6" : "Pets",
    "7" : "Kids",
  };

  final health={
    "1" : "Hospital",
    "2" : "Medicines",
    "3" : "Fitness and Health Related Equipment",
  };

  final food={
    "1" : "Flight",
    "2" : "Train",
    "3" : "Stay",
    "4" : "Food(Out Of City)",
  };

  final education={
    "1" : "School Fees",
    "2" : "Books",
    "3" : "Classes",
    "4" : "Conferences or Courses",
  };

  final repair={
    "1" : "Household Equipment",
    "2" : "Electronics",
    "3" : "Miscellaneous",
  };
  final entertainment={
    "1" : "Movies",
    "2" : "Dinners",
    "3" : "Parties",
    "4" : "Others",
  };

  final down={
    "1" : "Business",
    "2" : "Purchase Of Property",
  };
  final dbHelpero=DatabaseHelpero.instance;
  String value;
  String values;
  final incomings={
    "1" : "Professional fees",
    "2" : "Rental Income",
    "3" : "Refunds",
    "4" : "Rebate",
    "5" : "Scholarships",
    "6" : "Grants",
    "7" : "Insurance Received",
    "8" : "Dividends",
    "9" : "Profit",
    "10" : "Profit from sale of asset",
    "11" : "Agricultural Income",
  };
  final expenses={
    "1" : "EMI",
    "2" : "Insurance",
    "3" : "Fuel and Car Maintainance",
    "4" : "Bills",
    "5" : "Shopping",
    "6" : "Health Related",
    "7" : "Food and Travel",
    "8" : "Educations",
    "9" : "Repairs",
    "10" : "Entertainment",
    "11" : "Agricultural Expenses",
  };

  final investments={
    "1" : "Transfer to Demat Account",
    "2" : "Purchase of Bonds",
    "3" : "FD",
    "4" : "Other Financial Products",
    "5" : "Purchase of Heavy Metals",
    "6" : "Purchase of Paintings",
    "7" : "Down Payment",
  };
  final loss={
    "1" : "Loss Booking in Mutual Funds",
    "2" : "Loss Booking in Shares",
    "3" : "Loss Booking in FNO",
    "4": "Loss in Business",
    "5": "Loss in Agriculture",
    "6": "Fines/Challans",
    "7": "Convenience Fees(Bribe)",
    "8": "Tax Paid",
  };



  final web={
    "1" : "Wadia Hospital",
    "2" : "Holy Family Hospital",
    "3" : "Others",
  };

  final app={
    "1" : "Home",
    "2" : "Equipment",
    "3" : "Miscellaneous",
  };

  final profit={
    "1" : "Shares",
    "2" : "Mutual Funds",
    "3" : "FNO",
    "4": "Other Business",
  };

  final asset={
    "1" : "Precious Metals",
    "2" : "Gems",
    "3" : "Property",
    "4": "Intelluctual",
    "5":"Cattle",
  };
  List<DropdownMenuItem<String>>menuitems=List();
  List<DropdownMenuItem<String>>menuitemss=List();

  List<Car> cars= [];
  List<Caro> caro = [];
  List<Care> care = [];
  List<Cars> carss = [];
  List<Caru> caru = [];
  List<Caro> carsByName = [];
  List<Caro> carsByNames = [];

  //controllers used in insert operation UI
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();

  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController namesUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController datesController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void populateweb(){
    for(String key in web.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(web[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: web[key],
      ));
    }
  }
  void populateapp(){
    for(String key in app.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(app[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: app[key],
      ));
    }
  }
  void populateprofit(){
    for(String key in profit.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(profit[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: profit[key],
      ));
    }
  }
  void populateasset(){
    for(String key in asset.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(asset[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: asset[key],
      ));
    }
  }
  void populateincome(){
    for(String key in incomings.keys){
      menuitemss.add(DropdownMenuItem<String>(
        child: Text(incomings[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: incomings[key],
      ));
    }
  }
  void populateinvest(){
    for(String key in investments.keys){
      menuitemss.add(DropdownMenuItem<String>(
        child: Text(investments[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: investments[key],
      ));
    }
  }
  void populateexpense(){
    for(String key in expenses.keys){
      menuitemss.add(DropdownMenuItem<String>(
        child: Text(expenses[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: expenses[key],
      ));
    }
  }
  void populateloss(){
    for(String key in loss.keys){
      menuitemss.add(DropdownMenuItem<String>(
        child: Text(loss[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: loss[key],
      ));
    }
  }


  void populatedown(){
    for(String key in down.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(down[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: down[key],
      ));
    }
  }

  void populateemi(){
    for(String key in emi.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(emi[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: emi[key],
      ));
    }
  }
  void populateinsurance(){
    for(String key in insurance.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(insurance[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: insurance[key],
      ));
    }
  }
  void populatecar(){
    for(String key in car.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(car[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: car[key],
      ));
    }
  }
  void populatebills(){
    for(String key in bill.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(bill[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: bill[key],
      ));
    }
  }
  void populateshopping(){
    for(String key in shopping.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(shopping[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: shopping[key],
      ));
    }
  }
  void populatehealth(){
    for(String key in health.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(health[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: health[key],
      ));
    }
  }
  void populatefood(){
    for(String key in food.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(food[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: food[key],
      ));
    }
  }
  void populateedu(){
    for(String key in education.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(education[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: education[key],
      ));
    }
  }
  void populaterepair(){
    for(String key in repair.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(repair[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: repair[key],
      ));
    }
  }
  void populateent(){
    for(String key in entertainment.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(entertainment[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: entertainment[key],
      ));
    }
  }


  DateTime _dateTime=DateTime.now();
  _selectedTododate(BuildContext) async{
    var _pickeddate=await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2000), lastDate: DateTime(2100));

    if(_pickeddate!=null){
      setState(() {
        _dateTime=_pickeddate;
        datesController.text=DateFormat('dd-MM-yyyy').format(_pickeddate);
      });
    }
  }
  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }
  void thirdvaluechanged(value){
    if(value==1) {
      menuitemss = [];
      populateincome();
      disableddropdowns = false;
    }
    else if(value==2) {
      menuitemss = [];
      populateinvest();
      disableddropdowns = false;
    }
    else if(value==3) {
      menuitemss = [];
      populateexpense();
      disableddropdowns = false;
    }
    else if(value==4) {
      menuitemss = [];
      populateinvest();
      disableddropdowns = false;
    }

    setState(() {
      _value = value;
    });


  }
  void valuechanged(value){
    if(value=="Professional fees"){
      menuitems=[];
      populateweb();
      disableddropdown= false;
    }
    else if(value=="Rental Income"){
      menuitems=[];
      populateapp();
      disableddropdown= false;
    }
    else if(value=="Refunds"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Rebate"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Scholarships"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Grants"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Insurance"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Dividends"){
      menuitems=[];
      disableddropdown= false;
    }
    else if(value=="Profit"){
      menuitems=[];
      populateprofit();
      disableddropdown= false;
    }
    else if(value=="Sale of Asset") {
      menuitems = [];
      populateasset();
      disableddropdown = false;
    }
    else if(value=="Agricultural Income"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Transfer To Demat Account"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Purchase Of Bonds"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="FD"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Other Financial Products"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Purchase of Heavy Metals"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Paintings"){
      menuitems=[];
      disableddropdown= false;

    }
    else if(value=="Down Payment"){
      menuitems=[];
      populatedown();
      disableddropdown= false;

    }
    if(value=="EMI"){
      menuitems=[];
      populateemi();
      disableddropdown= false;
    }
    else if(value=="Insurance"){
      menuitems=[];
      populateinsurance();
      disableddropdown= false;
    }
    else if(value=="Fuel and Car Maintainance") {
      menuitems = [];
      populatecar();
      disableddropdown = false;
    }
    else if(value=="Bills") {
      menuitems = [];
      populatebills();
      disableddropdown = false;
    }
    else if(value=="Shopping") {
      menuitems = [];
      populateshopping();
      disableddropdown = false;
    }
    else if(value=="Health Related") {
      menuitems = [];
      populatehealth();
      disableddropdown = false;
    }
    else if(value=="Food and Travel") {
      menuitems = [];
      populatefood();
      disableddropdown = false;
    }
    else if(value=="Educations") {
      menuitems = [];
      populateedu();
      disableddropdown = false;
    }
    else if(value=="Repairs") {
      menuitems = [];
      populaterepair();
      disableddropdown = false;
    }
    else if(value=="Entertainment") {
      menuitems = [];
      populateent();
      disableddropdown = false;
    }
    else if(value=="Agricultural Expenses") {
      menuitems = [];
      disableddropdown = false;
    }


    setState(() {
      values = value;
    });
  }

  void secondvaluechanged(value){


    setState(() {
      _values = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "View",
              ),

              Tab(
                text: "Update",
              ),
              Tab(
                text: "Finance Type",
              ),
              Tab(
                text: "Finance Subype",
              ),

            ],
          ),
          title: Text('Transactions'),
        ),
        body: TabBarView(

          children: [

            Container(

              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: caro.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == caro.length) {
                    return RaisedButton(
                      child: Text('Refresh',style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),

                      ),
                      onPressed: () {
                        setState(() {
                          _queryAll();
                        });
                      },

                      color: Color(0XFF80DEEA),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    padding: EdgeInsets.all(5),
                    child:Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[

                          Container(

                            child: Text("${caro[index].id}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("${caro[index].types}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${caro[index].name}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${caro[index].miles}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                        ]
                    ),

                  );
                },
              ),
            ),


            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    child:DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("Incoming", style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          )

                          ),

                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Investment", style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),

                          value: 2,
                        ),

                        DropdownMenuItem(
                          child: Text("Expense", style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),

                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text("Loss", style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),

                          value: 4,
                        ),

                      ],


                      onChanged: (int value) => thirdvaluechanged(value),

                      hint:Text("Select item"),

                      isExpanded: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    child:DropdownButton<String>(
                      value: values,
                      items: menuitemss,


                      onChanged: disableddropdowns ? null : (value) => valuechanged(value),

                      hint:Text("Select item"),
                      disabledHint: Text("Please select first field"),
                      isExpanded: true,
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.all(3),
                    child:DropdownButton<String>(
                      value: _values,
                      items: menuitems,


                      onChanged: disableddropdown ? null : (value) => secondvaluechanged(value),

                      hint:Text("Select item"),
                      disabledHint: Text("Please select second field"),
                      isExpanded: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    child: TextField(
                      controller: datesController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Pick a Date',
                          hintText: 'Pick a Date',
                          prefixIcon: InkWell(
                            onTap:(){
                              _selectedTododate(context);
                            },
                            child: Icon(Icons.calendar_today),
                          )
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    child: TextField(
                      controller: idUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Transaction id',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    child: TextField(
                      controller: milesUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Transaction Amount',
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text('Update transaction Details',style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                    ),
                    onPressed: () {
                      if (_values == "Wadia Hospital") {
                        names = "Wadia Hospital";
                      }
                      else if (_values == "Holy Family Hospital") {
                        names = "Holy Family Hospital";
                      }
                      else if (_values == "Others") {
                        names = "Others";
                      }
                      else if (_values == "Home") {
                        names = "Home";
                      }
                      else if (_values == "Equipment") {
                        names = "Equipment";
                      }
                      else if (_values == "Miscellaneuos") {
                        names = "Miscellaneous";
                      }
                      else if (_values == "Shares") {
                        names = "Shares";
                      }
                      else if (_values == "Mutual Funds") {
                        names = "Mutual Funds";
                      }
                      else if (_values == "FNO") {
                        names = "FNO";
                      }
                      else if (_values == "Other Business") {
                        names = "Other Business";
                      }
                      else if (_values == "Precious Metals") {
                        names = "Precious Metals";
                      }
                      else if (_values == "Gems") {
                        names = "Gems";
                      }
                      else if (_values == "Property") {
                        names = "Property";
                      }
                      else if (_values == "Intellectual") {
                        names = "Intellectual";
                      }
                      else if (_values == "Cattle") {
                        names = "Cattle";
                      }
                      else if (_values == "Business") {
                        names = "Business";
                      }
                      else if (_values == "Purchase Of Property") {
                        names = "Purchase Of Property";
                      }
                      else if (_values == "Home") {
                        names = "Home";
                      }
                      else if (_values == "Car") {
                        names = "Car";
                      }
                      else if (_values == "Travel") {
                        names = "Travel";
                      }
                      else if (_values == "Business") {
                        names = "Business";
                      }
                      else if (_values == "Miscellaneous") {
                        names = "Miscellaneous";
                      }
                      else if (_values == "Professional Indemnity") {
                        names = "Professional Indemnity";
                      }
                      else if (_values == "Life") {
                        names = "Life";
                      }
                      else if (_values == "Car") {
                        names = "Car";
                      }
                      else if (_values == "Health") {
                        names = "Health";
                      }
                      else if (_values == "Equipments") {
                        names = "Equipments";
                      }
                      else if (_values == "Phone") {
                        names = "Phone";
                      }
                      else if (_values == "Internet") {
                        names = "Internet";
                      }
                      else if (_values == "Home Maintainance") {
                        names = "Home Maintainance";
                      }
                      else if (_values == "Club Memberships") {
                        names = "Club Memberships";
                      }
                      else if (_values == "Tax Consultant") {
                        names = "Tax Consultant";
                      }
                      else if (_values == "Others") {
                        names = "Others";
                      }
                      else if (_values == "Petrol") {
                        names = "Petrol";
                      }
                      else if (_values == "Car Related Maintainance") {
                        names = "Car Related Maintainance";
                      }
                      else if (_values == "Electronics") {
                        names = "Electronics";
                      }
                      else if (_values == "Clothing") {
                        names = "Clothing";
                      }
                      else if (_values == "Home and Beauty Products") {
                        names = "Home and Beauty Products";
                      }
                      else if (_values == "Fitness") {
                        names = "Fitness";
                      }
                      else if (_values == "Parlours") {
                        names = "Parlours";
                      }
                      else if (_values == "Pets") {
                        names = "Pets";
                      }
                      else if (_values == "Kids") {
                        names = "Kids";
                      }
                      else if (_values == "Flight") {
                        names = "Flight";
                      }
                      else if (_values == "Train") {
                        names = "Train";
                      }
                      else if (_values == "Stay") {
                        names = "Stay";
                      }
                      else if (_values == "Food(Out of City)") {
                        names = "Food(Out of City)";
                      }
                      else if (_values == "School Fees") {
                        names = "School Fees";
                      }
                      else if (_values == "Books") {
                        names = "Books";
                      }
                      else if (_values == "Classes") {
                        names = "Classes";
                      }
                      else if (_values == "Conferences") {
                        names = "Conferences";
                      }
                      else if (_values == "Courses") {
                        names = "Courses";
                      }
                      else if (_values == "Hospital") {
                        names = "Hospital";
                      }
                      else if (_values == "Medicines") {
                        names = "Medicines";
                      }
                      else if (_values == "Fitness and Health Equipments") {
                        names = "Fitness and Health Equipments";
                      }
                      else if (_values == "Movies") {
                        names = "Movies";
                      }
                      else if (_values == "Dinners") {
                        names = "Dinners";
                      }
                      else if (_values == "Parties") {
                        names = "Parties";
                      }
                      else if (_values == "Others") {
                        names = "Others";
                      }
                      else if (_values == "Household Equipments") {
                        names = "Household Equipments";
                      }
                      else if (_values == "Electronics") {
                        names = "Electronics";
                      }
                      else if (_values == "Miscellaneuos") {
                        names = "Miscellaneuos";
                      }

                      if (values == "Professional fees") {
                        name = "Professional fees";
                      }
                      else if (values == "Rental Income") {
                        name = "Rental Income";
                      }
                      else if (values == "Refunds") {
                        name = "Refunds";
                      }
                      else if (values == "Rebate") {
                        name = "Rebate";
                      }
                      else if (values == "Scholarships") {
                        name = "Scholarships";
                      }
                      else if (values == "Grants") {
                        name = "Grants";
                      }
                      else if (values == "Insurance") {
                        name = "Insurance";
                      }
                      else if (values == "Dividends") {
                        name = "Dividends";
                      }
                      else if (values == "Profit") {
                        name = "Profit";

                      }
                      else if (values == "Sales of Asset") {
                        name = "Sale of Asset";
                      }
                      else if (values == "Agricultural Income") {
                        name = "Agricultual Income";
                      }
                      else if (values == "Transfer to Demat Account") {
                        name = "Transfer to Demat Account";
                      }
                      else if (values == "Purchase of Bonds") {
                        name = "Purchase of Bonds";
                      }
                      else if (values == "FD") {
                        name = "FD";
                      }
                      else if (values == "Other Financial Products") {
                        name = "Other Financial Products";
                      }
                      else if (values == "Purchase of Heavy Metals") {
                        name = "Purchase of Heavy Metals";
                      }
                      else if (values == "Purchase of Paintings") {
                        name = "Purchase of Paintings";
                      }
                      else if (values == "Down Payment") {
                        name = "Down payment";

                      }

                      else if (values == "EMI") {
                        name = "EMI";

                      }
                      else if (values == "Insurance") {
                        name = "Insurance";

                      }

                      else if (values == "Fuel and Car Maintainance") {
                        name = "Fuel and Car Maintainance";

                      }
                      else if (values == "Bills") {
                        name = "Bills";

                      }
                      else if (values == "Shopping") {
                        name = "Shopping";

                      }
                      else if (values == "Health Related") {
                        name = "Health Related";

                      }
                      else if (values == "Food and Travel") {
                        name = "Food and Travel";

                      }
                      else if (values == "Educations") {
                        name = "Educations";

                      }
                      else if (values == "Repairs") {
                        name = "Repairs";

                      }
                      else if (values == "Entertainment") {
                        name = "Entertainment";

                      }
                      else if (values == "Agricultural Expenses") {
                        name = "Agricultual Expenses";
                      }

                      else if (values == "Loss Booking in Mutual Funds") {
                        name = "Loss Booking in Mutual Funds";
                      }
                      else if (values == "Loss Booking in Shares") {
                        name = "Loss Booking in Shares";
                      }

                      else if (values == "Loss Booking in FNO") {
                        name = "Loss Booking in FNO";
                      }
                      else if (values == "Loss in Business") {
                        name = "Loss in Business";
                      }
                      else if (values == "Loss in Agriculture") {
                        name = "Loss in Agriculture";
                      }
                      else if (values == "Fines/Challans") {
                        name = "Fines/Challans";
                      }
                      else if (values == "Convenience fees(Bribe)") {
                        name = "Convenience fees(Bribe)";
                      }
                      else if (values == "Tax Paid") {
                        name = "Tax Paid";
                      }


                      int miles = int.parse(milesController.text);
                      String dates=datesController.text;
                      int id = int.parse(idUpdateController.text);
                      if (_value == 1) {
                        types = "Incoming";
                        _update(id,name,names, miles,value);
                        _updateo(id,types,name,names,miles,value);
                      }
                      else if (_value == 2) {
                        types = "Investment";
                        _updates(id, name, names, miles, dates);
                        _updateo(id, types, name, names, miles, dates);
                      }
                      else if (_value == 3) {
                        types = "Expense";
                        _updateS(id, name, names, miles, dates);
                        _updateo(id, types, name, names, miles, dates);
                      }
                      else if (_value == 4) {
                        types = "Loss";
                        _updated(id, name, names, miles, dates);
                        _updateo(id, types, name, names, miles, dates);

                      }

                    },
                    color: Color(0XFF80CBC4),
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),

                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Finance Type',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _query(text);
                          });
                        } else {
                          setState(() {
                            carsByName.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByName[index].name}  ${carsByName[index].names}  ${carsByName[index].dates}  - ${carsByName[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Finance Subype',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _querys(text);
                          });
                        } else {
                          setState(() {
                            carsByNames.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByNames[index].name}  ${carsByNames[index].names}  ${carsByNames[index].dates}  - ${carsByNames[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),





        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ninad Shetye"),
                accountEmail: Text("carpedium1824@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "N",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home), title: Text("Home",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePages()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.stacked_bar_chart), title: Text("Stats",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Transactions",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EightRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Incoming",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Investment",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Expense",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ThirdRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Loss",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>_fourthroute()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.pie_chart), title: Text("Piechart",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyNativePaged()),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _insert(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnNames:names,
      DatabaseHelper.columnMiles: miles,
      DatabaseHelper.columnDates: dates,

    };



    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }
  void _insertS(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelperS.columnName: name,
      DatabaseHelperS.columnNames:names,
      DatabaseHelperS.columnMiles: miles,
      DatabaseHelperS.columnDates: dates,

    };



    Care care = Care.fromMap(row);
    final id = await dbHelperS.insert(care);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _inserts(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelpers.columnName: name,
      DatabaseHelpers.columnNames:names,
      DatabaseHelpers.columnMiles: miles,
      DatabaseHelpers.columnDates: dates,

    };



    Cars carss = Cars.fromMap(row);
    final id = await dbHelpers.insert(carss);
    _showMessageInScaffold('inserted row id: $id');
  }
  void _insertd(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelperd.columnName: name,
      DatabaseHelperd.columnNames:names,
      DatabaseHelperd.columnMiles: miles,
      DatabaseHelperd.columnDates: dates,

    };



    Caru caru = Caru.fromMap(row);
    final id = await dbHelperd.insert(caru);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _inserto(type,name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelpero.columnTypes: type,
      DatabaseHelpero.columnName: name,
      DatabaseHelpero.columnNames:names,
      DatabaseHelpero.columnMiles: miles,
      DatabaseHelpero.columnDates: dates,

    };



    Caro cars = Caro.fromMap(row);
    final id = await dbHelpero.insert(cars);
    _showMessageInScaffold('inserted row id: $id');
  }



  void _queryAll() async {
    final allRows = await dbHelpero.queryAllRows();
    caro.clear();
    allRows.forEach((row) => caro.add(Caro.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }

  void _query(name) async {
    final allRows = await dbHelpero.queryRowd(name);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Caro.fromMap(row)));
  }
  void _querys(name) async {
    final allRows = await dbHelpero.queryRowe(name);
    carsByNames.clear();
    allRows.forEach((row) => carsByNames.add(Caro.fromMap(row)));
  }

  void _queryRowCount() async{
    final RowCount=await dbHelper.queryRowCountd();
    incoming=RowCount;
  }

  void _updateo(id,types, name,names, miles,dates) async {
    // row to update
    Caro car = Caro(id,types, name, names,miles,dates);
    final rowsAffected = await dbHelpero.update(car);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }

  void _update(id, name,names, miles,dates) async {
    // row to update
    Car car = Car(id, name, names,miles,dates);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }
  void _updates(id, name,names, miles,dates) async {
    // row to update
    Cars carss = Cars(id, name, names,miles,dates);
    final rowsAffected = await dbHelpers.update(carss);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }
  void _updateS(id, name,names, miles,dates) async {
    // row to update
    Care care = Care(id, name, names,miles,dates);
    final rowsAffected = await dbHelperS.update(care);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }

  void _updated(id, name,names, miles,dates) async {
    // row to update
    Caru caru = Caru(id, name, names,miles,dates);
    final rowsAffected = await dbHelperd.update(caru);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }






  void _queries(names) async {
    final allRows = await dbHelper.queryRow(names);
    carsByNames.clear();
    allRows.forEach((row) => carsByNames.add(Caro.fromMap(row)));
  }
}




class SecondRoute extends StatefulWidget {
  SecondRoute({Key key}) : super(key: key);

  @override
  _MySecondRoute createState() => _MySecondRoute();
}

class _MySecondRoute extends State<SecondRoute> {
  bool disableddropdown= true;
      int _value = 1;
  String _values;
  int count=1;
  int incoming=0;
  String name;
  String names=" ";
  final dbHelper = DatabaseHelper.instance;

final web={
  "1" : "Wadia Hospital",
  "2" : "Holy Family Hospital",
  "3" : "Others",
};

  final app={
    "1" : "Home",
    "2" : "Equipment",
    "3" : "Miscellaneous",
  };

  final profit={
    "1" : "Shares",
    "2" : "Mutual Funds",
    "3" : "FNO",
    "4": "Other Business",
  };

  final asset={
    "1" : "Precious Metals",
    "2" : "Gems",
    "3" : "Property",
    "4": "Intelluctual",
    "5":"Cattle",
  };
List<DropdownMenuItem<String>>menuitems=List();

  List<Car> cars = [];
  List<Car> carsByName = [];
  List<Car> carsByNames = [];

  //controllers used in insert operation UI
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();

  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController namesUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController datesController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void populateweb(){
    for(String key in web.keys){
     menuitems.add(DropdownMenuItem<String>(
         child: Text(web[key], style: TextStyle(
           fontSize: 20.0,
           fontWeight: FontWeight.bold,

         )

         ),

         value: web[key],
     ));
    }
  }
  void populateapp(){
    for(String key in app.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(app[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: app[key],
      ));
    }
  }
  void populateprofit(){
    for(String key in profit.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(profit[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: profit[key],
      ));
    }
  }
  void populateasset(){
    for(String key in asset.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(asset[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: asset[key],
      ));
    }
  }

DateTime _dateTime=DateTime.now();
_selectedTododate(BuildContext) async{
  var _pickeddate=await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2000), lastDate: DateTime(2100));

  if(_pickeddate!=null){
    setState(() {
      _dateTime=_pickeddate;
      datesController.text=DateFormat('dd-MM-yyyy').format(_pickeddate);
    });
  }
}
  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }

  void valuechanged(value){
if(value==1){
  menuitems=[];
  populateweb();
  disableddropdown= false;
}
else if(value==2){
  menuitems=[];
  populateapp();
  disableddropdown= false;
}
else if(value==3){
  menuitems=[];
  disableddropdown= false;
}
else if(value==4){
  menuitems=[];
  disableddropdown= false;
}
else if(value==5){
  menuitems=[];
  disableddropdown= false;
}
else if(value==6){
  menuitems=[];
  disableddropdown= false;
}
else if(value==7){
  menuitems=[];
  disableddropdown= false;
}
else if(value==8){
  menuitems=[];
  disableddropdown= false;
}
else if(value==9){
  menuitems=[];
  populateprofit();
  disableddropdown= false;
}
else if(value==10){
  menuitems=[];
  populateasset();
  disableddropdown= false;
}

    setState(() {
      _value = value;
    });
  }
  void secondvaluechanged(value){


    setState(() {
      _values = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "View",
              ),
              Tab(
                text: "By Type",
              ),

              Tab(
                text: "By Subtype",
              ),
              Tab(
                text: "Total",
              ),

            ],
          ),
          title: Text('Incoming Amount'),
        ),
        body: TabBarView(

          children: [

            Container(

              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: cars.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == cars.length) {
                    return RaisedButton(
                      child: Text('Refresh',style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                      ),
                      onPressed: () {
                        setState(() {
                          _queryAll();
                        });
                      },
                      color: Color(0XFF80DEEA),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      );
                  }
                  return Container(
                    height: 40,
                    padding: EdgeInsets.all(5),
                    child:Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[

                          Container(

                            child: Text("${cars[index].id}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("${cars[index].name}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].names}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].miles}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].dates
                            }",style: TextStyle(color:Colors.black,fontSize:15),),
                          )
                        ]
                    ),

                  );
                },
              ),
            ),

            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Incoming Type',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _query(text);
                          });
                        } else {
                          setState(() {
                            carsByName.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByName[index].name}  ${carsByName[index].names}  ${carsByName[index].dates}  - ${carsByName[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Incoming Subtype',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _queries(text);
                          });
                        } else {
                          setState(() {
                            carsByNames.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByNames[index].name}  ${carsByNames[index].names}  ${carsByNames[index].dates}  - ${carsByNames[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: count + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == count) {
                    return RaisedButton(
                      child: Text('Refresh',style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                      ),
                      onPressed: () {
                        setState(() {
                          _queryRowCount();
                        });
                      },

                      color: Color(0XFF80DEEA),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    padding: EdgeInsets.all(5),
                    child:Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[

                          Container(

                            child: Text("Incoming till date",style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("$incoming",style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                            ),
                          ),

                        ]
                    ),

                  );
                },
              ),

            ),

          ],
        ),





        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ninad Shetye"),
                accountEmail: Text("carpedium1824@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "N",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home), title: Text("Home",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePages()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.stacked_bar_chart), title: Text("Stats",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Transactions",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EightRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Incoming",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Investment",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Expense",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ThirdRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Loss",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>_fourthroute()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.pie_chart), title: Text("Piechart",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyNativePaged()),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _insert(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnNames:names,
      DatabaseHelper.columnMiles: miles,
      DatabaseHelper.columnDates: dates,

    };
    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows.forEach((row) => cars.add(Car.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }

  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Car.fromMap(row)));
  }

  void _queryRowCount() async{
    final RowCount=await dbHelper.queryRowCountd();
    incoming=RowCount;
  }

  void _update(id, name,names, miles,dates) async {
    // row to update
    Car car = Car(id, name, names,miles,dates);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }

  void _queries(names) async {
    final allRows = await dbHelper.queryRow(names);
    carsByNames.clear();
    allRows.forEach((row) => carsByNames.add(Car.fromMap(row)));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool disableddropdown= true;
  bool disableddropdowns= true;
  int _value = 1;
  String _values;
  String _valuess;
  int count=1;
  int investment=0;
  String name;
  String names=" ";
  final dbHelper = DatabaseHelpers.instance;





  final down={
    "1" : "Business",
    "2" : "Purchase Of Property",
  };


  List<DropdownMenuItem<String>>menuitems=List();
  List<DropdownMenuItem<String>>menuitemss=List();

  List<Cars> cars = [];
  List<Cars> carsByName = [];
  List<Cars> carsByNames = [];

  //controllers used in insert operation UI
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();

  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController namesUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController datesController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  void populatedown(){
    for(String key in down.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(down[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: down[key],
      ));
    }
  }

  DateTime _dateTime=DateTime.now();
  _selectedTododate(BuildContext) async{
    var _pickeddate=await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2000), lastDate: DateTime(2100));

    if(_pickeddate!=null){
      setState(() {
        _dateTime=_pickeddate;
        datesController.text=DateFormat('dd-MM-yyyy').format(_pickeddate);
      });
    }
  }
  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }

  void valuechanged(value){
    if(value==7){
      menuitems=[];
      populatedown();
      disableddropdown= false;
    }



    setState(() {
      _value = value;
    });
  }
  void secondvaluechanged(value){


    setState(() {
      _values = value;
    });
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "View",
              ),
              Tab(
                text: "By Type",
              ),

              Tab(
                text: "By Subtype",
              ),
              Tab(
                text: "Total",
              ),

            ],
          ),
          title: Text('Investment'),
        ),
        body: TabBarView(
          children: [

            Container(

              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: cars.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == cars.length) {
                    return RaisedButton(
                      child: Text('Refresh',style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                      ),
                      onPressed: () {
                        setState(() {
                          _queryAll();
                        });
                      },

                      color: Color(0XFF80DEEA),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    padding: EdgeInsets.all(5),
                    child:Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[

                          Container(

                            child: Text("${cars[index].id}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("${cars[index].name}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].names}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].miles}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].dates
                            }",style: TextStyle(color:Colors.black,fontSize:15),),
                          )
                        ]
                    ),

                  );
                },
              ),
            ),

            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Investment type',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _query(text);
                          });
                        } else {
                          setState(() {
                            carsByName.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByName[index].name}  ${carsByName[index].names}  ${carsByName[index].dates}  - ${carsByName[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Investment Subtype',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _queries(text);
                          });
                        } else {
                          setState(() {
                            carsByNames.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByNames[index].name}  ${carsByNames[index].names}  ${carsByNames[index].dates}  - ${carsByNames[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: count + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == count) {
                    return RaisedButton(
                      child: Text('Refresh',style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                      ),
                      onPressed: () {
                        setState(() {
                          _queryRowCount();
                        });
                      },

                      color: Color(0XFF80DEEA),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    padding: EdgeInsets.all(5),
                    child:Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[

                          Container(

                            child: Text("Investment till date",style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("$investment",style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                            ),
                          ),

                        ]
                    ),

                  );
                },
              ),

            ),

          ],
        ),





drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ninad Shetye"),
              accountEmail: Text("carpedium1824@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "N",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Home",style: TextStyle(
              color: Color(0xFF212121),
              letterSpacing: 0.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyNativePages()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.stacked_bar_chart), title: Text("Stats",style: TextStyle(
              color: Color(0xFF212121),
              letterSpacing: 0.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyNativePage()),
                );
              },
            ),
            ListTile(
              title: Text("Transactions",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EightRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Incoming",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Investment",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text("Expense",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ThirdRoute()),
                );
              },
            ),
            ListTile(
              title: Text("Loss",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>_fourthroute()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart), title: Text("Piechart",style: TextStyle(
              color: Color(0xFF212121),
              letterSpacing: 0.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyNativePaged()),
                );
              },
            ),


          ],
        ),
      ),
      ),
    );
  }

  void _insert(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnNames:names,
      DatabaseHelper.columnMiles: miles,
      DatabaseHelper.columnDates: dates,

    };
    Cars car = Cars.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows.forEach((row) => cars.add(Cars.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }

  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Cars.fromMap(row)));
  }
  void _queries(name) async {
    final allRows = await dbHelper.queryRow(name);
    carsByNames.clear();
    allRows.forEach((row) => carsByNames.add(Cars.fromMap(row)));
  }

  void _queryRowCount() async{
    final RowCount=await dbHelper.queryRowCountf();
    investment=RowCount;
  }

  void _update(id, name,names, miles,dates) async {
    // row to update
    Cars car = Cars(id, name, names,miles,dates);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }

}
class ThirdRoute extends StatefulWidget {
  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  bool disableddropdown= true;
  bool disableddropdowns= true;
  int _value = 1;
  String _values;
  String _valuess;
  int count=1;
  int expense=0;
  String name;
  String names=" ";
  final dbHelper = DatabaseHelperS.instance;



  final emi={
    "1" : "Home",
    "2" : "Car",
    "3" : "Travel",
    "4" : "Business",
    "5" : "Miscellaneuos",
  };

  final insurance={
    "1" : "Professional Indemnity",
    "2" : "Life",
    "3" : "Car",
    "4" : "Health",
    "5" : "Equipments",
  };

  final car={
    "1" : "Petrol",
    "2" : "Car Related Maintanance",
  };

  final bill={
    "1" : "Phone",
    "2" : "Internet",
    "3" : "Home Maintainance",
    "4" : "Club Membership",
    "5" : "Tax Consultant",
    "6" : "Others",
  };

  final shopping={
    "1" : "Electronics",
    "2" : "Clothing",
    "3" : "Home and Beauty Products",
    "4" : "Fitness",
    "5" : "Parlours",
    "6" : "Pets",
    "7" : "Kids",
  };

  final health={
    "1" : "Hospital",
    "2" : "Medicines",
    "3" : "Fitness and Health Related Equipment",
  };

  final food={
    "1" : "Flight",
    "2" : "Train",
    "3" : "Stay",
    "4" : "Food(Out Of City)",
  };

  final education={
    "1" : "School Fees",
    "2" : "Books",
    "3" : "Classes",
    "4" : "Conferences or Courses",
  };

  final repair={
    "1" : "Household Equipment",
    "2" : "Electronics",
    "3" : "Miscellaneous",
  };
  final entertainment={
    "1" : "Movies",
    "2" : "Dinners",
    "3" : "Parties",
    "4" : "Others",
  };

  List<DropdownMenuItem<String>>menuitems=List();
  List<DropdownMenuItem<String>>menuitemss=List();

  List<Care> cars = [];
  List<Care> carsByName = [];
  List<Care> carsByNames = [];

  //controllers used in insert operation UI
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();

  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController namesUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController datesController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  void populateemi(){
    for(String key in emi.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(emi[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: emi[key],
      ));
    }
  }
  void populateinsurance(){
    for(String key in insurance.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(insurance[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: insurance[key],
      ));
    }
  }
  void populatecar(){
    for(String key in car.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(car[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: car[key],
      ));
    }
  }
  void populatebills(){
    for(String key in bill.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(bill[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: bill[key],
      ));
    }
  }
  void populateshopping(){
    for(String key in shopping.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(shopping[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: shopping[key],
      ));
    }
  }
  void populatehealth(){
    for(String key in health.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(health[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: health[key],
      ));
    }
  }
  void populatefood(){
    for(String key in food.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(food[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: food[key],
      ));
    }
  }
  void populateedu(){
    for(String key in education.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(education[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: education[key],
      ));
    }
  }
  void populaterepair(){
    for(String key in repair.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(repair[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: repair[key],
      ));
    }
  }
  void populateent(){
    for(String key in entertainment.keys){
      menuitems.add(DropdownMenuItem<String>(
        child: Text(entertainment[key], style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,

        )

        ),

        value: entertainment[key],
      ));
    }
  }
  DateTime _dateTime=DateTime.now();
  _selectedTododate(BuildContext) async{
    var _pickeddate=await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2000), lastDate: DateTime(2100));

    if(_pickeddate!=null){
      setState(() {
        _dateTime=_pickeddate;
        datesController.text=DateFormat('dd-MM-yyyy').format(_pickeddate);
      });
    }
  }
  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }

  void valuechanged(value){
    if(value==1){
      menuitems=[];
      populateemi();
      disableddropdown= false;
    }
    else if(value==2){
      menuitems=[];
      populateinsurance();
      disableddropdown= false;
    }
    else if(value==3) {
      menuitems = [];
      populatecar();
      disableddropdown = false;
    }
    else if(value==4) {
      menuitems = [];
      populatebills();
      disableddropdown = false;
    }
    else if(value==5) {
      menuitems = [];
      populateshopping();
      disableddropdown = false;
    }
    else if(value==6) {
      menuitems = [];
      populatehealth();
      disableddropdown = false;
    }
    else if(value==7) {
      menuitems = [];
      populatefood();
      disableddropdown = false;
    }
    else if(value==8) {
      menuitems = [];
      populateedu();
      disableddropdown = false;
    }
    else if(value==9) {
      menuitems = [];
      populaterepair();
      disableddropdown = false;
    }
    else if(value==10) {
      menuitems = [];
      populateent();
      disableddropdown = false;
    }
    setState(() {
      _value = value;
    });
  }
  void secondvaluechanged(value){

    setState(() {
      _values = value;
    });
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "View",
              ),
              Tab(
                text: "By Type",
              ),

              Tab(
                text: "By Subtype",
              ),
              Tab(
                text: "Total",
              ),

            ],
          ),
          title: Text('Expense'),
        ),
        body: TabBarView(
          children: [
            Container(

              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: cars.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == cars.length) {
                    return RaisedButton(
                      child: Text('Refresh',style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                      ),
                      onPressed: () {
                        setState(() {
                          _queryAll();
                        });
                      },

                      color: Color(0XFF80DEEA),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    padding: EdgeInsets.all(5),
                    child:Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[

                          Container(

                            child: Text("${cars[index].id}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("${cars[index].name}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].names}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].miles}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].dates
                            }",style: TextStyle(color:Colors.black,fontSize:15),),
                          )
                        ]
                    ),

                  );
                },
              ),
            ),

            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expense Type',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _query(text);
                          });
                        } else {
                          setState(() {
                            carsByName.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByName[index].name}  ${carsByName[index].names}  ${carsByName[index].dates}  - ${carsByName[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expense Subtype',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _queries(text);
                          });
                        } else {
                          setState(() {
                            carsByNames.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByNames[index].name}  ${carsByNames[index].names}  ${carsByNames[index].dates}  - ${carsByNames[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: count + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == count) {
                    return RaisedButton(
                      child: Text('Refresh',style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                      ),
                      onPressed: () {
                        setState(() {
                          _queryRowCount();
                        });
                      },

                      color: Color(0XFF80DEEA),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    padding: EdgeInsets.all(5),
                    child:Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[

                          Container(

                            child: Text("Expense till date",style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("$expense",style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                            ),
                          ),

                        ]
                    ),

                  );
                },
              ),

            ),

          ],
        ),





        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ninad Shetye"),
                accountEmail: Text("carpedium1824@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "N",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home), title: Text("Home",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePages()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.stacked_bar_chart), title: Text("Stats",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Transactions",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EightRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Incoming",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Investment",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Expense",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ThirdRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Loss",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>_fourthroute()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.pie_chart), title: Text("Piechart",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyNativePaged()),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _insert(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnNames:names,
      DatabaseHelper.columnMiles: miles,
      DatabaseHelper.columnDates: dates,

    };
    Care car = Care.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows.forEach((row) => cars.add(Care.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }

  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Care.fromMap(row)));
  }
  void _queries(name) async {
    final allRows = await dbHelper.queryRow(name);
    carsByNames.clear();
    allRows.forEach((row) => carsByNames.add(Care.fromMap(row)));
  }

  void _queryRowCount() async{
    final RowCount=await dbHelper.queryRowCounte();
    expense=RowCount;
  }

  void _update(id, name,names, miles,dates) async {
    // row to update
    Care car = Care(id, name, names,miles,dates);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }


}
class _fourthroute extends StatefulWidget{
  @override
  _MyfourthrouteState createState() => _MyfourthrouteState();
}
class _MyfourthrouteState extends State<_fourthroute>
{
  bool disableddropdown= true;
  bool disableddropdowns= true;
  int _value = 1;
  String _values;
  String _valuess;
  int count=1;
  int loss=0;
  String name;
  String names=" ";
  final dbHelper = DatabaseHelperd.instance;



  List<DropdownMenuItem<String>>menuitems=List();
  List<DropdownMenuItem<String>>menuitemss=List();

  List<Caru> cars = [];
  List<Caru> carsByName = [];
  List<Caru> carsByNames = [];

  //controllers used in insert operation UI
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();

  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController namesUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController datesController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  DateTime _dateTime=DateTime.now();
  _selectedTododate(BuildContext) async{
    var _pickeddate=await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2000), lastDate: DateTime(2100));

    if(_pickeddate!=null){
      setState(() {
        _dateTime=_pickeddate;
        datesController.text=DateFormat('dd-MM-yyyy').format(_pickeddate);
      });
    }
  }
  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }

  void valuechanged(value){

    setState(() {
      _value = value;
    });
  }
  void secondvaluechanged(value){

    setState(() {
      _values = value;
    });
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [

              Tab(
                text: "View",
              ),
              Tab(
                text: "By Type",
              ),

              Tab(
                text: "By Subtype",
              ),
              Tab(
                text: "Total",
              ),

            ],
          ),
          title: Text('Losses Incurred'),
        ),
        body: TabBarView(
          children: [
            Container(

              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: cars.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == cars.length) {
                    return RaisedButton(
                      child: Text('Refresh',style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                      ),
                      onPressed: () {
                        setState(() {
                          _queryAll();
                        });
                      },

                      color: Color(0XFF80DEEA),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    padding: EdgeInsets.all(5),
                    child:Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[

                          Container(

                            child: Text("${cars[index].id}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("${cars[index].name}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].names}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].miles}",style: TextStyle(color:Colors.black,fontSize:15),),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("${cars[index].dates
                            }",style: TextStyle(color:Colors.black,fontSize:15),),
                          )
                        ]
                    ),

                  );
                },
              ),
            ),

            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Loss Type',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _query(text);
                          });
                        } else {
                          setState(() {
                            carsByName.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByName[index].name}  ${carsByName[index].names}  ${carsByName[index].dates}  - ${carsByName[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Loss Subtype',
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _queries(text);
                          });
                        } else {
                          setState(() {
                            carsByNames.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: carsByNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              ' ${carsByNames[index].name}  ${carsByNames[index].names}  ${carsByNames[index].dates}  - ${carsByNames[index].miles} rupees',
                              style: TextStyle(fontSize: 18),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: count + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == count) {
                    return RaisedButton(
                      child: Text('Refresh',style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                      ),
                      onPressed: () {
                        setState(() {
                          _queryRowCount();
                        });
                      },

                      color: Color(0XFF80DEEA),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    padding: EdgeInsets.all(5),
                    child:Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[

                          Container(

                            child: Text("Loss till date",style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("$loss",style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                            ),
                          ),

                        ]
                    ),

                  );
                },
              ),

            ),

          ],
        ),





        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ninad Shetye"),
                accountEmail: Text("carpedium1824@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "N",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home), title: Text("Home",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),

              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePages()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.stacked_bar_chart), title: Text("Stats",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),

              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNativePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Transations",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),

                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EightRoute()),
                  );
                },
              ),

              ListTile(
                title: Text("Incoming",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),

                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Investment",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),

                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: Text("Expense",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),

                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ThirdRoute()),
                  );
                },
              ),
              ListTile(
                title: Text("Loss",style: TextStyle(
                  color: Color(0xFF212121),
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),

                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>_fourthroute()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.pie_chart), title: Text("Piechart",style: TextStyle(
                color: Color(0xFF212121),
                letterSpacing: 0.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),

              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MyNativePaged()),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _insert(name, names,miles,dates) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnNames:names,
      DatabaseHelper.columnMiles: miles,
      DatabaseHelper.columnDates: dates,

    };
    Caru car = Caru.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows.forEach((row) => cars.add(Caru.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }

  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Caru.fromMap(row)));
  }
  void _queries(name) async {
    final allRows = await dbHelper.queryRow(name);
    carsByNames.clear();
    allRows.forEach((row) => carsByNames.add(Caru.fromMap(row)));
  }
  void _queryRowCount() async{
    final RowCount=await dbHelper.queryRowCountc();
    loss=RowCount;
  }

  void _update(id, name,names, miles,dates) async {
    // row to update
    Caru car = Caru(id, name, names,miles,dates);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }


}


class fifthpage extends StatefulWidget {
  @override
  _MyfifthpageState createState() => _MyfifthpageState(incoming,expense,investment,loss);
  int incoming;
  int expense;
  int loss;
  int investment;
  fifthpage({this.incoming,this.expense,this.investment,this.loss});

}

class _MyfifthpageState extends State<fifthpage> {
  List<PieChartSectionData> _sections = List<PieChartSectionData>();
  final dbHelper = DatabaseHelper.instance;
  final dbHelpers = DatabaseHelpers.instance;
  final dbHelperS = DatabaseHelperS.instance;
  final dbHelperd=DatabaseHelperd.instance;
  int incoming;
  int investment;
  int expense;
  int loss;

  _MyfifthpageState(this.incoming,this.expense,this.investment,this.loss);

  int total;


  double i;
  double o;
  double e;
  double l;

  double ii;
  double oo;
  double ee;
  double ll;

  void _queryRowCounts() async{
    final RowCount=await dbHelper.queryRowCountd();
    incoming=RowCount;


  }
  void _queryRowCounte() async{
    final RowCount=await dbHelperS.queryRowCounte();
    expense=RowCount;

  }
  void _queryRowCountc() async{
    final RowCount=await dbHelperd.queryRowCountc();
    loss=RowCount;

  }
  void _queryRowCountf() async{
    final RowCount=await dbHelpers.queryRowCountf();
    investment=RowCount;

  }
  void value_changed(){

    setState(() {


      total=incoming+loss+expense+investment;
      i=(incoming/total)*100;


      o=(investment/total)*100;

      e=(expense/total)*100;
      l=(loss/total)*100;
      ii=(i).roundToDouble();
      oo=(o).roundToDouble();
      ll=(l).roundToDouble();
      ee=(e).roundToDouble();

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value_changed();


    PieChartSectionData _item1=PieChartSectionData(
      color: Colors.blueAccent,
      value: i,
      title: 'incoming:$ii%',
      radius: 50,
      titleStyle:
      TextStyle(color:Colors.black,fontSize: 12),);
    PieChartSectionData _item2=PieChartSectionData(
      color: Colors.yellow,
      value: o,
      title: 'investment:$oo%',
      radius: 50,
      titleStyle:
      TextStyle(color:Colors.black,fontSize: 12),);
    PieChartSectionData _item3=PieChartSectionData(
      color: Colors.green,
      value: e,
      title: 'expense:$ee%',
      radius: 50,
      titleStyle:
      TextStyle(color:Colors.black,fontSize: 12),);
    PieChartSectionData _item4=PieChartSectionData(
      color: Colors.red,
      value: l,
      title: 'loss:$ll%',
      radius: 50,
      titleStyle:
      TextStyle(color:Colors.black,fontSize: 12),);
    _sections=[_item1,_item2,_item3,_item4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(



                child:SizedBox(
                  height: 300,
                  width: 400,
                  child: FlChart(
                    chart: PieChart(PieChartData(sections: _sections)),
                  ),
                ),
              ),



    );
  }
}



