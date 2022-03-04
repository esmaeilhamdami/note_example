import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:notica/provider/global_setting_provider.dart';
import 'package:notica/provider/sign_in_provider.dart';
import 'package:notica/ui/login/sign_up.dart';
import 'package:notica/ui/main_page.dart';
import 'package:notica/utils/utlis.dart';
import 'package:provider/provider.dart';

import '../../provider/forget_password_provider.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalSettingProvider globalSettingProvider = Provider.of(context);
    ForgetPasswordProvider forgetPasswordProvider = Provider.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_register.png',
              fit: BoxFit.cover,
            ),
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 22 , vertical: 52),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded , color: Colors.white,)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  const Text(
                    'Forgot your\nPassword?',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                  ),
                  TextField(
                    controller: forgetPasswordProvider.checkEmail,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  forgetPasswordProvider.showLoadingIndicator == true ? const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: LoadingIndicator(
                          indicatorType: Indicator.lineScalePulseOut, /// Required, The loading type of the widget
                          colors: [Color(0xffac4797) , Color(0xff8b4d7d)],       /// Optional, The color collections
                      ),
                    ),
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Forget Password',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (forgetPasswordProvider.checkEmail.text.isEmpty) {
                            Utils().showSnackBar(
                                context, 'Please enter your Email');
                            return;
                          }
                          if(forgetPasswordProvider.checkEmail.text != globalSettingProvider.getEmail){
                            Utils().showSnackBar(context, 'Your new email does not match the old email');
                            return;
                          }

                          forgetPasswordProvider.checkLoadingIndicator = true;

                          Future.delayed(const Duration(seconds: 2), () {
                            forgetPasswordProvider.checkLoadingIndicator = false;
                          });
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
                    height: 20,
                  ),
                  if(forgetPasswordProvider.showPassword == true)
                  Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0 , vertical: 20),
                        child: Text('Your Password: ${globalSettingProvider.getPassword}' , style: const TextStyle(fontSize: 16),),
                      ),
                    ),
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
