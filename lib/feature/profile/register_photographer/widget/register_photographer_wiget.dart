import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/informasi_probadi.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/jenis_pemotretan.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/status.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPhotographerWidget extends StatefulWidget {
  const RegisterPhotographerWidget({super.key});

  @override
  State<RegisterPhotographerWidget> createState() =>
      _RegisterPhotographerWidgetState();
}

class _RegisterPhotographerWidgetState
    extends State<RegisterPhotographerWidget> {
  int currentPage = 0;
  final PageController controller = PageController(initialPage: 0);

  List<Widget> pages = [
    Status(),
    JenisPemotretan(),
    InformasiProbadi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavigationCustom(),
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 1500,
              ),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 64,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileNavigation(),
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 40),
                  formNavigation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row profileNavigation() {
    return Row(
      children: [
        Icon(
          Icons.arrow_back,
          size: 24,
        ),
        SizedBox(width: 10),
        Text(
          'Profil/Daftar menjadi fotografer',
          textAlign: TextAlign.start,
          style: FotoInSubHeadingTypography.medium(
            color: AppColor.textSecondary,
          ),
        ),
      ],
    );
  }

  Row formNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textButton(
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
          ),
        ),
        textButton(
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

  InkWell textButton({
    required Row child,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: AppColor.textTeriary.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
