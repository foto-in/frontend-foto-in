import 'package:flutter/cupertino.dart';
import 'package:foto_in/feature/booking/presentation/widgets/booking_widgets.dart';
import 'package:foto_in/feature/booking/presentation/widgets/mobile/boolking_widget_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BookingView extends StatelessWidget {
  static const String routeName = '/booking';
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return const BookingWidgets();
      } else {
        return const BookingWidgetMobile();
      }
    });
  }
}
