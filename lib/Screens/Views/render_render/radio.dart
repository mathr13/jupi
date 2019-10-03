import 'package:flutter/material.dart';
import 'Databasehelper.dart';
class CustomRadio extends StatefulWidget {
  const CustomRadio({
    @required this.onChanged,
    this.item,
    this.count,
    this.formItems,
  });

  final int count;
  final Map item;
  final ValueChanged<dynamic> onChanged;
  final dynamic formItems;


  @override
  _CustomState createState() => _CustomState();

}



class _CustomState extends State<CustomRadio> {
  String value;
  int radioValue;


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
                child: new Text(widget.item['label'],
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0))),
            new Container(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: column()),
            ),
          ]),
    );
  }

  List<Widget> column() {

    List<Widget> radioList=new List<Widget>();
    radioValue=widget.item['value'];
    for (var i=0; i < widget.item['list'].length; i++) {
      radioList.add(new Row(children: <Widget>[
        new Expanded(
            child: new Text(
                widget.formItems[widget.count]['list'][i]['title'])),
        new Radio<int>(
            value: widget.formItems[widget.count]['list'][i]['value'],
            groupValue: radioValue,
            onChanged: (int value) {
              this.setState(() {
                radioValue=value;
                widget.formItems[widget.count]['value']=value;
                _handleChanged();
              });
            })
      ]));
    }
    return radioList;
  }

  void _handleChanged() {
    widget.onChanged(widget.formItems);
  }
}