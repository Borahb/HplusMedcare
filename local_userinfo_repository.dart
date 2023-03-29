import 'package:hive/hive.dart';
import 'package:hplusmedcare/Models/accountmodel.dart';


class LocalUserInfoService{
  final Box<AccountModel> _userBox = Hive.box('Userinfo');
  Future<void> assignUserinfo({required AccountModel userinfo })async{
    await _userBox.clear();
    await _userBox.put(1, userinfo);
  }


  getUserinfo(){
  AccountModel? userinfo = _userBox.get(1);
  return userinfo;
  }
}