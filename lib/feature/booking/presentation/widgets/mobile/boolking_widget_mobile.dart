import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/booking_bottom_bar.dart';

class BookingWidgetMobile extends StatelessWidget {
  const BookingWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundPrimary,
        title: Text('Booking'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('Booking Widget Mobile'),
              ),
            ),
            BookingBottomBar()
          ],
        ),
      ),
    );
  }
}
