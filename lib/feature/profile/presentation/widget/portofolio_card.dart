import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class PortofolioCard extends StatelessWidget {
  const PortofolioCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
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
          const SizedBox(height: 16),
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
              const SizedBox(height: 8),
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
              padding: EdgeInsets.only(left: gap),
              child: imageContainer(),
            ),
            Padding(
              padding: EdgeInsets.only(left: gap * 2),
              child: imageContainer(),
            ),
            Padding(
              padding: EdgeInsets.only(left: gap * 3),
              child: imageContainer(),
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
