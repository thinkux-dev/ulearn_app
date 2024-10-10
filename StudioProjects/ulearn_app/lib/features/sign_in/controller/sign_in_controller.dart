import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_app/common/utils/constants.dart';
import 'package:ulearn_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:ulearn_app/global.dart';
import 'package:ulearn_app/main.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../common/models/user.dart';
import '../../../common/widgets/popup_messages.dart';
import '../notifier/sign_in_notifier.dart';

class SignInController {
  // WidgetRef ref;

  SignInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo(msg: "Email field can't be empty");
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo(msg: "password field can't be empty");
      return;
    }

    //show loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try{
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if(credential.user==null){
        toastInfo(msg: 'User not found');
        return;
      }

      if(!credential.user!.emailVerified){
        toastInfo(msg: 'You must verify your email address first!');
        return;
      }
      var user = credential.user;
      if(user!=null){
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.email = email;
        loginRequestEntity.name = displayName;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        if (kDebugMode) {
          print('user logged in');
        }
      }else{
        toastInfo(msg: 'login error');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          toastInfo(msg: "User doesn't exist");
          break;
        case 'wrong-password':
          toastInfo(msg: "Your password is wrong");
          break;
        case 'invalid-email':
          toastInfo(msg: "Invalid email");
          break;
        case 'user-disabled':
          toastInfo(msg: "Your account is currently disabled, please reach out to customer service");
          break;
        case 'invalid-credential':
          toastInfo(msg: "Invalid email or password");
          break;
        default:
          toastInfo(msg: "An error occurred: ${e.message}");
      }

    } catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      if (kDebugMode) {
        print("Unexpected error: $e");
      }
    }
    //close loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    // we need to talk to server
    var result = await SignInRepo.login(params: loginRequestEntity);
    if(result.code==200){
      //have local storage
      try{
        // var navigator = Navigator.of(ref.context);
        //try to remember user info
        Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
        Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);

        //redirect to new page
        navKey.currentState?.pushNamedAndRemoveUntil("/dashboard", (route) => false);
        // navigator.push(
        //     MaterialPageRoute(
        //         builder: (BuildContext conte xt) => Scaffold(appBar: AppBar(), body: const Dashboard(),)
        //     ),
        // );
        // navigator.pushNamed("/dashboard");
      }catch(e){
        if (kDebugMode) {
          print(e.toString());
        }
      }

      //redirect to new page
    }else{
      toastInfo(msg: 'Login error: ${result.msg}');
    }

  }
}