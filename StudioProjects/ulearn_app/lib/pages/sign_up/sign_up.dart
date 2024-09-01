import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/widgets/button_widgets.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';
import 'package:ulearn_app/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:ulearn_app/pages/sign_up/sign_up_controller.dart';

import '../../common/utils/app_colors.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';
import 'notifier/register_notifier.dart';

class SignUp extends ConsumerStatefulWidget{
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {

    _controller = SignUpController(ref: ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    // regProvider
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            appBar: buildAppbar(title: "Sign up"),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h,),

                  Center(
                    child: text14Normal(
                      text: 'Enter your details below & free sign up',
                    ),
                  ),
                  SizedBox(height: 50.h,),

                  //user name text field
                  appTextField(
                    text: "User name",
                    iconName: 'assets/icons/user.png',
                    hintText: 'Enter your user name',
                    func: (value){
                      ref.read(registerNotifierProvider.notifier)
                          .onUserNameChange(value);
                    }
                  ),
                  SizedBox(height: 20.h,),

                  //email text field
                  appTextField(
                    text: "Email",
                    iconName: 'assets/icons/user.png',
                    hintText: 'Enter your email address',
                    func: (value){
                      ref.read(registerNotifierProvider.notifier)
                          .onUserEmailChange(value);
                    }
                  ),
                  SizedBox(height: 20.h,),

                  //password text field
                  appTextField(
                    text: "Password",
                    iconName: 'assets/icons/lock.png',
                    hintText: "Enter your password",
                    obscureText: true,
                    func: (value){
                      ref.read(registerNotifierProvider.notifier)
                          .onPasswordChange(value);
                    }
                  ),

                  SizedBox(height: 20.h,),

                  //confirm password text field
                  appTextField(
                    text: "Confirm Password",
                    iconName: 'assets/icons/lock.png',
                    hintText: "Confirm your password",
                    obscureText: true,
                    func: (value){
                      ref.read(registerNotifierProvider.notifier)
                          .onRePasswordChange(value);
                    }
                  ),

                  SizedBox(height: 20.h,),
                  //forget password text
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: text14Normal(text: "By creating an account you are agreeing with our terms and conditions")
                  ),
                  SizedBox(height: 80.h,),

                  //app register button
                  Center(
                    child: appButton(
                      buttonName: "Sign Up",
                      isLogin: true,
                      context: context,
                      func: () => _controller.handleSignup(),
                    ),
                  ),

                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          )
      ),
    );
  }
}
