import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/user_order_menu_item.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/enums/order_status_enum.dart';

class UserOrder extends StatefulWidget {
  const UserOrder({super.key});

  @override
  State<UserOrder> createState() => _UserOrderState();
}

class _UserOrderState extends State<UserOrder> {
  UserOrderFilterMenu activeMenu = filterMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const NavigationCustom(),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 1500,
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 64,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pesanan Anda',
                      textAlign: TextAlign.start,
                      style: FotoInHeadingTypography.medium(
                        color: AppColor.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Semua pesanan pelanggan akan berada disini.",
                      style: FotoInParagraph.large(
                        color: AppColor.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    menu(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 16,
                      ),
                      margin: const EdgeInsets.only(top: 32, bottom: 20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xffEEEEEE)),
                          top: BorderSide(color: Color(0xffEEEEEE)),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Nama Pelanggan",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Tanggal Booking",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Sesi Foto",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Status",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: serviceOrderMenuItems.length,
                        itemBuilder: (context, index) {
                          final item = serviceOrderMenuItems[index];
                          return UserOrderMenuItem(
                            name: item.name,
                            bookingDate: item.bookingDate,
                            photoSessionDate: item.photoSessionDate,
                            status: item.status,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container menu() {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 50.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: filterMenus
            .map(
              (e) => SizedBox(
                width: 240,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: BtnPrimary(
                    textColor:
                        e == activeMenu ? Colors.white : AppColor.textSecondary,
                    backgroundColor: e == activeMenu
                        ? AppColor.primary
                        : AppColor.backgroundSecondary,
                    tvButton: e.title,
                    onPressed: () {
                      setState(() {
                        activeMenu = e;
                      });
                    },
                    radius: 99,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

final List<UserOrderFilterMenu> filterMenus = [
  UserOrderFilterMenu(title: 'Semua'),
  UserOrderFilterMenu(title: 'Menunggu Konfirmasi'),
  UserOrderFilterMenu(title: 'Diproses'),
  UserOrderFilterMenu(title: 'Selesai'),
];

class UserOrderFilterMenu {
  final String title;

  UserOrderFilterMenu({required this.title});
}

final List<UserOrderMenuItem> serviceOrderMenuItems = [
  const UserOrderMenuItem(
    name: 'Asep',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.pendingConfirmation,
  ),
  const UserOrderMenuItem(
    name: 'Budi',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.completed,
  ),
  const UserOrderMenuItem(
    name: 'Va',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.pendingDP,
  ),
  const UserOrderMenuItem(
    name: 'Dedi',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.pendingPayment,
  ),
  const UserOrderMenuItem(
    name: 'Euis',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.process,
  ),
];
