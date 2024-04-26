import 'package:flutter/material.dart';
import 'package:foto_in/feature/auth/login/presentation/view/login_view.dart';
import 'package:foto_in/feature/auth/register/presentation/provider/register_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/view/register_view.dart';
import 'package:foto_in/feature/home/presentation/view/beranda.dart';
import 'package:foto_in/feature/home/presentation/widgets/landing_page.dart';
import 'package:foto_in/feature/profile/view/profile_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ],
      child: MaterialApp(
        routes: {
          LoginView.routeName: (context) => const LoginView(),
          RegisterView.routeName: (context) => const RegisterView(),
          Beranda.routeName: (context) => const Beranda(),
          ProfileView.routeName: (context) => const ProfileView(),
        },
        title: 'Flutter Demo',
        home: const Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          body: ProfileView(),
        ),
      ),
    );
  }
}
