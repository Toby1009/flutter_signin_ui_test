import 'dart:async';

import 'package:flutter_signin_ui_test/auth/auth_repositories/user.dart';
import 'package:flutter_signin_ui_test/auth/database/dbHelper.dart';
import 'package:flutter_signin_ui_test/auth/models/user_model.dart';



import '../../cache/cache.dart';
import '../database/util.dart';

enum Status{
  logout,
  signIn,
}


class AuthRepository {

  AuthRepository({CacheClient? cache,}):_cache = cache??CacheClient();
  DBHelper dbHelper = DBHelper();
  final CacheClient _cache;
  static const userCacheKey = '__user_cache_key__';

  final StreamController<User> dataController = StreamController<User>();
  StreamSink<User> get dataSink => dataController.sink;
  Stream<User> get userStream {
    return dataController.stream;
  }


  Future<int> signIn(String email, String password) async {
    var dbClient = await dbHelper.db;
    //取得資料表資料
    List<Map> maps = await dbClient.rawQuery('SELECT * FROM user WHERE email = ? AND password = ?',
      [email,password]
    );

    if(maps.isNotEmpty) {
     final user = User.fromMap(maps[0]);
     _cache.write(key: userCacheKey, value: user);
     dataSink.add(user);
      return 1;
    } else {
      const user = User.empty;
      _cache.write(key: userCacheKey, value: user);
      dataSink.add(user);
      return 0;
    }
  }


  Future<int> register(UserModel userModel)async{
    var dbClient = await dbHelper.db;
    int insert = await dbClient.insert(tableName, userModel.toMap());
    return insert;
  }

  Future<void> logOut()async{
    const user = User.empty;
    _cache.write(key: userCacheKey, value: user);
  }

  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

}
