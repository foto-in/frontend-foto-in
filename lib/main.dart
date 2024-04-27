import 'package:flutter/material.dart';
import 'package:foto_in/feature/auth/login/presentation/provider/login_provider.dart';
import 'package:foto_in/feature/auth/login/presentation/view/login_view.dart';
import 'package:foto_in/feature/auth/register/presentation/provider/register_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/view/register_view.dart';
import 'package:foto_in/feature/home/presentation/view/beranda.dart';
import 'package:foto_in/feature/order_user/presentation/view/order_user_detai_view.dart';
import 'package:foto_in/feature/payment/presentation/widgets/payments_widgets.dart';
import 'package:foto_in/feature/profile/register_photographer/view/register_photographer_view.dart';
import 'package:foto_in/feature/profile/view/profile_view.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/order_user_detail.dart';
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
        },
        title: 'Flutter Demo',
        home: const Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          body: PaymentWidget(),
        ),
      ),
    );
  }
}
