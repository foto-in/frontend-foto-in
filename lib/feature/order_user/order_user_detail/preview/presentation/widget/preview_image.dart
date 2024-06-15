import 'package:flutter/cupertino.dart';
import 'package:foto_in/core/styles/colors.dart';

class PreviewImage extends StatelessWidget {
  const PreviewImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 230,
      clipBehavior: Clip.antiAlias,
      child: Image(
        image: NetworkImage(
          'https://images.unsplash.com/photo-1718049720096-7f1af82d69af',
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
