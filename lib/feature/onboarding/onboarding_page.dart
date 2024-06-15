import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Terverifikasi & terpercaya',
    'Transaksi aman',
    'Banyak pilihan',
  ];

  List<String> subtitles = [
    'Seluruh fotografer yang ada pada platform\nsudah terverifikasi dan terpercaya.',
    'Seluruh transaksi dalam platform terjamin\naman  dan transparan oleh kami.',
    'Anda dapat  menemukan selera yang anda\ninginkan dengan berbagai pilihan fotografer.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/images/onboarding/onboarding_1.png',
                  height: 240,
                ),
                Image.asset(
                  'assets/images/onboarding/onboarding_2.png',
                  height: 240,
                ),
                Image.asset(
                  'assets/images/onboarding/onboarding_3.png',
                  height: 240,
                ),
              ],
              options: CarouselOptions(
                height: 240,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              carouselController: carouselController,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              titles[currentIndex],
              style: FotoInSubHeadingTypography.xxLarge(
                color: AppColor.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              subtitles[currentIndex],
              style: FotoInParagraph.medium(
                color: AppColor.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 48,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: currentIndex == 0 ? 24 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(
                    right: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: currentIndex == 0
                        ? AppColor.secondary
                        : const Color(0xff1FF0CA).withOpacity(0.3),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: currentIndex == 1 ? 24 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(
                    right: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: currentIndex == 1
                        ? AppColor.secondary
                        : const Color(0xff1FF0CA).withOpacity(0.3),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: currentIndex == 2 ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: currentIndex == 2
                        ? AppColor.secondary
                        : const Color(0xff1FF0CA).withOpacity(0.3),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            SizedBox(
              width: 343,
              height: 50,
              child: TextButton(
                onPressed: () {
                  if (currentIndex == 2) {
                    Provider.of<AuthProvider>(context, listen: false)
                        .changeAuthState(AuthState.login);
                  } else {
                    carouselController.nextPage();
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  currentIndex == 2 ? 'Mulai Sekarang' : 'Selanjutnya',
                  style: FotoInHeadingTypography.xxSmall(
                      color: AppColor.textFieldBackground),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
