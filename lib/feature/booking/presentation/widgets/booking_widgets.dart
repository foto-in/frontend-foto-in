import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';

class BookingWidgets extends StatefulWidget {
  const BookingWidgets({super.key});

  @override
  State<BookingWidgets> createState() => _BookingWidgetsState();
}

class _BookingWidgetsState extends State<BookingWidgets> {
  KategoriSpesialis activeMenu = filterMenus.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NavigationCustom(),
        SizedBox(
          height: MediaQuery.of(context).size.height - 44,
          child: Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const SizedBox(
                  height: 64,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                  ),
                  child: ResizeWidgets(
                    width: 560,
                    sChild: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 560,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/image-carousel-web.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 222,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Temukan Fotografer Profesional \nuntuk acara penting anda.",
                                        style: FotoInHeadingTypography.xLarge(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    lChild: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 560,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/image-carousel-web.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 222,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    Text(
                                      "Temukan Fotografer Profesional \nuntuk acara penting anda.",
                                      style: FotoInHeadingTypography.xLarge(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Cari fotografer",
                              hintStyle: FotoInLabelTypography.medium(
                                color: AppColor.textTeriary,
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Icon(
                                  Iconsax.search_normal,
                                  color: AppColor.textTeriary,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32),
                                borderSide: const BorderSide(
                                  color: AppColor.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                          ),
                          child: menu(),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 16,
                            mainAxisExtent: 466,
                          ),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.backgroundSecondary,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/image-carousel-web.png",
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Cahaya Abadi Fotografi",
                                          style:
                                              FotoInHeadingTypography.xxSmall(
                                            color: AppColor.textPrimary,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Semarang, Jawa Tengah",
                                          style: FotoInParagraph.small(
                                            color: AppColor.textSecondary,
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pernikahan",
                                                  style:
                                                      FotoInSubHeadingTypography
                                                          .small(
                                                              color: AppColor
                                                                  .textPrimary),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  "Wisuda",
                                                  style:
                                                      FotoInSubHeadingTypography
                                                          .small(
                                                    color: AppColor.textPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Iconsax.star1,
                                                  color:
                                                      AppColor.yellow.shade600,
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "4.8 (50 Project)",
                                                  style: FotoInHeadingTypography
                                                      .xxSmall(
                                                    color: AppColor.textPrimary,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget menu() {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 50.0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: filterMenus
              .map(
                (e) => SizedBox(
                  width: 170,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: BtnPrimary(
                      textColor: e == activeMenu
                          ? Colors.white
                          : AppColor.textSecondary,
                      backgroundColor: e == activeMenu
                          ? AppColor.primary
                          : AppColor.backgroundSecondary,
                      tvButton: e.title,
                      onPressed: () {
                        setState(() {
                          activeMenu = e;
                        });
                      },
                      radius: 99,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class KategoriSpesialis {
  final String title;

  KategoriSpesialis({required this.title});
}

final List<KategoriSpesialis> filterMenus = [
  KategoriSpesialis(title: 'Semua'),
  KategoriSpesialis(title: 'Pernikahan'),
  KategoriSpesialis(title: 'Keluarga'),
  KategoriSpesialis(title: 'Wisuda'),
  KategoriSpesialis(title: 'Konser'),
  KategoriSpesialis(title: 'Acara Sosial'),
  KategoriSpesialis(title: 'Travel'),
];

class ResizeWidgets extends StatelessWidget {
  const ResizeWidgets(
      {super.key,
      required this.width,
      required this.sChild,
      required this.lChild});

  final double width;
  final Widget sChild;
  final Widget lChild;

  @override
  Widget build(BuildContext context) {
    if (width > MediaQuery.of(context).size.width) {
      return sChild;
    } else {
      return lChild;
    }
  }
}
