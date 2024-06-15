import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/presentation/widget/preview_image.dart';

class PortofolioCard extends StatelessWidget {
  final void Function() onTap;

  const PortofolioCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor.backgroundTertiary,
          width: 1.5,
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const PreviewImage(count: 4, size: 104),
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
          ),
        ),
      ),
    );
  }
}
