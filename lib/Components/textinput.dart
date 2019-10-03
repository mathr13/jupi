import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String text;
  final TextEditingController textController;

  TextInput({this.text, this.textController});

  @override
  TextInputState createState() => TextInputState();
}

class TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    return Container(
        child: SafeArea(
            child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(flex: 1, child: Container(
                   // color: Colors.pink
                )),
                Expanded(
                  flex: 2,
                  child: new Text(widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:
                            (queryData.size.width * devicePixelRatio * 0.015),
                      )),
                ),
                Expanded(flex: 1, child: Container(
                  //  color: Colors.blue
                )),
              ])),
          Expanded(
            flex: 1,
            child: Container(
              child: TextField(
                style: (TextStyle(
                    fontSize: queryData.size.width * devicePixelRatio * 0.015)),
                controller: widget.textController,
              ),
            ),
          ),
        ],
      ),
    ))
        );
  }
}
