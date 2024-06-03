import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foto_in/feature/galeri/presentation/view/galeri_view.dart';
import 'package:foto_in/feature/home/presentation/view/beranda.dart';
import 'package:foto_in/feature/order_user/presentation/view/user_order_view.dart';
import 'package:foto_in/feature/profile/view/profile_view.dart';

class NavigationBarMobile extends StatefulWidget {
  const NavigationBarMobile({super.key});

  @override
  State<NavigationBarMobile> createState() => _NavigationBarMobileState();
}

class _NavigationBarMobileState extends State<NavigationBarMobile> {
  int _currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: Color(0xffffffff),
          indicatorColor: Colors.transparent,
          elevation: 0,
          onDestinationSelected: (int index) {
            setState(() {
              _currentImageIndex = index;
            });
          },
          selectedIndex: _currentImageIndex,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/home-outline.svg'),
              selectedIcon: SvgPicture.asset('assets/icons/home-filled.svg'),
              label: 'Beranda',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/find-outline.svg'),
              selectedIcon: SvgPicture.asset('assets/icons/find-filled.svg'),
              label: 'Galeri',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/invoice-outline.svg'),
              selectedIcon: SvgPicture.asset('assets/icons/invoice-filled.svg'),
              label: 'Pesanan',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/profile-outline.svg'),
              selectedIcon: SvgPicture.asset('assets/icons/profile-filled.svg'),
              label: 'Profil',
            ),
          ],
        ),
        body: <Widget>[
          const Beranda(),
          const GaleriView(),
          const UserOrderView(),
          const ProfileView(),
        ][_currentImageIndex]);
  }
}
