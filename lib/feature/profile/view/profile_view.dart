import 'package:flutter/material.dart';
import 'package:foto_in/feature/profile/widget/mobile/profile_mobile.dart';
import 'package:foto_in/feature/profile/widget/profile_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: ResponsiveBuilder(builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return const ProfileWeb();
        } else {
          return const ProfileMobile();
        }
      }),
    );
  }
}
