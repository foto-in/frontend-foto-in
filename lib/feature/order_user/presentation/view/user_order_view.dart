import 'package:flutter/cupertino.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/user_order_mobile.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/user_order_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UserOrderView extends StatelessWidget {
  static const String routeName = '/pesanan';
  const UserOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return const UserOrder();
      } else {
        return const UserOrderMobile();
      }
    });
  }
}
