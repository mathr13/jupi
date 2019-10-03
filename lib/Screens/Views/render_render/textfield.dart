import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomText extends StatefulWidget {
  const CustomText({
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

class _CustomState extends State<CustomText> {
  String value;
  dynamic response;

  @override
  Widget build(BuildContext context) {
    widget.formItems[widget.count]['response'] = null;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(
              padding: new EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: new Text(addAsterisk(),
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              )),
          (new TextField(
            controller: null,
            decoration: new InputDecoration(
              hintText: widget.item['id'] ?? "",
            ),
//            maxLines: widget.item['type'] == "text" ? 10 : 1,
            keyboardType: selectType(),
            //       inputFormatters: [WhitelistingTextInputFormatter(RegExp(widget.menus['regex'])),],
            inputFormatters: <TextInputFormatter>[
//              WhitelistingTextInputFormatter(RegExp(widget.item['regex'])),
              BlacklistingTextInputFormatter.singleLineFormatter,
            ],
            onChanged: (String value) {
              widget.formItems[widget.count]['response'] = value;
              _handleChanged();
            },
            obscureText: widget.item['type'] == "Password" ? true : false,
          )),
        ],
      ),
    );
  }

  void _handleChanged() {
    widget.onChanged(widget.formItems);
  }
  TextInputType selectType (){
    if(widget.item['subType']=='text')
      return TextInputType.text;
    else if(widget.item['subType']=='number')
      return TextInputType.number;
    else if(widget.item['subType']=='decimal')
      return TextInputType.phone;
  }
  String addAsterisk(){
    if(widget.item['constraint']=='MANDATORY')
      return '*'+widget.item['label'];
    else
      return widget.item['label'];

  }

}
