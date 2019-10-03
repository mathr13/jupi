import 'package:flutter/material.dart';


class Progress extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
       color: Colors.white,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.green),
              strokeWidth: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}