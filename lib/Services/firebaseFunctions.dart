import 'dart:async';
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:jupiter/Constant/string_constant.dart';
import 'package:jupiter/Databasehelper/databaseHelper.dart';
import 'package:jupiter/Models/models.dart';
import 'package:jupiter/Screens/Views/home.dart';
import 'package:jupiter/Screens/Views/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'jupiter_utlis.dart';

String notifResponse = "";
List<Map<String, dynamic>> result = [];
List<Map<String, dynamic>> parameter = [];
dynamic responseApi;
var db = new DatabaseHelper();

Future<void> getDatafromFirebase(context) async {
  firebaseMessaging.configure(
    onMessage: (dynamic response) async {
      final notifResponse = json.decode(response[responseData]);
      print(notifResponse.length);
      for(int i=0;i<notifResponse.length;i++) {
        db.populateTableWithMapping(notificationTable, notifResponse[i]);
        print(notifResponse[i]);
      }
    },
    onLaunch: (a) async {
      print(a);
    },
    onResume: (a) async {
      print(a);
    }
  );
}

void getProjectData() async {

  //Fetch Notification Data From Database
  result = await db.fetchInitNotificationRecords();
  if (result.length == 0){result = await db.fetchInitNotificationRecordsForDefaultProject();}
  if(result.length == 0) {result = await db.fetchFirstProject();}

  for(int i=0;i<result.length;i++) {
    parameter.add(json.decode(result[i][parameters]));
    parameter[i].forEach((k,v) {
      String key = k;
      parameter[i][key] = result[i][k];
    });
    responseApi = await callApi(result[i][modelUri], parameter[i].toString());
    final responseOfApi = json.decode(responseApi.body);
    GenericResponseModel genericResponseModel = new GenericResponseModel.fromJson(responseOfApi, result[i]["message"]);
    for(int j=0;j<genericResponseModel.genericDataModel.genericModel.length;j++) {
      db.populateTableWithCustomColumn(result[i]["message"], genericResponseModel.genericDataModel.genericModel[j].generic,"projectId",genericResponseModel.genericDataModel.projectId);
    }
  }
}

void saveMasterData(List<Map> result) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  for(int i=0;i<result.length;i++) {
    parameter.add(json.decode(result[i][parameters]));
    parameter[i].forEach((k,v) {
      String key = k;
      parameter[i][key] = result[i][k];
    });
    responseApi = await callApi(result[i][modelUri], parameter[i].toString());
    final responseOfApi = json.decode(responseApi.body);
    GenericResponseModel genericResponseModel = new GenericResponseModel.fromJson(responseOfApi, result[i]["message"]);
    for(int j=0;j<genericResponseModel.genericDataModel.genericModel.length;j++) {
      db.populateTableWithCustomColumn(result[i]["message"], genericResponseModel.genericDataModel.genericModel[j].generic,"projectId",genericResponseModel.genericDataModel.projectId);
    }

    //To save defaultProjectId in Persistent Storage
    for(int j=0;j<genericResponseModel.genericDataModel.genericModel.length;j++) {
      if(result[i]["message"] == "PROJECT" && genericResponseModel.genericDataModel.genericModel[j].generic["defaultProject"] == true) {
        sharedPreferences.setInt('projectId', genericResponseModel.genericDataModel.genericModel[j].generic["projectId"]);
        break;
      }
    }
    if(sharedPreferences.get('projectId') == null && result[i]["message"] == "PROJECT") {
      sharedPreferences.setInt('projectId', genericResponseModel.genericDataModel.genericModel[0].generic["projectId"]);
    }
  }
}

void checkIfDataIsStored(context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  db.checkLabelData().then((labelData) {
    if(labelData>0) {
      sharedPreferences.setBool("FirstTimeLogin", false);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Menus()));
    }
    else {checkIfDataIsStored(context);}
  });
}

Future<String> remoteConfig() async {
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: false));
  remoteConfig.setDefaults(<String, dynamic>{
    'baseURL': 'https://on.petroit.com/mozaic/services',
  });
  // await remoteConfig.fetch();
  await remoteConfig.activateFetched();
  // await remoteConfig.fetch(expiration: const Duration(seconds: 1));
  await remoteConfig.activateFetched();
  return remoteConfig.getValue("baseURL").asString();
}