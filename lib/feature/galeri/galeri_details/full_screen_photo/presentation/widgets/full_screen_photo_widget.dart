import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/utils/button.dart';

class FullScreenPhotoWidget extends StatelessWidget {
  const FullScreenPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundPrimary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FotoInButton(
              text: "Simpan Foto",
              onPressed: () {},
              width: double.infinity,
              margin: const EdgeInsets.all(16),
            ),
          ],
        ),
      ),
    );
  }
}
