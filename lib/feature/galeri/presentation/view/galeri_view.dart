import 'package:flutter/material.dart';
import 'package:foto_in/feature/galeri/presentation/widgets/galeri_widgets.dart';
import 'package:foto_in/feature/galeri/presentation/widgets/mobile/galeri_mobile_widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GaleriView extends StatelessWidget {
  static const String routeName = '/galeri';
  const GaleriView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return const GaleriWidgets();
      } else {
        return const GaleriMobileWidget();
      }
    });
  }
}
