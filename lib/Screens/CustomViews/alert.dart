import 'package:flutter/material.dart';

void dialog(String message,BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return Container(
        child: AlertDialog(
          title: new Text("Error!"),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}