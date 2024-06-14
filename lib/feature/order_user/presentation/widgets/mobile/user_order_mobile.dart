import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/order_item.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';

import 'tab_pill.dart';

class UserOrderMobile extends StatefulWidget {
  const UserOrderMobile({super.key});

  @override
  State<UserOrderMobile> createState() => _UserOrderMobileState();
}

class _UserOrderMobileState extends State<UserOrderMobile> {
  final List<String> _orderStatus = [
    "Semua",
    "Menunggu Konfirmasi",
    "Diproses",
    "Selesai"
  ];

  String _selectedStatus = "";

  @override
  void initState() {
    super.initState();
    _selectedStatus = _orderStatus.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            tabFilter(),
            Expanded(
              child: ListView(
                children: [OrderItem(), OrderItem(), OrderItem()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding tabFilter() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _orderStatus
              .map(
                (status) => TabPill(
                  title: status,
                  isActive: _selectedStatus == status,
                  onTap: () {
                    setState(() {
                      _selectedStatus = status;
                    });
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
      child: ProfileFormTitle(
        title: "Pesanan Anda",
      ),
    );
  }
}
