import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/feature/payment/presentation/widgets/payment_widgets.dart';

class PaymentWidgetMobile extends StatelessWidget {
  const PaymentWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: PaymentWidget(),
          ),
        ),
      ),
    );
  }
}
