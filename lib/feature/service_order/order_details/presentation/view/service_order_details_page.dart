import 'package:flutter/material.dart';
import 'package:foto_in/feature/service_order/order_details/presentation/widgets/service_order_details.dart';

class ServiceOrderDetailsPage extends StatelessWidget {
  static const String routeName = '/service_order_details';

  const ServiceOrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceOrderDetail();
  }
}
