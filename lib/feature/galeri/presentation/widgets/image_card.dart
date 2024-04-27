import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 240,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/image-carousel-web.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
