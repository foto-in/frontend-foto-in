import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/portofolio/widget/portofolio_form_page.dart';
import 'package:iconsax/iconsax.dart';

class PortofolioPage extends StatelessWidget {
  const PortofolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        mainAxisExtent: 250,
      ),
      children: [
        PortofolioCard(),
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
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: PortofolioFormPage(),
                  ),
                  color: Colors.white,
                ),
                constraints: BoxConstraints(maxWidth: 620, maxHeight: 630),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
            side: BorderSide(width: 2, color: AppColor.primary),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.add,
              color: AppColor.primary,
            ),
            SizedBox(width: 16),
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

class PortofolioCard extends StatelessWidget {
  const PortofolioCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor.backgroundTertiary,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          previewImage(),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pernikahan Romantis di Pantai',
                style: FotoInHeadingTypography.xxSmall(
                  color: AppColor.primary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                'Pernikahan pasangan Budi dan Ani yang diadakan di tepi pantai dengan tema romantis dan alami. Foto-foto ini menampilkan momen-momen istimewa sepanjang acara pernikahan mereka, mulai dari persiapan pagi hingga pesta malam hari.',
                style: FotoInParagraph.small(
                  color: AppColor.textPrimary,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget previewImage() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double widgetWidth = constraints.maxWidth;
        double gap = (widgetWidth - 100) / 3;
        return Stack(
          children: [
            imageContainer(),
            Padding(
              child: imageContainer(),
              padding: EdgeInsets.only(left: gap),
            ),
            Padding(
              child: imageContainer(),
              padding: EdgeInsets.only(left: gap * 2),
            ),
            Padding(
              child: imageContainer(),
              padding: EdgeInsets.only(left: gap * 3),
            ),
          ],
        );
      },
    );
  }

  Container imageContainer() {
    return Container(
      height: 104,
      width: 104,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage('assets/images/image-carousel-web.png'),
          fit: BoxFit.cover,
        ),
        // color: Color(0xff000000).withAlpha(50),
      ),
    );
  }
}
