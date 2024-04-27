import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';

class ImagesForm extends StatefulWidget {
  const ImagesForm({
    super.key,
  });

  @override
  State<ImagesForm> createState() => _ImagesFormState();
}

class _ImagesFormState extends State<ImagesForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileFormTitle(
          title: "Tambah Portofolio",
          subtitle: "Lengkapi form berikut dengan benar.",
        ),
        const SizedBox(height: 20),
        GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 140,
          ),
          children: [
            imageItem(),
            imageItem(),
            addImageItem(),
          ],
        ),
      ],
    );
  }

  Container imageItem() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage("assets/images/image-carousel-web.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container addImageItem() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            color: AppColor.textSecondary,
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 55,
            child: Text(
              "Tambah Gambar",
              style: FotoInLabelTypography.small(color: AppColor.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
