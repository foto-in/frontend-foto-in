import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/provider/add_portofolio_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class AddedPhoto extends StatelessWidget {
  final int index;

  const AddedPhoto({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final AddPortofolioProvider addPortofolioProvider =
        Provider.of<AddPortofolioProvider>(context);
    return Container(
      height: 143,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image(
            // image: NetworkImage(
            //   "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
            // ),
            image: FileImage(addPortofolioProvider.images[index]),
            height: 143,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          GestureDetector(
            onTap: () {
              addPortofolioProvider.removeImage(index);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Iconsax.trash,
                color: AppColor.textPrimary,
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
