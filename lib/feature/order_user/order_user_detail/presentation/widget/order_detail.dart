import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/order_info.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({
    super.key,
  });

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  bool _isExpanded = false;

  _toggleExpand() {
    setState(() {
      _isExpanded = true;
    });
  }

  _toggleCollapse() {
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundPrimary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xFFF5F5F5),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cahaya Abafi Fotografi",
                    style: FotoInSubHeadingTypography.large(),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Dibuat pada tanggal 24 Maret 2024",
                    style: FotoInSubHeadingTypography.xSmall(
                      color: AppColor.textSecondary,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: _isExpanded
                    ? Icon(Icons.keyboard_arrow_up)
                    : Icon(Icons.keyboard_arrow_down),
                onPressed: _isExpanded ? _toggleCollapse : _toggleExpand,
              ),
            ],
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            child: Visibility(
              visible: _isExpanded,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  OrderInfo(
                    title: "Jenis Acara",
                    value: "Pernikahan",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  OrderInfo(
                    title: "Lokasi",
                    value:
                        "Ballroom Hotel Majapahit, Jl. Sudirman No.456, Bandung",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  OrderInfo(
                    title: "Sesi Foto",
                    value: "31 Maret 2024",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OrderInfo(
                          title: "Durasi",
                          value: "8 Jam",
                        ),
                      ),
                      Expanded(
                        child: OrderInfo(
                          title: "Waktu Mulai",
                          value: "10:00 AM",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  OrderInfo(
                    title: "Catatan",
                    value:
                        "Kami ingin fokus pada momen-momen candid selama upacara dan resepsi.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
