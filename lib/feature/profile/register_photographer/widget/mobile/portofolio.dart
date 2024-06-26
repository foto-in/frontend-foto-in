import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/view/add_portofolio_view.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/feature/profile/presentation/widget/portofolio_card.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';

class PortofolioPageMobile extends StatelessWidget {
  const PortofolioPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileFormTitle(
          title: "Portofolio",
          subtitle: "Anda harus melampirkan minimal satu portofolio anda.",
        ),
        const SizedBox(height: 20),
        PortofolioCard(
          id: 'xxx',
          title: 'Pernikahan Romantis di Pantai',
          description:
              'Pernikahan pasangan Budi dan Ani yang diadakan di tepi pantai dengan tema romantis dan alami. Foto-foto ini menampilkan momen-momen istimewa sepanjang acara pernikahan mereka, mulai dari persiapan pagi hingga pesta malam hari.',
          onTap: () {},
        ),
        const SizedBox(height: 20),
        FotoInButton(
          text: "Tambah Portofolio",
          onPressed: () {
            Navigator.pushNamed(context, AddPortofolioView.routeName);
          },
          width: double.infinity,
          backgroundColor: AppColor.backgroundPrimary,
          textColor: AppColor.textPrimary,
          border: const BorderSide(
            color: AppColor.textPrimary,
            width: 2,
          ),
          leading: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Iconsax.add, color: AppColor.textPrimary),
          ),
        ),
      ],
    );
  }
}
