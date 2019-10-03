class AuthenticationObject {
  UserData data;
  Status status;

  AuthenticationObject({this.data,this.status});

  factory AuthenticationObject.fromJson(Map<String,dynamic> parsedJson) {
    return AuthenticationObject(
        data: UserData.fromJson(parsedJson["data"]),
        status: Status.fromJson(parsedJson["status"])
    );
  }
}

class UserData {
  String firstName;
  String lastName;
  int userId;
  String language;

  UserData({this.firstName, this.lastName, this.language, this.userId});

  factory UserData.fromJson(Map<String, dynamic> parsedJson) {
    return UserData(
      firstName: parsedJson["firstName"],
      lastName: parsedJson["lastName"],
      userId: parsedJson["userId"],
      language: parsedJson["lang"],
    );
  }
  Map<dynamic, dynamic> toMap() {
    var map=new Map<String, dynamic>();
    map["firstname"]=firstName;
    map["lastname"]=lastName;
    map["userId"]=userId;
    map["lang"]=language;
    return map;
  }
}

class Status {
  List<Message> messageList;
  int messageCode;

  Status({this.messageCode,this.messageList});

  factory Status.fromJson(dynamic parsedJson) {
    var messageList = parsedJson["messageList"] as List;
    List<Message> listOfmessage = messageList.map((i) => Message.fromJson(i)).toList();
    return Status(
      messageList: listOfmessage,
      messageCode: parsedJson["messageCode"]
    );
  }
}

class Message {
  Message();
  factory Message.fromJson(dynamic parsedJson) {
    return Message();
  }
}


class GenericResponseModel {
  GenericDataModel genericDataModel;
  Status status;

  GenericResponseModel({this.genericDataModel,this.status});

  factory GenericResponseModel.fromJson(Map<String, dynamic> parsedJson, String itemName) {
    return GenericResponseModel(
      genericDataModel: GenericDataModel.fromJson(parsedJson["data"], itemName),
      status: Status.fromJson(parsedJson["status"])
    );
  }
}

class GenericDataModel {
  List<GenericModel> genericModel;
  int projectId;

  // genericResponseModel.genericDataModel.genericModel[j].generic[k].runtimeType

  GenericDataModel({this.genericModel,this.projectId});

  factory GenericDataModel.fromJson(Map<String, dynamic> parsedJson, String itemName) {
    var genericModelList = parsedJson[itemName] as List;
    List<GenericModel> listOfGenericModel = genericModelList.map((i) => GenericModel.fromJson(i)).toList();
    return GenericDataModel(
      genericModel: listOfGenericModel,
      projectId: parsedJson["projectId"]
    );
  }
}

class GenericModel {
  Map<String, dynamic> generic;

  GenericModel({this.generic});

  factory GenericModel.fromJson(Map<String, dynamic> parsedJson) {
    // parsedJson.forEach((k,v) {
    //   if(parsedJson[k].runtimeType.toString() == "List<dynamic>") {}
    //   print(parsedJson[k].runtimeType);
    // });
    return GenericModel(
      generic: parsedJson
    );
  }
}