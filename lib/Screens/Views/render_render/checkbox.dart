import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
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

class _CustomState extends State<CustomCheckBox> {
  String value;
  dynamic response;


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
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
              child:Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: column()
              ),
            ),
          ]
      ),
    );
  }
  List<Widget> column() {
    List<Widget> checkboxList = new List<Widget>();

    for (var i = 0; i < widget.item['list'].length; i++) {
      checkboxList.add(new Row(children: <Widget>[
        new Expanded(
            child: new Text(widget.formItems[widget.count]['list'][i]['title'])),
        new Checkbox(
            value: widget.formItems[widget.count]['list'][i]['value'],
            onChanged: (bool value) {
              this.setState(() {
                widget.formItems[widget.count]['list'][i]['value'] = value;
                _handleChanged();
              });
            })
      ]));
    }
    return checkboxList;

  }
  void _handleChanged() {
    widget.onChanged(widget.formItems);
  }
}




