import 'package:flutter/cupertino.dart';

class AnimationSwitcherWidgets extends StatefulWidget {
  const AnimationSwitcherWidgets({super.key});

  @override
  State<AnimationSwitcherWidgets> createState() =>
      _AnimationSwitcherWidgetsState();
}

class _AnimationSwitcherWidgetsState extends State<AnimationSwitcherWidgets> {
  int _currentImageIndex = 0;
  final List<String> _images = [
    "assets/images/image-fadeIn-1.png",
    "assets/images/image-fadeIn-2.png",
    "assets/images/image-fadeIn-3.png",
    "assets/images/image-fadeIn-4.png",
    "assets/images/image-fadeIn-5.png",
  ];

  @override
  void initState() {
    _startAutoSwitch();
    super.initState();
  }

  void _startAutoSwitch() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _images.length;
      });
      _startAutoSwitch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Image.asset(
        _images[_currentImageIndex],
        key: ValueKey<int>(_currentImageIndex),
        fit: BoxFit.fill,
        width: double.infinity,
        height: 214,
      ),
    );
  }
}
