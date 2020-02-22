import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  /// app全局数据存储
  static SharedPreferences sp;
  /// 网络连接
  var connect;

  static init() async {
    sp = await SharedPreferences.getInstance();
  }
}