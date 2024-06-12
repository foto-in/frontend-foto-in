import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/galeri/presentation/widgets/image_card.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:iconsax/iconsax.dart';

class GaleriDetailsWidget extends StatelessWidget {
  const GaleriDetailsWidget({super.key});

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
              Column(
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Iconsax.arrow_left,
                          size: 24,
                          color: AppColor.textPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Galeri/Cahaya Abadi Fotografi",
                        style: FotoInSubHeadingTypography.medium(
                            color: AppColor.textSecondary),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: List.generate(
                      20,
                      (index) => const ImageCard(),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
