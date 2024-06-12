import 'package:flutter/material.dart';
import 'package:foto_in/feature/galeri/galeri_details/presentation/widgets/galeri_details_widgets.dart';
import 'package:foto_in/feature/galeri/galeri_details/presentation/widgets/mobile/galeri_details_widget_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GaleriDetailsView extends StatelessWidget {
  static const String routeName = '/galeri-details';
  const GaleriDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return const GaleriDetailsWidget();
      } else {
        return const GaleriDetailsMobileWidget();
      }
    });
  }
}
