import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn_app/common/global_loader/global_loader.dart';
import 'package:ulearn_app/common/widgets/button_widgets.dart';
import 'package:ulearn_app/common/widgets/text_widgets.dart';
import 'package:ulearn_app/features/sign_in/controller/sign_in_controller.dart';
import 'package:ulearn_app/features/sign_in/view/widgets/sign_in_widgets.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfields.dart';
import '../notifier/sign_in_notifier.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void didChangeDependencies() {
    _controller = SignInController();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: "Login"),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //top login buttons
                      thirdPartyLogin(),
                      SizedBox(
                        height: 10.h,
                      ),

                      //more login options message
                      Center(
                          child: Text14Normal(
                              text: "Or use your email account to login")),
                      SizedBox(
                        height: 50.h,
                      ),

                      //email text field
                      AppTextField(
                        controller: _controller.emailController,
                          text: "Email",
                          iconName: ImageRes.user,
                          hintText: 'Enter your email address',
                          func: (value) {
                            ref
                                .read(signInNotifierProvider.notifier)
                                .onUserEmailChange(value);
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                      //password text field
                      AppTextField(
                        controller: _controller.passwordController,
                        text: "Password",
                        iconName: ImageRes.lock,
                        hintText: "Enter your password",
                        obscureText: true,
                        func: (value) {
                          ref
                              .read(signInNotifierProvider.notifier)
                              .onUserPasswordChange(value);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //forget password text
                      Container(
                          margin: EdgeInsets.only(left: 25.w),
                          child: textUnderline(text: "Forgot password?")),
                      SizedBox(
                        height: 100.h,
                      ),
                      //app login button
                      Center(
                        child: AppButton(
                          buttonName: "Login",
                          context: context,
                          func: () => _controller.handleSignIn(ref),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //app register button
                      Center(
                        child: AppButton(
                            buttonName: "Register",
                            isLogin: false,
                            context: context,
                            func: () {
                              Navigator.pushNamed(context, '/register');
                            }),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
