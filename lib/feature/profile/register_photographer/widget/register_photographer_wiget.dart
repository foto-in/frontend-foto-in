import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/informasi_pribadi.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/informasi_tambahan.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/jenis_pemotretan.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/portofolio_page_form.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/status.dart';
import 'package:foto_in/utils/button.dart';
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
    const Status(),
    const JenisPemotretan(),
    const InformasiPribadi(),
    const InformasiTambahan(),
    const PortofolioPageForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      body: Column(
        children: [
          const NavigationCustom(),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(
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
        const Icon(
          Icons.arrow_back,
          size: 24,
        ),
        const SizedBox(width: 10),
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
                const Icon(
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
              const Icon(
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
