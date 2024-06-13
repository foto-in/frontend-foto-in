import 'package:flutter/cupertino.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class FotograferKamera extends StatelessWidget {
  final String image;
  final String kamera;

  const FotograferKamera({
    super.key,
    required this.image,
    required this.kamera,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.5,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.backgroundPrimary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xFFF5F5F5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 80,
            image: AssetImage(image),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            kamera,
            style: FotoInLabelTypography.xSmall(),
          )
        ],
      ),
    );
  }
}
