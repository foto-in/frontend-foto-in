import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/order_user/order_user_detail/preview/presentation/widget/preview_image.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';

class PortofolioDetailWidget extends StatelessWidget {
  const PortofolioDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portofolio Detail'),
        centerTitle: true,
        titleTextStyle: FotoInHeadingTypography.xSmall(
          color: AppColor.textPrimary,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            ProfileFormTitle(
              title: "Pernikahan Romantis di Pantai",
              subtitle:
                  "Pernikahan pasangan Budi dan Ani yang diadakan di tepi pantai dengan tema romantis dan alami. Foto-foto ini menampilkan momen-momen istimewa sepanjang acara pernikahan mereka.",
            ),
            SizedBox(height: 20),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
          ],
        ),
      ),
    );
  }
}
