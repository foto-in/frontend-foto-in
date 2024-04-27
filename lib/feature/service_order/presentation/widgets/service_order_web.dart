import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/feature/service_order/presentation/widgets/service_order_menu_item.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/enums/order_status_enum.dart';

class ServiceOrderWeb extends StatefulWidget {
  const ServiceOrderWeb({super.key});

  @override
  State<ServiceOrderWeb> createState() => _ServiceOrderWebState();
}

class _ServiceOrderWebState extends State<ServiceOrderWeb> {
  ServiceOrderFilterMenu activeMenu = filterMenus.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NavigationCustom(),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 1500,
          ),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: serviceOrderMenuItems.length,
                itemBuilder: (context, index) {
                  final item = serviceOrderMenuItems[index];
                  return ServiceOrderMenuItem(
                    name: item.name,
                    bookingDate: item.bookingDate,
                    photoSessionDate: item.photoSessionDate,
                    status: item.status,
                  );
                },
              ),
            ],
          ),
        )
      ],
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

class ServiceOrderFilterMenu {
  final String title;

  ServiceOrderFilterMenu({required this.title});
}

final List<ServiceOrderFilterMenu> filterMenus = [
  ServiceOrderFilterMenu(title: 'Semua'),
  ServiceOrderFilterMenu(title: 'Menunggu Konfirmasi'),
  ServiceOrderFilterMenu(title: 'Diproses'),
  ServiceOrderFilterMenu(title: 'Selesai'),
];

//Bikin 5 dummy untuk service order menu item dan random
final List<ServiceOrderMenuItem> serviceOrderMenuItems = [
  const ServiceOrderMenuItem(
    name: 'Asep',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.pendingConfirmation,
  ),
  const ServiceOrderMenuItem(
    name: 'Budi',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.completed,
  ),
  const ServiceOrderMenuItem(
    name: 'Va',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.pendingDP,
  ),
  const ServiceOrderMenuItem(
    name: 'Dedi',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.pendingPayment,
  ),
  const ServiceOrderMenuItem(
    name: 'Euis',
    bookingDate: '12/12/2021',
    photoSessionDate: '12/12/2021',
    status: OrderStatus.process,
  ),
];
