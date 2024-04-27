import 'package:flutter/cupertino.dart';

class ResizeWidgets extends StatelessWidget {
  const ResizeWidgets(
      {super.key,
      required this.width,
      required this.sChild,
      required this.lChild});

  final double width;
  final Widget sChild;
  final Widget lChild;

  @override
  Widget build(BuildContext context) {
    if (width > MediaQuery.of(context).size.width) {
      return sChild;
    } else {
      return lChild;
    }
  }
}
