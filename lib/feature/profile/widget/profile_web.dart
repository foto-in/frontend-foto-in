import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/feature/profile/widget/edit_profile_form.dart';
import 'package:foto_in/feature/profile/widget/potofolio_page.dart';
import 'package:foto_in/feature/profile/widget/profile_menu_item.dart';
import 'package:foto_in/feature/profile/widget/register_photographer_banner.dart';
import 'package:foto_in/feature/profile/widget/reset_password_form.dart';
import 'package:iconsax/iconsax.dart';

class ProfileWeb extends StatefulWidget {
  const ProfileWeb({super.key});

  @override
  State<ProfileWeb> createState() => _ProfileWebState();
}

class _ProfileWebState extends State<ProfileWeb> {
  ProfileMenuItemModel activeMenu = menus.first;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const NavigationCustom(),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1500,
            ),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile',
                  textAlign: TextAlign.start,
                  style: FotoInHeadingTypography.medium(
                    color: AppColor.textPrimary,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menu(),
                    const SizedBox(width: 40),
                    Expanded(child: menuPage[menus.indexOf(activeMenu)]),
                    const SizedBox(width: 40),
                    activeMenu != menus[2]
                        ? const RegisterPhotographerBanner()
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container menu() {
    return Container(
      clipBehavior: Clip.antiAlias,
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffF5F5F5),
          width: 1.5,
        ),
      ),
      child: Column(
        children: menus
            .map(
              (e) => GestureDetector(
                onTap: () {
                  setState(() {
                    activeMenu = e;
                  });
                },
                child: ProfileMenuItem(
                  title: e.title,
                  icon: e.icon,
                  isActive: e == activeMenu,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ProfileMenuItemModel {
  final String title;
  final IconData icon;

  ProfileMenuItemModel({
    required this.title,
    required this.icon,
  });
}

final List<ProfileMenuItemModel> menus = [
  // Edit Profile
  ProfileMenuItemModel(
    title: 'Edit Profile',
    icon: Icons.person,
  ),

  // Reset Password
  ProfileMenuItemModel(
    title: 'Reset Password',
    icon: Icons.lock,
  ),

  // Portofolio
  ProfileMenuItemModel(
    title: 'Portofolio',
    icon: Iconsax.gallery_edit,
  ),
];

final List<Widget> menuPage = [
  const EditProfileForm(),
  const ResetPasswordForm(),
  const PortofolioPage()
];
