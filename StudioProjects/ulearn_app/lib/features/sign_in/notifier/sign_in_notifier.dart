import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearn_app/features/sign_in/notifier/sign_in_state.dart';

//StateNotifier saves state
class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());

  void onUserEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
        (ref) => SignInNotifier());