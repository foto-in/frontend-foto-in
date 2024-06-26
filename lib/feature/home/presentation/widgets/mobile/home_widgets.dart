import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/home/presentation/provider/home_provider.dart';
import 'package:foto_in/feature/home/presentation/widgets/category_card.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/animation_image.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/photographer_card.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/pinned-header.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/register_photographer_banner.dart';
import 'package:foto_in/feature/profile/register_photographer/view/register_photographer_view.dart';
import 'package:provider/provider.dart';

class MobileHomeWidgets extends StatefulWidget {
  const MobileHomeWidgets({super.key});

  @override
  State<MobileHomeWidgets> createState() => _MobileHomeWidgetsState();
}

class _MobileHomeWidgetsState extends State<MobileHomeWidgets> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    await homeProvider.getAllPhotographer();
    if (mounted) {
      setState(() {
        _isLoading = false; // Data loadEed, update state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final homeProvider = Provider.of<HomeProvider>(context);
    final photographerWedding =
        Provider.of<HomeProvider>(context).photographerListWedding;
    final photographerWisuda =
        Provider.of<HomeProvider>(context).photographerListWisuda;
    final safePadding = MediaQuery.of(context).padding.top;
    print(safePadding);
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: false,
                  floating: false,
                  collapsedHeight: 200,
                  flexibleSpace: Stack(
                    children: [
                      const AnimationSwitcherWidgets(),
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
                SizedBox(
                  child: _isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(24.0),
                          child:
                              Center(child: CircularProgressIndicator()),
                        )
                      : photographerWedding.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Center(
                                  child:
                                      Text("No wedding photographers found.")),
                            )
                          : ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: PhotographCard(
                                    id: photographerWedding[index].id,
                                    photoProfile:
                                        photographerWedding[index].profileImage,
                                    namaFotografer:
                                        photographerWedding[index].name,
                                    rating: 5.0,
                                    portofolio:
                                        photographerWedding[index].portofolios,
                                  ),
                                );
                              },
                            ),
                ),
                const SizedBox(
                  height: 8,
                ),
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
                SizedBox(
                  child: _isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(24.0),
                          child:
                              Center(child: CircularProgressIndicator()),
                        )
                      : photographerWisuda.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Center(
                                  child: Text(
                                      "No gradution photographers found.")),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: PhotographCard(
                                    id: photographerWisuda[index].id,
                                    photoProfile:
                                        photographerWisuda[index].profileImage,
                                    namaFotografer:
                                        photographerWisuda[index].name,
                                    rating: 5.0,
                                    portofolio:
                                        photographerWisuda[index].portofolios,
                                  ),
                                );
                              },
                            ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Fotografi untuk Setiap Momen Penting",
                    style: FotoInHeadingTypography.xxSmall(
                        color: AppColor.textPrimary),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: RegisterPhotographerBannerMobile(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RegisterPhotographer.routeName,
                      );
                    },
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
