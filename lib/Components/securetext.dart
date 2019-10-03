import 'package:flutter/material.dart';

class SecureText extends StatefulWidget {
  final String text;
  final TextEditingController textController;

  SecureText({ this.text, this.textController});

  @override
  SecureTextState createState() => SecureTextState();
}

class SecureTextState extends State<SecureText> {
  bool _obscureText = true;
  Icon _password = Icon(Icons.visibility_off);

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
                            //color: Colors.pink
                        )
                        ),
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
                            //color: Colors.blue
                        )),
                      ])),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: TextField(
                        style: (TextStyle(
                            fontSize: queryData.size.width * devicePixelRatio * 0.015)),
                        decoration: InputDecoration(
                  suffixIcon: IconButton(icon: _password, onPressed: isVisible,iconSize:  queryData.size.width * devicePixelRatio * 0.02),
                ),
                        controller: widget.textController,
                        obscureText: _obscureText,
                      ),
                    ),
                  ),
                ],
              ),
            ))
    );
  }
  void isVisible() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true)
        _password = Icon(Icons.visibility_off);
      else
        _password = Icon(Icons.visibility);
//      print(_obscureText);
    });
  }
}
