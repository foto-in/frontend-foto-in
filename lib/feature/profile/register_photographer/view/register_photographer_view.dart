import 'package:flutter/material.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/mobile/register_photograph_mobile.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/register_photographer_wiget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RegisterPhotographer extends StatelessWidget {
  static const String routeName = '/register_photographer';

  const RegisterPhotographer({super.key});

  @override
  Widget build(BuildContext context) {
    // return const RegisterPhotographerWidget();
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return const RegisterPhotographerWidget();
      } else {
        return const ProgressPage();
      }
    });
  }
}
