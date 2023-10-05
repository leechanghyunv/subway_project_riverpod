import 'package:shared_preferences/shared_preferences.dart';

class SharedPreManager {
  SharedPreferences? _preferences;

  List<String> getList(){
    List<String>? original = _preferences?.getStringList('list');
    if (original != null) {
      return original.reversed.toSet().toList();
    } else {
      return [];
    }

  }

  // SharedPreferences를 초기화하는 메서드
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool getIsFirst() {
    return _preferences?.getBool('A') ?? true;
  }

  // 값을 쓰는 인스턴스 메서드
  void setIsFirst(bool isFirst) {
    _preferences?.setBool('A', isFirst);
  }

  bool getFirstLoading() {
    return _preferences?.getBool('isFirst') ?? true;
  }

  // 값을 쓰는 인스턴스 메서드
  void setFirstLoading(bool isFirst) {
    _preferences?.setBool('isFirst', isFirst);
  }


}