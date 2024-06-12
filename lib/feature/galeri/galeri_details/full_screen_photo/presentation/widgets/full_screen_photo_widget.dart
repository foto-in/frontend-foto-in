import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/utils/button.dart';

List<String> images = [
  "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
  "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
  "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
  "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
];

class FullScreenPhotoWidget extends StatefulWidget {
  const FullScreenPhotoWidget({super.key});

  @override
  State<FullScreenPhotoWidget> createState() => _FullScreenPhotoWidgetState();
}

class _FullScreenPhotoWidgetState extends State<FullScreenPhotoWidget> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
              child: PageView(
                controller: _pageController,
                children: images.map((e) => ImageFullScreen()).toList(),
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

class ImageFullScreen extends StatelessWidget {
  const ImageFullScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: NetworkImage(
          "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
