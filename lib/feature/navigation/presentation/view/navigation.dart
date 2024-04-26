import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';

class NavigationCustom extends StatefulWidget {
  const NavigationCustom({super.key});

  @override
  State<NavigationCustom> createState() => _NavigationCustom();
}

class _NavigationCustom extends State<NavigationCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 14,
            child: Image.asset('assets/images/logo-2.png'),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NavItem(
                  title: "Beranda",
                  onPressed: () {
                    // Navigasi ke halaman Beranda
                    Navigator.of(context).pushNamed('/beranda');
                  }),
              _NavItem(
                  title: "Booking",
                  onPressed: () {
                    // Navigasi ke halaman Booking
                    Navigator.of(context).pushNamed('/booking');
                  }),
              _NavItem(
                  title: "Galeri",
                  onPressed: () {
                    // Navigasi ke halaman Galeri
                    Navigator.of(context).pushNamed('/galeri');
                  }),
              _NavItem(
                  title: "Pesanan",
                  onPressed: () {
                    // Navigasi ke halaman Pesanan
                    Navigator.of(context).pushNamed('/pesanan');
                  }),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: BtnPrimaryWhite(
                  tvButton: "Masuk",
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 120,
                child: BtnPrimary(
                  radius: 8,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  tvButton: "Daftar",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: FotoInHeadingTypography.xxSmall(color: AppColor.textSecondary),
        ),
      ),
    );
  }
}