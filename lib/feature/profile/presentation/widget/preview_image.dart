import 'package:flutter/material.dart';
import 'package:foto_in/feature/profile/presentation/widget/image_container.dart';

class PreviewImage extends StatelessWidget {
  final int count;
  final double size;
  const PreviewImage({
    super.key,
    required this.count,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double widgetWidth = constraints.maxWidth;
      double gap = (widgetWidth - 104) / (count - 1);

      if (widgetWidth >= size * count) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            count,
            (index) {
              return ImageContainer(
                size: 104,
              );
            },
          ),
        );
      }

      return Stack(
        children: List.generate(
          count,
          (index) {
            return Padding(
              padding: EdgeInsets.only(left: index * gap),
              child: ImageContainer(
                size: 104,
              ),
            );
          },
        ),
      );
    });
  }
}
