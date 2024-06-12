// Auth Provider
// Use this provider to manage the state of the login and register form.
// The state is get from secure storage.
// On create, the provider will get the state from secure storage.
// On login and register, the provider will save the state to secure storage.
// On logout, the provider will remove the state from secure storage.

import 'package:flutter/material.dart';
import 'package:foto_in/core/token/SecureStorage.dart';

// create enum of login and register state
enum AuthState { login, register }

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    update();
  }

  // loading state
  bool isLoading = true;

  // login state
  bool isLogin = false;

  // auth state
  AuthState authState = AuthState.login;

  // change auth state
  void changeAuthState(AuthState state) {
    authState = state;
    notifyListeners();
  }

  Future<void> update() async {
    final _isLogin = await SecureStorage().isLogin();
    print("isLogin: $_isLogin");
    isLogin = _isLogin;

    if (!isLogin) {
      authState = AuthState.login;
    }

    isLoading = false;
    notifyListeners();
  }

  // logout
  Future<void> logout() async {
    await SecureStorage().deleteSecureData('token');
    update();
    notifyListeners();
  }
}
