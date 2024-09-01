import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/widgets/button_widgets.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';
import 'package:ulearn_app/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:ulearn_app/pages/sign_up/sign_up.dart';

import '../../common/utils/app_colors.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            appBar: buildAppbar(title: "Login"),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //top login buttons
                  thirdPartyLogin(),
                  SizedBox(height: 10.h,),
              
                  //more login options message
                  Center(child: text14Normal(text: "Or use your email account to login")),
                  SizedBox(height: 50.h,),
              
                  //email text field
                  appTextField(
                    text: "Email",
                    iconName: 'assets/icons/user.png',
                    hintText: 'Enter your email address',
                  ),
                  SizedBox(height: 20.h,),
                  //password text field
                  appTextField(
                    text: "Password",
                    iconName: 'assets/icons/lock.png',
                    hintText: "Enter your password",
                    obscureText: true
                  ),
                  SizedBox(height: 20.h,),
                  //forget password text
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: textUnderline(text: "Forgot password?")
                  ),
                  SizedBox(height: 100.h,),
                  //app login button
                  Center(
                    child: appButton(
                      buttonName: "Login",
                      context: context,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  //app register button
                  Center(
                    child: appButton(
                      buttonName: "Register",
                      isLogin: false,
                      context: context,
                      func: (){
                        Navigator.pushNamed(
                          context,
                          '/register'
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
