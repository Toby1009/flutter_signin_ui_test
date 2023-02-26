import 'package:flutter_signin_ui_test/auth/database/dbHelper.dart';
import 'package:flutter_signin_ui_test/auth/models/user_model.dart';

import '../database/util.dart';

class AuthRepository {
  DBHelper dbHelper = DBHelper();

  Future<int> signIn(String email, String password) async {
    print("attempting sign in");

    var dbClient = await dbHelper.db;

    //取得資料表資料
    List<Map> maps = await dbClient.rawQuery('SELECT * FROM user WHERE email = ? AND password = ?',
      [email,password]
    );
    int length = maps.length;
    print(length);
    if(length>=1) {
      return 1;
    } else {
      return 0;
    }
  }

  Future<int> register(UserModel userModel)async{
    var dbClient = await dbHelper.db;
    int a = await dbClient.insert(tableName, userModel.toMap());
    //print(await dbClient.query(tableName));
    return a;
  }
}
