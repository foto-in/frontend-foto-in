import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/feature/order_user/order_user_detail/presentation/view/order_user_detail_view.dart';
import 'package:foto_in/feature/order_user/presentation/provider/order_provider.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/order_item.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/timestamp_id.dart';
import 'package:provider/provider.dart';

import 'tab_pill.dart';

class UserOrderMobile extends StatefulWidget {
  const UserOrderMobile({super.key});

  @override
  State<UserOrderMobile> createState() => _UserOrderMobileState();
}

class _UserOrderMobileState extends State<UserOrderMobile> {
  bool _isLoading = true;
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
    _fetchData();
  }

  Future<void> _fetchData() async {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    await orderProvider.getAllOrder();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderProvider>(context).orderList;
    print(orderList);
    final filteredOrderList =
        orderList.where((order) => order.status == _selectedStatus).toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            tabFilter(),
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : orderList.isEmpty
                      ? const Center(
                          child: Text("Tidak ada pesanan"),
                        )
                      : ListView.builder(
                          itemCount: filteredOrderList.length,
                          itemBuilder: (context, index) {
                            final order = filteredOrderList[index];
                            return OrderItem(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  OrderUserDetailView.routeName,
                                  arguments: order,
                                );
                              },
                              tfNama: order.photographerId,
                              tfTanggalBooking:
                                  formatDateToIndonesian(order.tanggalBooking),
                              tfTanggalFoto: order.sesiFoto,
                              tfStatus: convertToStatus(order.status),
                            );
                          },
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
