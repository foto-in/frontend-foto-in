import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/portofolio/widget/description_form.dart';
import 'package:foto_in/feature/profile/portofolio/widget/images_form.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';

class PortofolioFormPage extends StatefulWidget {
  const PortofolioFormPage({super.key});

  @override
  State<PortofolioFormPage> createState() => _PortofolioFormPageState();
}

class _PortofolioFormPageState extends State<PortofolioFormPage> {
  int currentPage = 0;
  final PageController controller = PageController(initialPage: 0);

  // pages
  List<Widget> pages = [
    DescriptionForm(),
    ImagesForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Iconsax.arrow_left,
          weight: 5,
        ),
        SizedBox(height: 20),
        Expanded(
          child: PageView.builder(
            itemCount: pages.length,
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) => pages[index],
          ),
        ),
        SizedBox(height: 20),
        formNavigation(),
      ],
    );
  }

  Row formNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FotoInTextButton(
            onTap: () {
              if (currentPage > 0) {
                currentPage--;
                controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Row(
              children: [
                Icon(
                  Iconsax.arrow_left_2,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "Kembali",
                  style: FotoInSubHeadingTypography.medium(
                    color: AppColor.textPrimary,
                  ),
                ),
              ],
            )),
        FotoInTextButton(
          onTap: () {
            if (currentPage < pages.length - 1) {
              currentPage++;
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Row(
            children: [
              Text(
                "Selanjutnya",
                style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textPrimary,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Iconsax.arrow_right_3,
                size: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
