import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/booking/presentation/view/booking_view.dart';
import 'package:foto_in/feature/fotografer/presentation/provider/fotografer_detail_provider.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/booking_bottom_bar.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/fotografer_kamera.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/fotografer_tag.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/photographer_achievement.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/portofolio_card_small.dart';
import 'package:foto_in/feature/portofolio/presentation/view/portofolio_view.dart';
import 'package:provider/provider.dart';

class FotograferDetailWidget extends StatefulWidget {
  const FotograferDetailWidget({super.key});

  @override
  State<FotograferDetailWidget> createState() => _FotograferDetailWidgetState();
}

class _FotograferDetailWidgetState extends State<FotograferDetailWidget> {
  late Future<void> _fetchDataFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String args = ModalRoute.of(context)!.settings.arguments as String;
    final FotograferDetailProvider fotograferDetailProvider =
        Provider.of<FotograferDetailProvider>(context, listen: false);
    _fetchDataFuture = fotograferDetailProvider.getFotograferDetail(args);
  }

  @override
  Widget build(BuildContext context) {
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
                        margin: const EdgeInsets.all(8),
                        child: IconButton(
                          icon: const Icon(
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
                body: FutureBuilder(
                    future: _fetchDataFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      return Consumer<FotograferDetailProvider>(
                          builder: (context, fotograferDetailProvider, child) {
                        return ListView(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.primaries[Random()
                                        .nextInt(Colors.primaries.length)],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fotograferDetailProvider
                                        .photographerDetailModel!.name,
                                    style: FotoInHeadingTypography.xSmall(
                                        color: AppColor.textPrimary),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const PhotographerAchievement(
                                        icon: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        text: "4.5",
                                      ),
                                      const PhotographerAchievement(
                                        icon: Icon(
                                          Icons.camera_alt,
                                          color: AppColor.textSecondary,
                                        ),
                                        text: "200+",
                                      ),
                                      PhotographerAchievement(
                                        icon: const Icon(
                                          Icons.photo,
                                          color: AppColor.textSecondary,
                                        ),
                                        text: fotograferDetailProvider
                                            .photographerDetailModel!
                                            .portofolios
                                            .length
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      // children: [
                                      //   FotograferTag(text: "Pernikahan"),
                                      //   FotograferTag(text: "Keluarga"),
                                      //   FotograferTag(text: "Wisuda"),
                                      // ],
                                      children: fotograferDetailProvider
                                          .photographerDetailModel!
                                          .specialization
                                          .map((e) => FotograferTag(text: e))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Portofolio
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Portofolio",
                                    style: FotoInHeadingTypography.xxSmall(
                                        color: AppColor.textPrimary),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          PortofolioMobileView.routeName);
                                    },
                                    child: Text(
                                      "Lihat Semua",
                                      style: FotoInSubHeadingTypography.xSmall(
                                        color: AppColor.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            fotograferDetailProvider.photographerDetailModel!
                                    .portofolios.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: fotograferDetailProvider
                                        .photographerDetailModel!
                                        .portofolios
                                        .length,
                                    itemBuilder: (context, index) {
                                      return PortofolioCardSmall(
                                        marginSide: 16,
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Text("Tidak ada portofolio"),
                                  ),

                            // Kamera
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: IntrinsicHeight(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // children: [
                                      //   FotograferKamera(
                                      //     image:
                                      //         "assets/images/fotografer/camera/Canon EOS 5D Mark IV Kit.png",
                                      //     kamera: "Canon EOS 5D Mark IV Kit",
                                      //   ),
                                      //   FotograferKamera(
                                      //     image:
                                      //         "assets/images/fotografer/camera/Nikon D780.png",
                                      //     kamera: "Nikon D780",
                                      //   ),
                                      //   FotograferKamera(
                                      //     image:
                                      //         "assets/images/fotografer/camera/Nikon D780.png",
                                      //     kamera: "Nikon D780",
                                      //   ),
                                      // ],
                                      children: fotograferDetailProvider
                                          .photographerDetailModel!.camera
                                          .map((e) => FotograferKamera(
                                                kamera: e,
                                                image:
                                                    "assets/images/fotografer/camera/Canon EOS 5D Mark IV Kit.png",
                                              ))
                                          .toList()),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        );
                      });
                    }),
              ),
            ),
            Consumer<FotograferDetailProvider>(
              builder: (context, fotograferDetailProvider, child) {
                return BookingBottomBar(
                  price: fotograferDetailProvider
                      .photographerDetailModel!.endPrice,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      BookingView.routeName,
                      arguments:
                          fotograferDetailProvider.photographerDetailModel!,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
