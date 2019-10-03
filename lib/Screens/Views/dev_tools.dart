import 'package:flutter/material.dart';
import 'package:jupiter/Databasehelper/databaseHelper.dart';
import 'package:jupiter/Services/jupiter_utlis.dart';

List<String> _tablesData = [];
String dropdownValue;
Widget buildbody = null;
var count;
var data ;
ScrollController _scrollController = new ScrollController();

class DevTools extends StatefulWidget {
  @override _DevToolsState createState() => _DevToolsState();
}

Future getDataOfSystemTable() async {
  for(int i=0;i<fetchedTableData.length;i++) {
    _tablesData.add(fetchedTableData[i]['tableName']);
  }
}

class _DevToolsState extends State<DevTools> {
  @override Widget build(BuildContext context) {
    if(_tablesData.length==0) {getDataOfSystemTable();}
    return WillPopScope(
      onWillPop: () async {
        dropdownValue = null;
        return true;
      },
      child: Scaffold(
      resizeToAvoidBottomPadding: false, 
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DropdownButton<String>(
            value: dropdownValue,
            items: _tablesData.map((String value) => DropdownMenuItem<String>(
              child: Text(value),
              value: value,
            )).toList(),
            onChanged: (String newValue) async {
              var db = new DatabaseHelper();
              data = await db.fetchData(newValue);
              count = await db.count(newValue);
              setState(() {
                dropdownValue = newValue;
                buildbody = form();
              });
            },
            isExpanded: false,
            hint: Text('Select'),
          ),
          Container(
            child:buildbody
          )
        ]
      ),
      )
    ),
    );
  }

  Widget form() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Count = '+ count[0]['COUNT(1)'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: count[0]['COUNT(1)'],
            itemBuilder: (context, int index) {
              return new Text(
                data[index].toString(),
                style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)
              );
            }
          ),
        ],
      )
    );
  }
}