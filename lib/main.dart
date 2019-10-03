import 'package:flutter/material.dart';
import 'package:jupiter/Routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Views/home.dart';
import 'Screens/Views/splash_screen.dart';
import 'Services/firebaseFunctions.dart';

String baseUrl = "";
bool isFirstLogin = true;

void main() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(sharedPreferences.containsKey("FirstTimeLogin")==true) {
    isFirstLogin = false;
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new FlutterApp());
  });
  baseUrl = await remoteConfig();
}

class FlutterApp extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Login App',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: routes,
    );
  }
}