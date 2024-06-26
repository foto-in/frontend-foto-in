import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/service_order/presentation/widgets/tolak_order_form_page.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/enums/action_button_variant_enum.dart';
import 'package:foto_in/utils/enums/order_status_enum.dart';
import 'package:foto_in/utils/extensions/extensions.dart';

class ServiceOrderMenuItem extends StatelessWidget {
  const ServiceOrderMenuItem(
      {super.key,
      required this.name,
      required this.bookingDate,
      required this.photoSessionDate,
      required this.status});

  final String name;
  final String bookingDate;
  final String photoSessionDate;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    String statusText = status.parseBookingStatusToString();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 26,
      ),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.backgroundSecondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              name,
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textPrimary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              bookingDate,
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textPrimary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              photoSessionDate,
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textPrimary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              statusText,
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textPrimary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (status == OrderStatus.pendingConfirmation)
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ActionButton(
                      variant: ActionButtonVariant.accept,
                      text: 'Terima',
                      onPressed: () {},
                    ),
                  ),
                if (status > OrderStatus.pendingConfirmation)
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SizedBox(
                      width: 126,
                    ),
                  ),
                if (status == OrderStatus.pendingConfirmation)
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ActionButton(
                      variant: ActionButtonVariant.reject,
                      text: 'Tolak',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                constraints: const BoxConstraints(
                                    maxWidth: 490, maxHeight: 640),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Material(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(40),
                                    child: TolakOrderFormPage(),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (status > OrderStatus.pendingConfirmation)
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SizedBox(
                      width: 126,
                    ),
                  ),
                ActionButton(
                  variant: ActionButtonVariant.detail,
                  text: 'Detail',
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
