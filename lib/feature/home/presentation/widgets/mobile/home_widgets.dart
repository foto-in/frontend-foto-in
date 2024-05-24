import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/home/presentation/widgets/category_card.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/animation_image.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/photographer_card.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/pinned-header.dart';

class MobileHomeWidgets extends StatelessWidget {
  const MobileHomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 214,
                  pinned: false,
                  floating: false,
                  flexibleSpace: Stack(
                    children: [
                      const Positioned.fill(
                        child: AnimationSwitcherWidgets(),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: SizedBox(
                          width: 205,
                          child: Text(
                            "Abadikan setiap momen Anda bersama Kami",
                            overflow: TextOverflow.clip,
                            style: FotoInSubHeadingTypography.large(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PinnedSearchBar()
              ];
            },
            body: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Untuk Pernikahan Anda!",
                        style: FotoInSubHeadingTypography.medium(
                          color: AppColor.textPrimary,
                        ),
                      ),
                      Text(
                        "Lihat Semua",
                        style: FotoInSubHeadingTypography.small(
                          color: AppColor.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const PhotographCard(),
                const SizedBox(height: 16),
                const PhotographCard(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Fotografi untuk Setiap Momen Penting",
                    style: FotoInHeadingTypography.xxSmall(
                        color: AppColor.textPrimary),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Ciptakan momen-momen indahmu sendiri!",
                    style: FotoInParagraph.xSmall(color: AppColor.textPrimary),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoryItems
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: CardCategoryMobile(
                              category: e.title,
                              image: e.image,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spesial wisuda",
                        style: FotoInSubHeadingTypography.medium(
                          color: AppColor.textPrimary,
                        ),
                      ),
                      Text(
                        "Lihat Semua",
                        style: FotoInSubHeadingTypography.small(
                          color: AppColor.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const PhotographCard(),
                const SizedBox(height: 16),
                const PhotographCard(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Container(
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 60,
                            left: -3,
                            child:
                                Image.asset('assets/images/star-subtract.png')),
                        Positioned(
                          right: 0,
                          top: -1,
                          child: Image.asset(
                              'assets/images/star-subtract-big.png'),
                        ),
                        Positioned(
                            top: 40,
                            right: 0,
                            child:
                                Image.asset('assets/images/photographer.png')),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Anda adalah seorang fotografer?",
                                style: FotoInSubHeadingTypography.xLarge(
                                    color: Colors.white),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 24),
                                    backgroundColor: AppColor.secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Daftar Sekarang",
                                    style: FotoInHeadingTypography.xxSmall(
                                      color: AppColor.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final String image;
  CategoryItem({required this.title, required this.image});
}

final List<CategoryItem> categoryItems = [
  CategoryItem(title: "Wedding", image: "assets/images/home/wedding.png"),
  CategoryItem(title: "Keluarga", image: "assets/images/home/keluarga.png"),
  CategoryItem(title: "Wisuda", image: "assets/images/home/wisuda.png"),
  CategoryItem(title: "Konser", image: "assets/images/home/konser.png"),
  CategoryItem(title: "Acara Sosial", image: "assets/images/home/sosial.png"),
  CategoryItem(title: "Produk", image: "assets/images/home/produk.png"),
  CategoryItem(title: "Traveler", image: "assets/images/home/travel.png"),
];
