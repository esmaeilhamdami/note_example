import 'package:flutter/cupertino.dart';

class ForgetPasswordProvider extends ChangeNotifier{

  TextEditingController checkEmail = TextEditingController();


  bool showLoadingIndicator = false;
  bool showPassword = false;


  set checkLoadingIndicator(value){
    showPassword = false;
    showLoadingIndicator = value;
    if(showLoadingIndicator == false){
      showPassword = true;
    }
    notifyListeners();
  }

}