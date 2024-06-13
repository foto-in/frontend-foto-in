import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double size;

  const ImageContainer({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
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
