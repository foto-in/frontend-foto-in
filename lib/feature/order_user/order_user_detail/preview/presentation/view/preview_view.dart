import 'package:flutter/cupertino.dart';

import '../widget/preview_widget.dart';

class PreviewView extends StatelessWidget {
  static const String routeName = '/preview';
  const PreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return PreviewWidget();
  }
}
