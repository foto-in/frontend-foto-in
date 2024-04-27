import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({super.key});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _updateHover(true),
      onExit: (_) => _updateHover(false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image-carousel-web.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Visibility(
            visible: _isHovering,
            child: Container(
              width: 240,
              height: 240,
              color: Colors.black45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      Iconsax.eye3,
                      color: Colors.white,
                      size: 48,
                    ),
                    onPressed: () {
                      _showFullImage(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Iconsax.arrow_down_2,
                      color: Colors.white,
                      size: 48,
                    ),
                    onPressed: () {
                      // Define what happens when you click the delete icon
                      print("Delete icon clicked");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }

  void _showFullImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              InteractiveViewer(
                panEnabled: false,
                boundaryMargin: const EdgeInsets.all(40),
                minScale: 0.5,
                maxScale: 2,
                child: Image.asset("assets/images/image-carousel-web.png"),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
    );
  }
}
