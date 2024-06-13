import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/booking_bottom_bar.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/fotografer_kamera.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/fotografer_tag.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/photographer_achievement.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/portofolio_card_small.dart';

class FotograferDetailWidget extends StatelessWidget {
  const FotograferDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;
    print(safePadding);
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      leading: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.backgroundPrimary,
                        ),
                        // padding: EdgeInsets.all(4),
                        margin: EdgeInsets.all(8),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: AppColor.textPrimary,
                        ),
                      ),
                      expandedHeight: 200,
                      // collapsedHeight: 100,
                      backgroundColor: AppColor.backgroundPrimary,
                      surfaceTintColor: AppColor.backgroundPrimary,
                      pinned: true,
                      floating: false,
                      flexibleSpace: const FlexibleSpaceBar(
                        background: Image(
                          width: double.infinity,
                          image: AssetImage(
                            'assets/images/fotografer/fotografer-header.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ];
                },
                body: ListView(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Theresa Lynch",
                            style: FotoInHeadingTypography.xSmall(
                                color: AppColor.textPrimary),
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            children: [
                              PhotographerAchievement(
                                icon: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                text: "4.5",
                              ),
                              PhotographerAchievement(
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: AppColor.textSecondary,
                                ),
                                text: "200+",
                              ),
                              PhotographerAchievement(
                                icon: Icon(
                                  Icons.photo,
                                  color: AppColor.textSecondary,
                                ),
                                text: "4",
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            children: [
                              FotograferTag(text: "Pernikahan"),
                              FotograferTag(text: "Keluarga"),
                              FotograferTag(text: "Wisuda"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Portofolio
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Portofolio",
                            style: FotoInHeadingTypography.xxSmall(
                                color: AppColor.textPrimary),
                          ),
                          Text(
                            "Lihat Semua",
                            style: FotoInSubHeadingTypography.xSmall(
                              color: AppColor.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PortofolioCardSmall(),
                    PortofolioCardSmall(),
                    PortofolioCardSmall(),

                    // Kamera
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kamera",
                            style: FotoInHeadingTypography.xxSmall(
                                color: AppColor.textPrimary),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FotograferKamera(
                                image:
                                    "assets/images/fotografer/camera/Canon EOS 5D Mark IV Kit.png",
                                kamera: "Canon EOS 5D Mark IV Kit",
                              ),
                              FotograferKamera(
                                image:
                                    "assets/images/fotografer/camera/Nikon D780.png",
                                kamera: "Nikon D780",
                              ),
                              FotograferKamera(
                                image:
                                    "assets/images/fotografer/camera/Nikon D780.png",
                                kamera: "Nikon D780",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
            BookingBottomBar(),
          ],
        ),
      ),
    );
  }
}
