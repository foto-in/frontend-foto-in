import 'package:flutter/material.dart';
import 'package:foto_in/feature/galeri/galeri_details/full_screen_photo/presentation/view/full_screen_photo_view.dart';

class PhotoGridItem extends StatelessWidget {
  const PhotoGridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(FullScreenPhotoView.routeName);
      },
      child: Container(
        width: double.infinity,
        color: Colors.blue,
        child: const Image(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
