
import 'package:flutter/material.dart';
import 'json_to_form.dart';
import 'jsondata.dart';
import 'dart:convert';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Render(),
    );
  }
}

class Render extends StatefulWidget {
  const Render({
    this.formItems,
  });
  final dynamic formItems;

  @override _RenderState createState() => _RenderState();
}

class _RenderState extends State<Render> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          child: new Column(children: <Widget>[
            new CoreForm(
              form: form,

            ),
            new RaisedButton(
                child: new Text('Send'),
                onPressed: () {
                    print(result.toString());
                    message();

                })
          ]),
        ),
      ),
    );
  }
  String message(){
    int i;
    String msg=' ';
    dynamic formItems=json.decode(json.encode(result));
    for( i=0;i<formItems.length;i++) {
      if (formItems[i]['type'] == 'text') {
        if (formItems[i]['response']== null)
          {
             msg= msg + formItems[i]['id'] + ' cannot be empty \n';
            print(msg);
          }
      }
    }
    if(msg==" ")
      return msg;
else {
  _showDialog(msg);
//  ShowAlert(message: msg,);
     // ShowAlert(message: msg,);
    }
  }
  void _showDialog(String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog

        return AlertDialog(
          title: new Text("Error!"),
          content: new Text(message ,style:new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close",style:new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
