import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/status.dart';
import 'package:iconsax/iconsax.dart';

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
                children: [ProfileItem()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding tabFilter() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
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

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
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
          Text(
            "Cahaya Abafi Fotografi",
            style: FotoInSubHeadingTypography.large(),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ProfileInfo(
                title: "Tanggal booking",
                value: "24/03/2024",
              ),
              ProfileInfo(
                title: "Sesi foto",
                value: "31/03/2024",
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileInfo(
                title: "Status",
                value: "Menunggu Konfirmasi",
              ),
              Icon(Icons.chevron_right_rounded),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfo({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: FotoInSubHeadingTypography.xSmall(
              color: AppColor.textSecondary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: FotoInSubHeadingTypography.medium(),
          )
        ],
      ),
    );
  }
}

class TabPill extends StatelessWidget {
  final bool isActive;
  final String title;
  final Function() onTap;

  const TabPill({
    super.key,
    this.isActive = false,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      // make it pill
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: isActive ? AppColor.primary : AppColor.backgroundSecondary,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 11.5,
            ),
            child: Text(
              title,
              style: FotoInSubHeadingTypography.small(
                color: isActive
                    ? AppColor.backgroundPrimary
                    : AppColor.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
