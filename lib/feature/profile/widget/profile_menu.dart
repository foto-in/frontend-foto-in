import 'package:flutter/material.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ListTile(
          title: Text('Profile'),
          leading: Icon(Icons.person),
        ),
        ListTile(
          title: Text('Settings'),
          leading: Icon(Icons.settings),
        ),
        ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.logout),
        ),
      ],
    );
  }
}
