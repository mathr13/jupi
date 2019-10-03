//import 'package:flutter/material.dart';
//class ShowAlert extends StatefulWidget {
//  String message;
//
//  ShowAlert({this.message});
//
//  @override
//  _ShowAlertState createState() => _ShowAlertState();
//}
//
//class _ShowAlertState extends State<ShowAlert> {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return AlertDialog(
//      title: new Text("Error!"),
//      content: new Text(
//        widget.message,
//        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//      ),
//      actions: <Widget>[
//// usually buttons at the bottom of the dialog
//        new FlatButton(
//          child: new Text(
//            "Close",
//            style:
//            new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//          ),
//          onPressed: () {
//            Navigator.of(context).pop();
//          },
//        ),
//      ],
//    );
//  }
//}