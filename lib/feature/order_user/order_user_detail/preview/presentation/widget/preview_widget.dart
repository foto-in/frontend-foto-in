import 'package:flutter/material.dart';
import 'package:foto_in/feature/order_user/order_user_detail/preview/presentation/widget/preview_image.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            PreviewImage(),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
