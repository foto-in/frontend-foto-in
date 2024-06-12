import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/feature/galeri/presentation/widgets/mobile/galeri_item.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';

class GaleriMobileWidget extends StatelessWidget {
  const GaleriMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            title(),
            Expanded(
              child: AutoHeightGridView(
                padding: const EdgeInsets.all(16),
                itemCount: 6,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                shrinkWrap: true,
                builder: (context, index) {
                  return GaleriItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.5,
            color: Color(0xFFF5F5F5),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
        child: ProfileFormTitle(
          title: "Galeri",
        ),
      ),
    );
  }
}
