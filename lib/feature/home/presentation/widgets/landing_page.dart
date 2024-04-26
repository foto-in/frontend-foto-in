import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:iconsax/iconsax.dart';

class LandingPageWidgets extends StatelessWidget {
  const LandingPageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _content(context),
      ),
    );
  }

  Column _content(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Column(
      children: [
        const NavigationCustom(),
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
                  child: ResizeWidgets(
                    width: 560,
                    lChild: Row(
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
                                        style: FotoInSubHeadingTypography.large(
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
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.5,
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                              minHeight: 0,
                              minWidth: 0,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: const Image(
                              image: AssetImage(
                                  'assets/images/image-carousel-web.png'),
                              alignment: Alignment.center,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxHeight: 400,
                            maxWidth: double.infinity,
                            minHeight: 0,
                            minWidth: 0,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: const Image(
                            image: AssetImage(
                                'assets/images/image-carousel-web.png'),
                            alignment: Alignment.center,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
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
                                        style: FotoInSubHeadingTypography.large(
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
                      ],
                    ),
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
                        style:
                            FotoInParagraph.large(color: AppColor.textPrimary),
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
                            color: AppColor.textPrimary),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 64),
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
                  child: ResizeWidgets(
                    width: 1482,
                    lChild: Row(
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
                                          AppColor.secondary.shade400,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                          'assets/images/photographer-ilustratation.png',
                        ),
                      ],
                    ),
                    sChild: Column(
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
                                          AppColor.secondary.shade400,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                          'assets/images/photographer-ilustratation.png',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                ResizeWidgets(
                  width: 1318,
                  sChild: Container(
                    decoration: const BoxDecoration(color: Color(0xfff7f7f7)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 48,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nikmati kemudahan memesan fotografer berkualitas.",
                            style: FotoInHeadingTypography.large(
                                color: AppColor.primary),
                          ),
                          const SizedBox(
                            height: 64,
                          ),
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
                            height: 24,
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
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          Image.asset("assets/images/android-ios-app.png"),
                        ],
                      ),
                    ),
                  ),
                  lChild: Container(
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
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 64),
                  decoration: const BoxDecoration(
                    color: AppColor.primary,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ResizeWidgets(
                        width: 810,
                        sChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/logo-big.png"),
                            const SizedBox(
                              height: 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Perusahaan",
                                  style: FotoInSubHeadingTypography.medium(
                                      color: AppColor.secondary),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  "Tentang Kami",
                                  style: FotoInParagraph.small(
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Karir",
                                  style: FotoInParagraph.small(
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Kontak",
                                  style: FotoInParagraph.small(
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Langganan",
                                  style: FotoInSubHeadingTypography.medium(
                                      color: AppColor.secondary),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                SizedBox(
                                  width: 283,
                                  child: TextField(
                                    cursorColor: AppColor.secondary,
                                    style: FotoInParagraph.small(
                                      color: const Color(0xffffffff),
                                    ),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: AppColor.secondary,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Color(0xffE4E4E7),
                                        ),
                                      ),
                                      hintText: "Masukkan email Anda",
                                      hintStyle: FotoInParagraph.small(
                                        color: const Color(0xffA1A1AA),
                                      ),
                                      prefixIcon: const Icon(
                                        Iconsax.sms,
                                        color: Color(0xffA1A1AA),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 11.1,
                                ),
                                SizedBox(
                                  width: 283,
                                  height: 51,
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
                                      "Berlangganan Sekarang",
                                      style: FotoInHeadingTypography.xxSmall(
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        lChild: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/logo-big.png"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Perusahaan",
                                  style: FotoInSubHeadingTypography.medium(
                                      color: AppColor.secondary),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  "Tentang Kami",
                                  style: FotoInParagraph.small(
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Karir",
                                  style: FotoInParagraph.small(
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Kontak",
                                  style: FotoInParagraph.small(
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Langganan",
                                  style: FotoInSubHeadingTypography.medium(
                                      color: AppColor.secondary),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                SizedBox(
                                  width: 283,
                                  child: TextField(
                                    cursorColor: AppColor.secondary,
                                    style: FotoInParagraph.small(
                                      color: const Color(0xffffffff),
                                    ),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: AppColor.secondary,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Color(0xffE4E4E7),
                                        ),
                                      ),
                                      hintText: "Masukkan email Anda",
                                      hintStyle: FotoInParagraph.small(
                                        color: const Color(0xffA1A1AA),
                                      ),
                                      prefixIcon: const Icon(
                                        Iconsax.sms,
                                        color: Color(0xffA1A1AA),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 11.1,
                                ),
                                SizedBox(
                                  width: 283,
                                  height: 51,
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
                                      "Berlangganan Sekarang",
                                      style: FotoInHeadingTypography.xxSmall(
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      ResizeWidgets(
                        width: 516,
                        sChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "© 2021 FotoIn. All rights reserved",
                              style: FotoInParagraph.small(
                                color: const Color(0xffffffff),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                Image.asset("assets/images/twitter-icon.png"),
                                const SizedBox(
                                  width: 24,
                                ),
                                Image.asset("assets/images/facebook-icon.png"),
                                const SizedBox(
                                  width: 24,
                                ),
                                Image.asset("assets/images/instagram-ic.png"),
                                const SizedBox(
                                  width: 24,
                                ),
                                Image.asset("assets/images/github-ic.png"),
                              ],
                            )
                          ],
                        ),
                        lChild: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "© 2021 FotoIn. All rights reserved",
                              style: FotoInParagraph.small(
                                color: const Color(0xffffffff),
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset("assets/images/twitter-icon.png"),
                                const SizedBox(
                                  width: 24,
                                ),
                                Image.asset("assets/images/facebook-icon.png"),
                                const SizedBox(
                                  width: 24,
                                ),
                                Image.asset("assets/images/instagram-ic.png"),
                                const SizedBox(
                                  width: 24,
                                ),
                                Image.asset("assets/images/github-ic.png"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
