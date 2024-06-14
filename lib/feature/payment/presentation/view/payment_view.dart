import 'package:flutter/cupertino.dart';
import 'package:foto_in/feature/payment/presentation/widgets/mobile/payment_widget_mobile.dart';
import 'package:foto_in/feature/payment/presentation/widgets/payment_widget_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PaymentView extends StatelessWidget {
  static const String routeName = '/payment';
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return const PaymentWidgetWeb();
        } else {
          return const PaymentWidgetMobile();
        }
      },
    );
    // return const PaymentWidgetWeb();
  }
}
