
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'switch.dart';
import 'radio.dart';
import 'textfield.dart';
import 'checkbox.dart';
import 'jsondata.dart';
import 'Databasehelper.dart';
import 'CustomDropdown.dart';
dynamic result;

class CoreForm extends StatefulWidget {
   CoreForm({
    @required this.form,
  });

  final String form;

  @override
  _CoreFormState createState() =>
      new _CoreFormState();
}

class _CoreFormState extends State<CoreForm> {
   dynamic formItems=json.decode(form);
  List<Widget> jsonToForm() {
    var info = json.decode(json.encode(inputData));
    Data data = Data.fromJson(info);
    for (int i = 0; i < data.lov.length; i++) {
      var db = new DatabaseHelper();
      db.insert(data.lov[i].pro);
    }
    List<Widget> listWidget = new List<Widget>();
    for (var count = 0; count < formItems.length; count++) {
      Map item = formItems[count];

      if (item['type'] == "text" ||
          item['type'] == "Password") {
        listWidget.add(
            CustomText(item: item, count: count, onChanged: (dynamic response) {
              result = response;
            }, formItems: formItems,));
      }
      else if (item['type'] == "RadioButton") {
//        var db = new DatabaseHelper();
//        db.fetchData(item['lov']).then((data) {
//          print(data);
        listWidget.add(CustomRadio(
          item: item, count: count, onChanged: (dynamic response) {
          result = response;
        }, formItems: formItems,));
//        });
      }

      else if (item['type'] == "Switch")
        listWidget.add(CustomSwitch(
          item: item, count: count, onChanged: (dynamic response) {
          result = response;
        }, formItems: formItems,));
      else if (item['type'] == "Checkbox")
        listWidget.add(CustomCheckBox(
          item: item, count: count, onChanged: (dynamic response) {
          result = response;
        }, formItems: formItems,));
      else if (item['type'] == "dropDown")
        listWidget.add(DropdownButtonHint());
    }
    return listWidget;

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      padding: new EdgeInsets.all(8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: jsonToForm(),
      ),
    );
  }
}
