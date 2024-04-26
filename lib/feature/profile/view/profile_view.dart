import 'package:flutter/material.dart';
import 'package:foto_in/feature/profile/widget/profile_web.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: ProfileWeb(),
    );
  }
}
