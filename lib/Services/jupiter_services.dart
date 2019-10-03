import 'package:http/http.dart' as http;
import 'package:jupiter/Constant/string_constant.dart';
import 'dart:async';
import 'dart:io';
import 'package:jupiter/Models/user.dart';
import 'package:jupiter/Screens/Views/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

String finalCookies ="";

Future<dynamic> fetchUserApi(User user) async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String userName = user.userName;
  String password = user.password;
  String deviceId;
  String deviceOsModel;
  String deviceModel;
  if(Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    deviceId = iosDeviceInfo.identifierForVendor;
    deviceOsModel = iosDeviceInfo.systemName+iosDeviceInfo.systemVersion;
    deviceModel = iosDeviceInfo.utsname.machine;
  }else if(Platform.isAndroid) {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    deviceId = androidDeviceInfo.androidId;
    deviceOsModel = androidDeviceInfo.version.baseOS;
    deviceModel = androidDeviceInfo.model;
  }

  if(deviceOsModel=="") {deviceOsModel="Device OS";}

  String firebaseToken = await firebaseMessaging.getToken();
  String theBody = '{"userName": "$userName","password": "$password","deviceId": "$deviceId","deviceModel": "$deviceModel","firebaseToken": "$firebaseToken","os": "$deviceOsModel"}';
  // String theBody = '{"userName": "shweta.singh@petroitg.com","password": "Shweta@123","deviceId": "123456","firebaseToken": "$firebaseToken","deviceModel": "SamsungS10","os": "Android 10"}';
  final response = await http.post('$userApiUrl',
    headers: {
      HttpHeaders.contentTypeHeader: contentHeader,
      HttpHeaders.authorizationHeader: '',
      'App-Type': appType
    },
    body: theBody
  );
  if(response.headers.containsKey("set-cookie")){
    String cookies = response.headers["set-cookie"].split(";")[0].trim();
    finalCookies = cookies;
    setCookies(finalCookies);
  }
  return response;
}
Future<String> setCookies(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(cookies, value);
  return prefs.toString();
}

Future<String> getCookies() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(cookies) ?? "";
}