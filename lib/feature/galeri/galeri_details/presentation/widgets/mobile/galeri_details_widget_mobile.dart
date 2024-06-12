import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/galeri/galeri_details/presentation/widgets/mobile/photo_grid_item.dart';

class GaleriDetailsMobileWidget extends StatelessWidget {
  const GaleriDetailsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundPrimary,
        title: Text(
          "Cahaya Abadi Fotografi",
          style: FotoInHeadingTypography.small(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: Color(0xFFF5F5F5),
            height: 1,
          ),
        ),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        children: List.generate(
          6,
          (index) => PhotoGridItem(),
        ),
      ),
    );
  }
}
