import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_app/common/global_loader/global_loader.dart';
import 'package:ulearn_app/common/widgets/popup_messages.dart';
import 'package:ulearn_app/features/sign_up/repo/sign_up_repo.dart';

import '../notifier/register_notifier.dart';

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

    //show loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);
    try {
      final credential = await SignUpRepo.firebaseSignUp(email, password);

      if(kDebugMode){
        print(credential);
      }

      if(credential.user!=null){

        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);

        toastInfo(msg: "An email has been sent to you to verify your account. Please open that email and complete your verification");
        context.pop();
      }

    }on FirebaseAuthException catch (e) {
      if(e.code=='weak-password'){
        toastInfo(msg: "This password is too weak");
      }else if(e.code=='email-already-in-use'){
        toastInfo(msg: "This email address has already been registered");
      }else if(e.code=='user-not-found'){
        toastInfo(msg: "User not found");
      }
      print(e.code);

    } catch(e){
      if(kDebugMode){
        print(e.toString());
      }
    }

    //show register page
    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
