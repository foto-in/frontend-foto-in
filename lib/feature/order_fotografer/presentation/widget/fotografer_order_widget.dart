import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/presentation/view/order_fotografer_detail_view.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/order_item.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/tab_pill.dart';

class FotograferOrderWidget extends StatefulWidget {
  const FotograferOrderWidget({super.key});

  @override
  State<FotograferOrderWidget> createState() => _FotograferOrderWidgetState();
}

class _FotograferOrderWidgetState extends State<FotograferOrderWidget> {
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
      appBar: AppBar(
        title: const Text('Pesanan'),
        // border bottom
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColor.border,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            tabFilter(),
            Expanded(
              child: ListView(
                children: [
                  // OrderItem(
                  //   onTap: () {
                  //     Navigator.pushNamed(
                  //         context, OrderFotofgraferDetailView.routeName);
                  //   },
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding tabFilter() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 20),
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
}
