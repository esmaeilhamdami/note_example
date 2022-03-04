import 'package:flutter/material.dart';
import 'package:notica/provider/global_setting_provider.dart';
import 'package:notica/provider/sign_in_provider.dart';
import 'package:notica/ui/login/forget_password_page.dart';
import 'package:notica/ui/login/sign_up.dart';
import 'package:notica/ui/main_page.dart';
import 'package:notica/utils/utlis.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    GlobalSettingProvider globalSettingProvider = Provider.of(context);
    SignInProvider signInProvider = Provider.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_register.png',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  const Text(
                    'Welcome\nback',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .23,
                  ),
                  TextField(
                    controller: signInProvider.emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: signInProvider.passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if(signInProvider.emailController.text.isEmpty){
                            Utils().showSnackBar(context, 'Please enter your Email');
                            return;
                          }
                          if(signInProvider.passwordController.text.isEmpty){
                            Utils().showSnackBar(context, 'Please enter your Password');
                            return;
                          }

                          if(signInProvider.emailController.text != globalSettingProvider.getEmail){
                            Utils().showSnackBar(context, 'Your Email is incorrect');
                            return;
                          }

                          if(signInProvider.passwordController.text != globalSettingProvider.getPassword){
                            Utils().showSnackBar(context, 'Your Password is incorrect');
                            return;
                          }

                          if(signInProvider.emailController.text == globalSettingProvider.getEmail && signInProvider.passwordController.text == globalSettingProvider.getPassword){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage(),));
                          }



                        },
                        padding: EdgeInsets.zero,
                        child: const Padding(
                          padding: EdgeInsets.all(26.0),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 24,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp(),));
                        },
                        child: const Text('Sign up',

                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                              fontSize: 18, fontWeight: FontWeight.bold , ),),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPasswordPage(),));
                        },
                        child: const Text('Forget Password',

                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                            fontSize: 18, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
