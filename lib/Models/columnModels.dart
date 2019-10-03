class TopColumnObject {
  Data data;

  TopColumnObject({this.data});

  factory TopColumnObject.fromJson(dynamic parsedJson) {
    return TopColumnObject(
        data: Data.fromJson(parsedJson['Data'])
    );
  }
}

class Data {
  List<FormModel> formModels;

  Data({this.formModels});

  factory Data.fromJson(dynamic parsedJson) {
    var formModelList = parsedJson['FormModel'] as List;
    List<FormModel> theformModel = formModelList.map((i) => FormModel.fromJson(i)).toList();
    return Data(
        formModels: theformModel
    );
  }
}

class FormModel {
  Model model;

  FormModel({this.model});

  factory FormModel.fromJson(dynamic parsedJson) {
    return FormModel(
        model: Model.fromJson(parsedJson['Model'])
    );
  }
}

class Model {
  String modelName;
  String formId;
  List<Table> tables;
  List<Relations> relations;

  Model({this.formId, this.modelName, this.tables, this.relations});

  factory Model.fromJson(dynamic parsedJson) {
    var tableList = parsedJson['Tables'] as List;
    List<Table> theTables = tableList.map((i) => Table.fromJson(i)).toList();
    var relationList = parsedJson['Relations'] as List;
    List<Relations> theRelation = relationList.map((i) => Relations.fromJson(i)).toList();
    return Model(
        modelName: parsedJson['ModelName'],
        formId: parsedJson['FormId'].toString(),
        tables: theTables,
        relations: theRelation
    );
  }
}

class Table {
  String tableName;
  List<Column> columns;

  Table({this.tableName, this.columns});

  factory Table.fromJson(Map<String, dynamic> parsedJson) {
    var columnList = parsedJson['Columns'] as List;
    List<Column> theColumns = columnList.map((i) => Column.fromJson(i)).toList();
    return Table(
        tableName: parsedJson['TableName'],
        columns: theColumns
    );
  }
}

class Column {
  String columnName;
  String dataType;
  bool primaryKey;
  String precision;
  String scale;
  String maxLength;

  Column({this.columnName, this.dataType, this.primaryKey, this.precision, this.scale, this.maxLength});

  factory Column.fromJson(Map<String, dynamic> parsedJson) {
    return Column(
        columnName: parsedJson['ColumnName'],
        dataType: parsedJson['DataType'],
        primaryKey: parsedJson['PrimaryKey'],
        precision: parsedJson['Precision'],
        scale: parsedJson['Scale'],
        maxLength: parsedJson['MaxLength']
    );
  }
}

class Relations {
  String parentTableName;
  List<Relation> relations;

  Relations({this.parentTableName, this.relations});

  factory Relations.fromJson(Map<String, dynamic> parsedJson) {
    var relationList = parsedJson['Relation'] as List;
    List<Relation> theRelations = relationList.map((i) => Relation.fromJson(i)).toList();
    return Relations(
        parentTableName: parsedJson['ParentTableName'],
        relations: theRelations
    );
  }
}

class Relation {
  String childEntityName;
  String referenceColumnName;
  String childReferenceColumnName;

  Relation({this.childEntityName, this.referenceColumnName, this.childReferenceColumnName});

  factory Relation.fromJson(Map<String, dynamic> parsedJson) {
    return Relation(
        childEntityName: parsedJson['ChildEntityName'],
        referenceColumnName: parsedJson['ReferenceColumnName'],
        childReferenceColumnName: parsedJson['ChildReferenceColumnName']
    );
  }
}