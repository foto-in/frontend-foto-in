import 'package:flutter/material.dart';
import 'package:foto_in/feature/auth/login/presentation/view/login_view.dart';
import 'package:foto_in/feature/auth/provider/auth_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/provider/register_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/view/register_view.dart';
import 'package:foto_in/feature/navigation/presentation/view/mobile/navigation_bar.dart';
import 'package:provider/provider.dart';

class AuthView extends StatelessWidget {
  static const String routeName = '/auth';
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, AuthProvider authProvider, child) {
      print(authProvider.isLogin);
      if (authProvider.isLogin) {
        return NavigationBarMobile();
      }

      if (!authProvider.isLogin) {
        if (authProvider.authState == AuthState.login) {
          return LoginView();
        } else {
          return ChangeNotifierProvider<RegisterProvider>(
            create: (context) => RegisterProvider(),
            child: RegisterView(),
          );
        }
      }

      return _loading();
    });
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
