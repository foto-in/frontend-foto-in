import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/auth/provider/auth_provider.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/register_photographer_banner.dart';
import 'package:foto_in/feature/order_fotografer/presentation/view/fotografer_order_view.dart';
import 'package:foto_in/feature/profile/portofolio_anda/view/portofolio_photographer_view.dart';
import 'package:foto_in/feature/profile/presentation/widget/portofolio_card.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/view/add_portofolio_view.dart';
import 'package:foto_in/feature/profile/register_photographer/view/register_photographer_view.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/feature/profile/presentation/widget/mobile/profile_menu_item.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ProfileFormTitle(
                title: "Profile",
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 2,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Circular Image
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "John Doe",
                                  style: FotoInHeadingTypography.xSmall(),
                                ),
                                Text(
                                  "John Doe",
                                  style: FotoInHeadingTypography.xxSmall(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Portofolio",
                          style: FotoInHeadingTypography.xSmall(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              PortofolioPhotographerView.routeName,
                            );
                          },
                          child: Text(
                            "Lihat Semua",
                            style: FotoInHeadingTypography.xxSmall(
                              color: AppColor.secondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PortofolioCard(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FotoInButton(
                      text: "Tambah Portofolio",
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AddPortofolioView.routeName);
                      },
                      width: double.infinity,
                      backgroundColor: AppColor.backgroundPrimary,
                      textColor: AppColor.textPrimary,
                      border: BorderSide(
                        color: AppColor.textPrimary,
                        width: 2,
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(Iconsax.add, color: AppColor.textPrimary),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 2,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ProfileMenuItem(
                          leadingIcon: Iconsax.task,
                          title: "Pesanan",
                          trailingIcon: Icons.arrow_forward_ios,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              FotograferOrderView.routeName,
                            );
                          },
                        ),
                        ProfileMenuItem(
                          leadingIcon: Iconsax.notification5,
                          title: "Notifikasi",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                        ProfileMenuItem(
                          leadingIcon: Iconsax.global5,
                          title: "Bahasa",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                        ProfileMenuItem(
                          leadingIcon: Iconsax.message_question5,
                          title: "Bantuan",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RegisterPhotographerBannerMobile(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RegisterPhotographer.routeName,
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        backgroundColor: AppColor.backgroundPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: AppColor.red600),
                        ),
                      ),
                      onPressed: () {
                        authProvider.logout();
                      },
                      child: Text(
                        "Keluar",
                        style: FotoInHeadingTypography.xxSmall(
                          color: AppColor.red600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
