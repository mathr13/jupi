import 'package:flutter/material.dart';
import 'package:jupiter/Screens/Views/dev_tools.dart' as prefix0;
class DropdownButtonHint extends StatefulWidget {
  @override
  _DropdownButtonState createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButtonHint> {
  final List<String> _dropdownValues = [
    "Computer 1",
    "Computer 2",
    "Computer 3",
    "Computer 4",
    "Computer 5",
  ]; //The list of values we want on the dropdown
String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
                margin: new EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: new Text("Computers",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0))),
            new Container(
              child: DropdownButton(
                value: dropdownValue,
                items: _dropdownValues.map((value) => DropdownMenuItem(
                  child: Text(value),
                  value: value,
                )).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                isExpanded: false,
                hint: Text('Select'),

              ),
            ),
          ]),
    );
  }
}
