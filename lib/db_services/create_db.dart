import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../customs/casuals.dart';
import '../customs/helper.dart';
import '../model/user.dart';

class SqliteServicesCreateDB {
  Future<Database> initializeDB() async {
    return openDatabase(
      join(await getDatabasesPath(), "user_info.db"),
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE userAuth(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT NOT NULL, password TEXT NOT NULL)');
      },
      version: 1,
    );
  }

  Future<int> createAuth(User user) async {
    final Database db = await initializeDB();
    var result = await db.insert("userAuth", user.toMap());
    print(db.query("userAuth"));
    return result;
  }

  Future fetchData(String email, String password, BuildContext context) async {
    HelperView helperView = const HelperView();
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> res = await db.query(
      "userAuth",
    );
    if (res.isNotEmpty) {
      for (var res in res) {
        if (res["email"] == email && res["password"] == password) {
          currentUser = User.fromMap(res);
        }
        // else {
        //   return showDialog(
        //     context: context,
        //     builder: (context) => const AlertDialog(
        //       title: Text("PLease Enter Valid Email Or Password"),
        //     ),
        //   );
        // }
      }

      debugPrint(currentUser!.email);
      debugPrint(currentUser!.password);
    }
  }

  Future dataInfo() async {
    final Database db = await initializeDB();
    final queryResult = await db.query(
      "userAuth",
    );
    debugPrint(queryResult.toString());
    inspect(queryResult);
  }
}
// List<Map> queryResult = db.rawQuery(
//     "SELECT * FROM userAuth WHERE email = ? AND password = ? ",
//     [email, password]) as List<Map>;
// // List<Map> listRes = queryResult as List<Map>;
//
// for (var row in queryResult) {
//   debugPrint(row.toString());
// }

// debugPrint(queryResult.toString());
// inspect(queryResult);
