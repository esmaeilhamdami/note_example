import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalSettingProvider extends ChangeNotifier{

  SharedPreferences sharedPreferences;

  GlobalSettingProvider({required this.sharedPreferences});

  set name(value){
    sharedPreferences.setString('name', value);
  }

  set email(value){
    sharedPreferences.setString('email', value);
  }

  set password(value){
    sharedPreferences.setString('password', value);
  }

  String get getName => sharedPreferences.getString('name') ?? '';

  String get getEmail => sharedPreferences.getString('email') ?? '';

  String get getPassword => sharedPreferences.getString('password') ?? '';

}