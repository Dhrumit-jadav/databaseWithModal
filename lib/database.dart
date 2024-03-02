import 'dart:io';
import 'package:db/model/department_model.dart';
import 'package:db/model/designation_model.dart';
import 'package:db/model/person_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class MyDb {
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'Worker_Info.db');
    return await openDatabase(
      databasePath,
    );
  }

  Future<void> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Worker_Info.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
          await rootBundle.load(join('assets/database', 'Worker_Info.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }

  Future<List<DesignationModel>> getDataFromDesignationTable() async {
    List<DesignationModel> designationlist = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
        await db.rawQuery('SELECT * FROM Designation');
    for (int i = 0; i < data.length; i++) {
      DesignationModel model = DesignationModel();
      model.DesignationID = data[i]['DesignationID'] as int;
      model.DesignationName = data[i]['DesignationName'].toString();
      designationlist.add(model);
    }

    return designationlist;
  }

  Future<List<DepartmentModel>> getDataFromDepartmentTable() async {
    List<DepartmentModel> departmentlist = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
        await db.rawQuery('SELECT * FROM Department');
    for (int i = 0; i < data.length; i++) {
      DepartmentModel model = DepartmentModel();
      model.DepartmentID = data[i]['DepartmentID'] as int;
      model.DepartmentName = data[i]['DepartmentName'].toString();
      departmentlist.add(model);
    }

    return departmentlist;
  }

  Future<List<PersonModel>> getDataFromPersonTable() async  {
    List<PersonModel> personlist = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data = await db.rawQuery('Select '
        ' WorkerID,'
        ' FirstName,'
        ' LastName,Salary,'
        ' JoiningDate,'
        ' Person.DepartmentID,'
        ' Person.DesignationId,'
        ' Department.DepartmentName,'
        ' Designation.DesignationName'
        ' FROM Person'
        ' INNER JOIN Department ON Person.DepartmentID=Department.DepartmentID'
        ' INNER JOIN Designation on Person.DesignationID=Designation.DesignationID');
    for (int i = 0; i < data.length; i++) {
      PersonModel model = PersonModel();
      model.WorkerID = data[i]['WorkerID'] as int;
      model.FirstName = data[i]['FirstName'].toString();
      model.LastName = data[i]['LastName'].toString();
      model.Salary = data[i]['Salary'] as int;
      model.JoiningDate = data[i]['JoiningDate'].toString();
      model.DesignationName = data[i]['DesignationName'].toString();
      model.DepartmentName = data[i]['DepartmentName'].toString();
      model.DepartmentID = data[i]['DepartmentID'] as int;
      model.DesignationID = data[i]['DesignationID'] as int;
      model.isFavouritUser = false;
      personlist.add(model);
    }
    return personlist;
  }

  Future<int> deletePersonFromPersonTable(userID) async {
    Database db = await initDatabase();
    int deletedid = await db.delete(
      'Person',
      where: 'WorkerID = ?',
      whereArgs: [userID],
    );
    return deletedid;
  }


  Future<void> upsertIntoPersonTable(
      {fName, lName, salary, jDate, departmentId, designationId, wId}) async {
    Database db = await initDatabase();
    Map<String, Object?> map = Map();
    map['FirstName'] = fName;
    map['LastName'] = lName;
    map['Salary'] = salary;
    map['JoiningDate'] = jDate;
    map['DepartmentID'] = departmentId;
    map['DesignationID'] = designationId;
    if (wId != -1) {
      map['WorkerID'] = wId;
      db.update('Person', map,where: 'WorkerID = ?',whereArgs: [wId]);
    }else{
      db.insert('Person', map);
    }
  }
}
