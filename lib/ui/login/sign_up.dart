import 'package:flutter/material.dart';
import 'package:notica/provider/global_setting_provider.dart';
import 'package:notica/provider/sign_up_provider.dart';
import 'package:notica/ui/login/sign_in.dart';
import 'package:notica/utils/utlis.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    SignUpProvider signUpProvider = Provider.of(context);
    GlobalSettingProvider globalSettingProvider = Provider.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_login.jpg',
              width: double.infinity,
              height: h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  const Text(
                    'Create\nAccount',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: signUpProvider.nameController,
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: signUpProvider.emailController,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: signUpProvider.passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold , color: Colors.white),
                      ),
                      MaterialButton(
                        onPressed: () {

                          if(globalSettingProvider.getPassword.isNotEmpty){
                            Utils().showSnackBar(context, 'You have already account');
                            return;
                          }

                          if(signUpProvider.nameController.text.isEmpty){
                            Utils().showSnackBar(context, 'Please enter your Name');
                            return;
                          }

                          if(signUpProvider.emailController.text.isEmpty){
                            Utils().showSnackBar(context, 'Please enter your Email');
                            return;
                          }

                          if(signUpProvider.passwordController.text.isEmpty){
                            Utils().showSnackBar(context, 'Please enter your Password');
                            return;
                          }

                          globalSettingProvider.name = signUpProvider.nameController.text;
                          globalSettingProvider.email = signUpProvider.emailController.text;
                          globalSettingProvider.password = signUpProvider.passwordController.text;


                          print(globalSettingProvider.getName);
                          print(globalSettingProvider.getEmail);
                          print(globalSettingProvider.getPassword);
                        },
                        padding: EdgeInsets.zero,
                        child: const Padding(
                          padding: EdgeInsets.all(26.0),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        color: const Color(0xff8b4d7d),
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
