import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/portofolio/widget/portofolio_form_page.dart';
import 'package:foto_in/feature/profile/widget/portofolio_card.dart';
import 'package:iconsax/iconsax.dart';

class PortofolioPage extends StatelessWidget {
  const PortofolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        mainAxisExtent: 250,
      ),
      children: [
        const PortofolioCard(),
        addPortofolio(context),
      ],
    );
  }

  GestureDetector addPortofolio(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              child: Container(
                clipBehavior: Clip.antiAlias,
                constraints:
                    const BoxConstraints(maxWidth: 620, maxHeight: 630),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Material(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: PortofolioFormPage(),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColor.primary),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.add,
              color: AppColor.primary,
            ),
            const SizedBox(width: 16),
            Text(
              'Tambah Portofolio',
              style: FotoInHeadingTypography.xxSmall(
                color: AppColor.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
