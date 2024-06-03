import 'package:flutter/material.dart';
import 'package:foto_in/feature/home/presentation/widgets/landing_page.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/home_widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Beranda extends StatelessWidget {
  static const String routeName = '/beranda';
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return const LandingPageWidgets();
      } else {
        return const MobileHomeWidgets();
      }
    });
  }
}
