import 'dart:convert';
//String form = json.encode([
//{
//"id": "autoid",
//"label": "357e9cd6-e55d-4b3f-8384-a293eb65ce30",
//"type": "text",
//"subType": "text",
//"regex": "",
//"constraint": "MANDATORY",
//"key": "P",
//"lov": "",
//"delim": "",
//"mapAttr": "",
//"dataSource": [],
//"currentDate": false,
//"visibleInGrid": false,
//"visibleInFilter": false,
//"additionalSpecs": false,
//"qty": false,
//"copy": false,
//"dependentOn": "",
//"triggerCheck": "",
//"lovType": "",
//"sort": 0.0
//},
//{
//"id": "t4",
//"label": "4c3b2bac-7ad2-4333-8c46-7ffe2b94413a",
//"type": "text",
//"subType": "text",
//"regex": "",
//"constraint": "OPTIONAL",
//"key": "",
//"lov": "",
//"delim": "",
//"mapAttr": "",
//"dataSource": [],
//"currentDate": false,
//"visibleInGrid": false,
//"visibleInFilter": false,
//"additionalSpecs": false,
//"qty": false,
//"copy": false,
//"dependentOn": "",
//"triggerCheck": "",
//"lovType": "S",
//"sort": 0.0
//},
//{
//"id": "t5",
//"label": "01623260-f2c2-4a42-b2d5-8f43e9254ab1",
//"type": "text",
//"subType": "number",
//"regex": "^[0-9]*",
//"constraint": "OPTIONAL",
//"key": "",
//"lov": "",
//"delim": "",
//"mapAttr": "",
//"dataSource": [],
//"currentDate": false,
//"visibleInGrid": false,
//"visibleInFilter": false,
//"additionalSpecs": false,
//"qty": false,
//"copy": false,
//"dependentOn": "",
//"triggerCheck": "",
//"lovType": "S",
//"sort": 0.0
//},
//{
//"id": "t6",
//"label": "acb0d261-a41d-4dcf-ab68-d6b777b417cb",
//"type": "text",
//"subType": "decimal",
//"regex": "^[-+]?[0-9]+(?:.[0-9]+)?(?:[eE][-+]?[0-9]+)?",
//"constraint": "OPTIONAL",
//"key": "",
//"lov": "",
//"delim": "",
//"mapAttr": "",
//"dataSource": [],
//"currentDate": false,
//"visibleInGrid": false,
//"visibleInFilter": false,
//"additionalSpecs": false,
//"qty": false,
//"copy": false,
//"dependentOn": "",
//"triggerCheck": "",
//"lovType": "S",
//"sort": 0.0
//},
////{
////"id": "t7",
////"label": "0fb0ced0-a8aa-4c1e-84b5-edb70fc8338a",
////"type": "select",
////"subType": "select",
////"regex": "",
////"constraint": "MANDATORY",
////"key": "",
////"lov": "e912bc48-912a-4e72-a617-00f722d1f465",
////"delim": "",
////"mapAttr": "",
////"dataSource": [],
////"currentDate": false,
////"visibleInGrid": false,
////"visibleInFilter": false,
////"additionalSpecs": false,
////"qty": false,
////"copy": false,
////"dependentOn": "",
////"triggerCheck": "",
////"lovType": "S",
////"sort": 0.0
////},
//{
//"id": "t8",
//"label": "c397396b-0184-4b71-bfd9-50498611cf71",
//"type": "text",
//"subType": "date",
//"regex": "dd-MMM-yyyy",
//"constraint": "OPTIONAL",
//"key": "",
//"lov": "",
//"delim": "",
//"mapAttr": "",
//"dataSource": [],
//"currentDate": false,
//"visibleInGrid": false,
//"visibleInFilter": false,
//"additionalSpecs": false,
//"qty": false,
//"copy": false,
//"dependentOn": "",
//"triggerCheck": "",
//"lovType": "S",
//"sort": 0.0
//},
//{
//"id": "t9",
//"label": "86daa076-f559-4284-979a-68419576ad27",
//"type": "checkbox",
//"subType": "checkbox",
//"regex": "",
//"constraint": "OPTIONAL",
//"key": "",
//"lov": "201b0531-69d7-4b81-b19e-7c86df2cdaa6",
//"delim": "",
//"mapAttr": "",
//"dataSource": [],
//"currentDate": false,
//"visibleInGrid": false,
//"visibleInFilter": false,
//"additionalSpecs": false,
//"qty": false,
//"copy": false,
//"dependentOn": "",
//"triggerCheck": "",
//"lovType": "S",
//"sort": 0.0
//},
//{
//"id": "t10",
//"label": "136ff4ff-4c00-4e11-be92-edac2464ea86",
//"type": "radio",
//"subType": "radio",
//"regex": "",
//"constraint": "OPTIONAL",
//"key": "",
//"lov": "355b486e-31c3-47f7-b17c-f362f1790ff6",
//"delim": "",
//"mapAttr": "",
//"dataSource": [],
//"currentDate": false,
//"visibleInGrid": false,
//"visibleInFilter": false,
//"additionalSpecs": false,
//"qty": false,
//"copy": false,
//"dependentOn": "",
//"triggerCheck": "",
//"lovType": "S",
//"sort": 0.0
//},
//{
//"id": "t1",
//"label": "3b97ea20-7098-4bad-8efb-704dc1e2490a",
//"type": "text",
//"subType": "text",
//"regex": "",
//"constraint": "MANDATORY",
//"key": "S",
//"lov": "",
//"delim": "@",
//"mapAttr": "",
//"dataSource": [],
//"currentDate": false,
//"visibleInGrid": false,
//"visibleInFilter": false,
//"additionalSpecs": false,
//"qty": false,
//"copy": false,
//"dependentOn": "",
//"triggerCheck": "",
//"lovType": "S",
//"sort": 0.0
//},
//{
//"id": "t3",
//"label": "78b55413-f3a2-43e9-9f56-42e10b0119b3",
//"type": "text",
//"subType": "text",
//"regex": "",
//"constraint": "MANDATORY",
//"key": "S",
//"lov": "",
//"delim": "",
//"mapAttr": "",
//"dataSource": [],
//"currentDate": false,
//"visibleInGrid": false,
//"visibleInFilter": false,
//"additionalSpecs": false,
//"qty": false,
//"copy": false,
//"dependentOn": "",
//"triggerCheck": "",
//"lovType": "S",
//"sort": 0.0
//}
//]);

String form = json.encode([
  {
    "id": "autoid",
    "label": "aa95f9dd-ced0-4fba-ba2e-cffa44927188",
    "type": "dropDown",
    "subType": "number",
    "regex": "",
    "constraint": "OPTIONAL",
    "key": "",
    "lov": "",
    "delim": "",
    "mapAttr": "",
    "dataSource": [],
    "currentDate": false,
    "visibleInGrid": false,
    "visibleInFilter": false,
    "additionalSpecs": false,
    "qty": false,
    "copy": false,
    "dependentOn": "",
    "triggerCheck": "",
    "lovType": "",
    "sort": 0
  },
  {
    "id": "t3",
    "label": "140c04b2-f528-41f2-a28f-e719f19a5a1c",
    "type": "Password",
    "subType": "text",
    "regex": "",
    "constraint": "MANDATORY",
    "key": "P",
    "lov": "",
    "delim": "",
    "mapAttr": "",
    "dataSource": [],
    "currentDate": false,
    "visibleInGrid": false,
    "visibleInFilter": false,
    "additionalSpecs": false,
    "qty": false,
    "copy": false,
    "dependentOn": "",
    "triggerCheck": "",
    "lovType": "S",
    "sort": 0
  },
          {
            "id": "t5",
            "label": "c52fa1d8-a10c-4d7a-b644-cb520a932a4a",
            "type": "RadioButton",
          'value': 2,
          'list': [
          {
          'title': "GGN",
          'value': 122,
          },
          {
          'title': "Delhi",
          'value': 123,
          },
          {
          'title': "Mumbai",
          'value': 124,
          },
            {
              'title': "Agra",
              'value':125,
            }
          ],
            "subType": "radio",
            "regex": "",
            "constraint": "MANDATORY",
            "key": "S",
            "lov": "355b486e-31c3-47f7-b17c-f362f1790ff6",
            "delim": "X",
            "mapAttr": "",
            "dataSource": [],
            "currentDate": false,
            "visibleInGrid": false,
            "visibleInFilter": false,
            "additionalSpecs": false,
            "qty": false,
            "copy": false,
            "dependentOn": "",
            "triggerCheck": "",
            "lovType": "S",
            "sort": 0.0
          },
          {
            "id": "t5",
            "label": "c52fa1d8-a10c-4d7a-b644-cb520a932a4a",
            "type": "Switch",
            "subType": "radio",
            'switchValue': false,
            "regex": "",
            "constraint": "MANDATORY",
            "key": "S",
            "lov": "b0a701fc-9850-43a0-9e2e-57ddf92ec867",
            "delim": "X",
            "mapAttr": "",
            "dataSource": [],
            "currentDate": false,
            "visibleInGrid": false,
            "visibleInFilter": false,
            "additionalSpecs": false,
            "qty": false,
            "copy": false,
            "dependentOn": "",
            "triggerCheck": "",
            "lovType": "S",
            "sort": 0.0
          },
  {
    "id": "t5",
    "label": "201b0531-69d7-4b81-b19e-7c86df2cdaa6",
    "type": "Checkbox",
    "subType": "radio",
    "regex": "",
    'list': [
      {
        'title': "series1",
        'value': true,
      },
      {
        'title': "series2",
        'value': true,
      },
      {
        'title': "series3",
        'value': false,
      },
      {
        'title': "series4",
        'value': false,
      },
      {
        'title': "series5",
        'value': false,
      }
    ],
    "constraint": "MANDATORY",
    "key": "S",
    "lov": "b0a701fc-9850-43a0-9e2e-57ddf92ec867",
    "delim": "X",
    "mapAttr": "",
    "dataSource": [],
    "currentDate": false,
    "visibleInGrid": false,
    "visibleInFilter": false,
    "additionalSpecs": false,
    "qty": false,
    "copy": false,
    "dependentOn": "",
    "triggerCheck": "",
    "lovType": "S",
    "sort": 0.0
  },
  {
    "id": "t4",
    "label": "e51eb583-9fc3-408f-a9b3-82132153592a",
    "type": "text",
    "subType": "number",
    "regex": "^[0-9]*",
    "constraint": "OPTIONAL",
    "key": "",
    "lov": "",
    "delim": "",
    "mapAttr": "",
    "dataSource": [],
    "currentDate": false,
    "visibleInGrid": false,
    "visibleInFilter": false,
    "additionalSpecs": false,
    "qty": false,
    "copy": false,
    "dependentOn": "",
    "triggerCheck": "",
    "lovType": "S",
    "sort": 0
  },
  {
    "id": "t5",
    "label": "eb37e5b1-f645-4cf7-b7c0-faf68acffc6f",
    "type": "dropDown",
    "subType": "decimal",
    "regex": "^[-+]?[0-9]+(?:.[0-9]+)?(?:[eE][-+]?[0-9]+)?",
    "constraint": "REQUIRED",
    "key": "",
    "lov": "",
    "delim": "",
    "mapAttr": "",
    "dataSource": [],
    "currentDate": false,
    "visibleInGrid": false,
    "visibleInFilter": false,
    "additionalSpecs": false,
    "qty": false,
    "copy": false,
    "dependentOn": "",
    "triggerCheck": "",
    "lovType": "S",
    "sort": 0
  }
]);
dynamic inputData =
{
"LOV": [
{
"lovId": 1,
"displayName": "Compluter1",
"displayValue": "111",
"type": "e912bc48-912a-4e72-a617-00f722d1f465"
},
{
"lovId": 2,
"displayName": "Compluter2",
"displayValue": "112",
"type": "e912bc48-912a-4e72-a617-00f722d1f465"
},
{
"lovId": 3,
"displayName": "Compluter3",
"displayValue": "113",
"type": "e912bc48-912a-4e72-a617-00f722d1f465"
},
{
"lovId": 4,
"displayName": "Compluter4",
"displayValue": "114",
"type": "e912bc48-912a-4e72-a617-00f722d1f465"
},
{
"lovId": 5,
"displayName": "Compluter5",
"displayValue": "115",
"type": "e912bc48-912a-4e72-a617-00f722d1f465"
},
{
"lovId": 6,
"displayName": "Compluter6",
"displayValue": "116",
"type": "e912bc48-912a-4e72-a617-00f722d1f465"
},
{
"lovId": 7,
"displayName": "series1",
"displayValue": "117",
"type": "201b0531-69d7-4b81-b19e-7c86df2cdaa6"
},
{
"lovId": 8,
"displayName": "series2",
"displayValue": "118",
"type": "201b0531-69d7-4b81-b19e-7c86df2cdaa6"
},
{
"lovId": 9,
"displayName": "series3",
"displayValue": "119",
"type": "201b0531-69d7-4b81-b19e-7c86df2cdaa6"
},
{
"lovId": 10,
"displayName": "series4",
"displayValue": "120",
"type": "201b0531-69d7-4b81-b19e-7c86df2cdaa6"
},
{
"lovId": 11,
"displayName": "series5",
"displayValue": "121",
"type": "201b0531-69d7-4b81-b19e-7c86df2cdaa6"
},
{
"lovId": 12,
"displayName": "GGN",
"displayValue": "122",
"type": "355b486e-31c3-47f7-b17c-f362f1790ff6"
},
{
"lovId": 13,
"displayName": "Delhi",
"displayValue": "123",
"type": "355b486e-31c3-47f7-b17c-f362f1790ff6"
},
{
"lovId": 14,
"displayName": "Mumbai",
"displayValue": "124",
"type": "355b486e-31c3-47f7-b17c-f362f1790ff6"
},
{
"lovId": 15,
"displayName": "Agra",
"displayValue": "125",
"type": "355b486e-31c3-47f7-b17c-f362f1790ff6"
}
]
};

class Data {
  List<LovItem> lov ;

  Data({this.lov});

  factory Data.fromJson(Map<String,dynamic> parsedJson) {
    var lovList = parsedJson['LOV'] as List;
    List<LovItem> theLov = lovList.map((i) => LovItem.fromJson(i)).toList();
    return Data(
        lov: theLov
    );
  }
}
class  LovItem{

  Map<String, dynamic> pro;

  LovItem({this.pro});

  factory LovItem.fromJson(dynamic lovValue){
    return LovItem(
        pro: lovValue
    );
  }
}

