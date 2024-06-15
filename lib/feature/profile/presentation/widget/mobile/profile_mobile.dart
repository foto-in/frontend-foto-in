import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/auth/provider/auth_provider.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/register_photographer_banner.dart';
import 'package:foto_in/feature/order_fotografer/presentation/view/fotografer_order_view.dart';
import 'package:foto_in/feature/portofolio_detail/presentation/view/portofolio_view.dart';
import 'package:foto_in/feature/profile/portofolio_anda/view/portofolio_photographer_view.dart';
import 'package:foto_in/feature/profile/presentation/widget/portofolio_card.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/view/add_portofolio_view.dart';
import 'package:foto_in/feature/profile/provider/profile_provider.dart';
import 'package:foto_in/feature/profile/register_photographer/view/register_photographer_view.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/feature/profile/presentation/widget/mobile/profile_menu_item.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ProfileMobile extends StatefulWidget {
  const ProfileMobile({super.key});

  @override
  State<ProfileMobile> createState() => _ProfileMobileState();
}

class _ProfileMobileState extends State<ProfileMobile> {
  @override
  void initState() {
    super.initState();
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    profileProvider.getProfile();
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
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
                    padding: const EdgeInsets.all(16),
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
                            const SizedBox(
                              width: 16,
                            ),
                            Consumer<ProfileProvider>(
                                builder: (context, profileProvider, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    profileProvider
                                            .profileResponse?.data.username ??
                                        "",
                                    style: FotoInHeadingTypography.xSmall(),
                                  ),
                                  Text(
                                    profileProvider
                                            .profileResponse?.data.fullname ??
                                        "",
                                    style: FotoInHeadingTypography.xxSmall(),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                  ),
                  Consumer<ProfileProvider>(
                      builder: (context, profileProvider, child) {
                    return Visibility(
                      visible: profileProvider.profileRole ==
                          ProfileRole.photographer,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Portofolio",
                                style: FotoInHeadingTypography.xSmall(),
                              ),
                              InkWell(
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
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          PortofolioCard(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                PortofolioDetailMobileView.routeName,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FotoInButton(
                            text: "Tambah Portofolio",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AddPortofolioView.routeName);
                            },
                            width: double.infinity,
                            backgroundColor: AppColor.backgroundPrimary,
                            textColor: AppColor.textPrimary,
                            border: const BorderSide(
                              color: AppColor.textPrimary,
                              width: 2,
                            ),
                            leading: const Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(Iconsax.add,
                                  color: AppColor.textPrimary),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
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
                        Consumer<ProfileProvider>(
                            builder: (context, profileProvider, child) {
                          return Visibility(
                            visible: profileProvider.profileRole ==
                                ProfileRole.photographer,
                            child: ProfileMenuItem(
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
                          );
                        }),
                        const ProfileMenuItem(
                          leadingIcon: Iconsax.notification5,
                          title: "Notifikasi",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                        const ProfileMenuItem(
                          leadingIcon: Iconsax.global5,
                          title: "Bahasa",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                        const ProfileMenuItem(
                          leadingIcon: Iconsax.message_question5,
                          title: "Bantuan",
                          trailingIcon: Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<ProfileProvider>(
                      builder: (context, profileProvider, child) {
                    return Visibility(
                      visible:
                          profileProvider.profileRole == ProfileRole.client,
                      child: RegisterPhotographerBannerMobile(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RegisterPhotographer.routeName,
                          );
                        },
                      ),
                    );
                  }),
                  Container(
                    margin: const EdgeInsets.symmetric(
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
