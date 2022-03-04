import 'package:flutter/material.dart';
import 'package:notica/provider/forget_password_provider.dart';
import 'package:notica/provider/global_setting_provider.dart';
import 'package:notica/provider/sign_in_provider.dart';
import 'package:notica/provider/sign_up_provider.dart';
import 'package:notica/ui/login/sign_in.dart';
import 'package:notica/ui/login/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return MultiProvider(

            providers: [
              ChangeNotifierProvider(create: (context) => GlobalSettingProvider(sharedPreferences: snapshot.data!),),
              ChangeNotifierProvider(create: (context) => SignUpProvider(),),
              ChangeNotifierProvider(create: (context) => SignInProvider(),),
              ChangeNotifierProvider(create: (context) => ForgetPasswordProvider(),),
            ],
            child: const _MyApp(),
          );
        }
        if(snapshot.hasError){
          return const SizedBox();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(
      //   accentColor: Colors.red
      //   ),
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}

