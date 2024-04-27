import 'package:flutter/material.dart';
import 'package:foto_in/feature/service_order/presentation/widgets/service_order_web.dart';

class ServiceOrderView extends StatelessWidget {
  static const String routeName = '/service-order';

  const ServiceOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: ServiceOrderWeb(),
    );
  }
}
