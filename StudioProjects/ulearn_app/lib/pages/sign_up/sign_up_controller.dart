import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_app/common/widgets/popup_messages.dart';

import 'notifier/register_notifier.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignup() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo(msg: "Username field can't be empty");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo(msg: "Username length is too short(Input a max length of 6)");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo(msg: "Email field can't be empty");
      return;
    }

    if ((state.password.isEmpty != state.rePassword.isEmpty) || password.isEmpty!=rePassword.isEmpty){
      toastInfo(msg: "Password field can't be empty");
      return;
    }

    if ((state.password != state.rePassword) || password!=rePassword){
      toastInfo(msg: "Your password does not match");
      return;
    }

    var context = Navigator.of(ref.context);
    try {
      final credendial = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(kDebugMode){
        print(credendial);
      }

      if(credendial.user!=null){

        await credendial.user?.sendEmailVerification();
        await credendial.user?.updateDisplayName(name);
        //get server photo url
        //set user photo url
        toastInfo(msg: "A verification code has been sent to your email to verify your account");
        context.pop();
      }

    } catch (e) {}
  }
}
