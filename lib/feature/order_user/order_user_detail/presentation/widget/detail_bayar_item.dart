import 'package:flutter/cupertino.dart';

class DetailBayarItem extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle style;

  const DetailBayarItem({
    super.key,
    required this.title,
    required this.value,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style,
        ),
        Text(
          value,
          style: style,
        ),
      ],
    );
  }
}
