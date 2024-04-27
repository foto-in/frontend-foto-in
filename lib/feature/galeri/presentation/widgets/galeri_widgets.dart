import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/galeri/presentation/widgets/galeri_card.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:iconsax/iconsax.dart';

class GaleriWidgets extends StatelessWidget {
  const GaleriWidgets({super.key});

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
    return Column(
      children: [
        const NavigationCustom(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          height: MediaQuery.of(context).size.height - 44,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "Galeri",
                style: FotoInHeadingTypography.medium(
                  color: AppColor.textPrimary,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Semua hasil foto pemesanan Anda akan berada disini.",
                style: FotoInParagraph.large(
                  color: AppColor.textPrimary,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Wrap(
                spacing: 32,
                runSpacing: 32,
                children: List.generate(
                  8,
                  (index) => const GaleriCard(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/galeri');
                      },
                      child: Row(
                        children: [
                          Text(
                            "Selanjutnya",
                            style: FotoInSubHeadingTypography.medium(
                              color: AppColor.textPrimary,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Iconsax.arrow_right_1,
                            size: 24,
                            color: AppColor.textPrimary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
