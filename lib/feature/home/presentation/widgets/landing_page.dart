import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';

class LandingPageWidgets extends StatelessWidget {
  const LandingPageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const NavBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 44,
              child: Center(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Abadikan Setiap Momen Bersama Kami",
                                  style: FotoInHeadingTypography.xxLarge(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                SizedBox(
                                  width: 290,
                                  height: 54,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(16),
                                      backgroundColor: AppColor.primary,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Booking Sekarang",
                                          style:
                                              FotoInSubHeadingTypography.large(
                                                  color: Colors.white),
                                        ),
                                        const Icon(Iconsax.arrow_right_1,
                                            color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/images/image-carousel-web.png',
                            height: 560,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fotografi Untuk Setiap Momen Penting",
                            style: FotoInHeadingTypography.large(
                              color: AppColor.textPrimary,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Ciptakan Momen Indahmu Sendiri!",
                            style: FotoInParagraph.large(
                                color: AppColor.textPrimary),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 8,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 40,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Mengapa memilih kami untuk sesi foto Anda?",
                            style: FotoInHeadingTypography.xxLarge(
                                color: AppColor.primary),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 8,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 40,
                              childAspectRatio: (620 / 189),
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 64),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xfff7f7f7),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Bagaimana caranya?",
                            style: FotoInHeadingTypography.xxLarge(
                                color: AppColor.primary),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              crossAxisSpacing: 40,
                              childAspectRatio: (224 / 284),
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.asset(
                                  'assets/images/web-card-bg-regis-home-photograph.png')
                              .image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 48),
                            child: SizedBox(
                              width: 720,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Raih penghasilan dari passion fotografi Anda",
                                    style: FotoInHeadingTypography.large(
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Bergabunglah dengan ribuan fotografer FotoIn dan mulailah mendapatkan klien, untuk segala jenis fotografi.",
                                    style: FotoInParagraph.large(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  SizedBox(
                                    width: 328,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 15),
                                        backgroundColor:
                                            FotoInColor.tosca.shade400,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        "Bergabung menjadi Fotografer",
                                        style: FotoInHeadingTypography.xSmall(
                                          color: AppColor.primary,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                              'assets/images/photographer-ilustratation.png'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Color(0xfff7f7f7)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 48,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/android-ios-app.png"),
                            SizedBox(
                              width: 498,
                              child: Column(
                                children: [
                                  Text(
                                    "Nikmati kemudahan memesan fotografer berkualitas.",
                                    style: FotoInHeadingTypography.large(
                                        color: AppColor.primary),
                                  ),
                                  const SizedBox(
                                    height: 110,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 63,
                                        width: 213,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: Image.asset(
                                                    'assets/images/btn-download-gplay.png')
                                                .image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 24,
                                      ),
                                      Container(
                                        height: 63,
                                        width: 213,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: Image.asset(
                                                    'assets/images/btn-download-appstore.png')
                                                .image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
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
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

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
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavItem(title: "Beranda"),
              NavItem(title: "Booking"),
              NavItem(title: "Galeri"),
              NavItem(title: "Pesanan"),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: BtnPrimaryWhite(
                  tvButton: "Masuk",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
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
                      Navigator.pushReplacementNamed(context, "/register");
                    },
                    tvButton: "Daftar",
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: FotoInHeadingTypography.xxSmall(color: AppColor.textSecondary),
      ),
    );
  }
}
