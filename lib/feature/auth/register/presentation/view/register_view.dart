import 'package:flutter/cupertino.dart';
import 'package:foto_in/feature/auth/register/presentation/widgets/register_web.dart';
import 'package:foto_in/feature/auth/register/presentation/widgets/register_widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RegisterView extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return const RegisterWebWidgets();
        } else {
          return const RegisterWidget();
        }
      },
    );
  }
}
