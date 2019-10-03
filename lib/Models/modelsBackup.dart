class TopObject {
  UserData data;
  Status status;

  TopObject({this.data,this.status});

  factory TopObject.fromJson(Map<String,dynamic> parsedJson) {
    return TopObject(
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

  List<ProjectItem> projects;

  UserData({this.firstName, this.lastName, this.language, this.userId,this.projects});

  factory UserData.fromJson(Map<String, dynamic> parsedJson) {
    var projectList = parsedJson['projects'] as List;
    List<ProjectItem> theProjects = projectList.map((i) => ProjectItem.fromJson(i)).toList();
    return UserData(
        firstName: parsedJson["firstName"],
        lastName: parsedJson["lastName"],
        userId: parsedJson["userId"],
        language: parsedJson["lang"],
        projects: theProjects
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


class  ProjectItem{
  Map<String, dynamic> pro;

  ProjectItem({this.pro});

  factory ProjectItem.fromJson(dynamic projectValue){
    return ProjectItem(
        pro: projectValue
    );
  }
}

class ApexObject {
  MenuData menuData;
  Status status;

  ApexObject({this.menuData,this.status});

  factory ApexObject.fromJson(Map<String, dynamic> parsedJson) {
    return ApexObject(
        menuData: MenuData.fromJson(parsedJson["data"]),
        status: Status.fromJson(parsedJson["status"])
    );
  }
}

class MenuData {
  String projectName;
  int projectId;
  //TODO: PERMISIONS
  List<MenuItem> menus;
  List<GlobalVariablesItem> globalVariables;

  MenuData({this.projectId,this.projectName,this.globalVariables,this.menus});

  factory MenuData.fromJson(Map<String, dynamic> parsedJson) {
    var menuList = parsedJson['menus'] as List;
    List<MenuItem> theMenus = menuList.map((i) => MenuItem.fromJson(i)).toList();
    var globalVariablesList = parsedJson['globalVariables'] as List;
    List<GlobalVariablesItem> theGlobalVariables = globalVariablesList.map((i) => GlobalVariablesItem.fromJson(i)).toList();
    return MenuData(
        projectName: parsedJson["projectName"],
        projectId: parsedJson["projectId"],
        menus: theMenus,
        globalVariables: theGlobalVariables
    );
  }
}

 class MenuItem {
   int menuIndex;
   String menuId;
   String menuUrl;
   String perm;
   List<SubMenuItem> sunMenuItems;

   MenuItem({this.menuId,this.menuIndex,this.menuUrl,this.perm,this.sunMenuItems});

   factory MenuItem.fromJson(Map<String, dynamic> parsedJson) {
     var menuList = parsedJson['menus'] as List;
     List<SubMenuItem> theMenus = menuList.map((i) => SubMenuItem.fromJson(i)).toList();
     return MenuItem(
       menuId: parsedJson["menuId"],
       menuIndex: parsedJson["menuIndex"],
       menuUrl: parsedJson["menuURL"],
       perm: parsedJson["perm"],
         sunMenuItems: theMenus
     );
   }
   Map<dynamic, dynamic> toMap() {
     var map=new Map<String, dynamic>();

     map["menuIndex"]=menuIndex;
     map["menuId"]=menuId;
     map["menuURL"]=menuUrl;
     map["perm"]=perm;


     return map;
   }
 }
class SubMenuItem {
  int menuIndex;
  String menuId;
  String menuUrl;
  String perm;

  SubMenuItem({this.menuId,this.menuIndex,this.menuUrl,this.perm});

  factory SubMenuItem.fromJson(Map<String, dynamic> parsedJson) {

    return SubMenuItem(
        menuId: parsedJson["menuId"],
        menuIndex: parsedJson["menuIndex"],
        menuUrl: parsedJson["menuURL"],
        perm: parsedJson["perm"],
    );
  }
  Map<dynamic, dynamic> toMap() {
    var map=new Map<String, dynamic>();

    map["menuIndex"]=menuIndex;
    map["menuId"]=menuId;
    map["menuURL"]=menuUrl;
    map["perm"]=perm;


    return map;
  }
}

class GlobalVariablesItem {
  String key;
  String value;

  GlobalVariablesItem({this.key,this.value});

  factory GlobalVariablesItem.fromJson(Map<String, dynamic> prasedJson) {
    return GlobalVariablesItem(
        key: prasedJson["key"],
        value: prasedJson["value"]
    );
  }
}


class Status {
  //TODO: Message List
  int messageCode;

  Status({this.messageCode});

  factory Status.fromJson(Map<String, dynamic> parsedJson) {
    return Status(
        messageCode: parsedJson["messageCode"]
    );
  }
}

class NotificationQueue {
  String queueId;
  BigInt projectId;
  String category;
  String message;
  String type;
  BigInt seqNo;
  BigInt groupSeqNo;
  BigInt timestamp;
  String status;
  //TODO: modelUri
  //TODO: apiType

  NotificationQueue({this.queueId,this.projectId,this.timestamp,this.category,this.groupSeqNo,this.message,this.seqNo,this.status,this.type});

  factory NotificationQueue.fromJson(Map<String, dynamic> parsedJson) {
    return NotificationQueue(
      queueId: parsedJson["queueId"],
      category: parsedJson["category"],
      groupSeqNo: parsedJson["groupSeqNo"],
      message: parsedJson["message"],
      projectId: parsedJson["projectId"],
      seqNo: parsedJson["seqNo"],
      status: parsedJson["status"],
      timestamp: parsedJson["timestamp"],
      type: parsedJson["type"]
    );
  }
  Map<dynamic, dynamic> toMap() {
    var map=new Map<String, dynamic>();
    map["queueId"]=queueId;
    map["projectId"]=projectId;
    map["category"]=category;
    map["message"]=message;
    map["type"]=type;
    map["seqNo"]=seqNo;
    map["groupSeqNo"]=groupSeqNo;
    map["timestamp"]=timestamp;
    map["status"]=status;
    return map;
  }
}