import 'package:flutter/material.dart';
import 'package:foto_in/feature/auth/login/presentation/provider/login_provider.dart';
import 'package:foto_in/feature/auth/login/presentation/view/login_view.dart';
import 'package:foto_in/feature/auth/register/presentation/provider/register_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/view/register_view.dart';
import 'package:foto_in/feature/galeri/presentation/view/galeri_view.dart';
import 'package:foto_in/feature/home/presentation/view/beranda.dart';
import 'package:foto_in/feature/order_user/presentation/view/order_user_detail_view.dart';
import 'package:foto_in/feature/order_user/presentation/view/user_order_view.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/user_order_web.dart';
import 'package:foto_in/feature/payment/presentation/view/payment_view.dart';
import 'package:foto_in/feature/profile/register_photographer/view/register_photographer_view.dart';
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
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        routes: {
          LoginView.routeName: (context) => const LoginView(),
          RegisterView.routeName: (context) => const RegisterView(),
          Beranda.routeName: (context) => const Beranda(),
          ProfileView.routeName: (context) => const ProfileView(),
          RegisterPhotographer.routeName: (context) =>
              const RegisterPhotographer(),
          OderDetailUserView.routeName: (context) => const OderDetailUserView(),
          GaleriView.routeName: (context) => const GaleriView(),
          UserOrderView.routeName: (context) => const UserOrderView(),
          PaymentView.routeName: (context) => const PaymentView(),
        },
        title: 'Flutter Demo',
        home: const Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          body: LoginView(),
        ),
      ),
    );
  }
}
