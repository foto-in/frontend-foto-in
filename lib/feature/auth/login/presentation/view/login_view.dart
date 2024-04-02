import 'package:flutter/material.dart';
import 'package:foto_in/feature/auth/login/presentation/widgets/login_web.dart';
import 'package:foto_in/feature/auth/login/presentation/widgets/login_widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/login';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return const LoginWebWidgets();
      } else {
        return const LoginWidget();
      }
    });
  }
}
