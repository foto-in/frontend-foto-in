import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:iconsax/iconsax.dart';

class BookingDetailWidget extends StatefulWidget {
  const BookingDetailWidget({super.key});

  @override
  State<BookingDetailWidget> createState() => _BookingDetailWidgetState();
}

class _BookingDetailWidgetState extends State<BookingDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            const NavigationCustom(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 44,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 32),
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Iconsax.arrow_left),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Kembali",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textPrimary),
                            ),
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColor.primary,
                        child: Icon(
                          Iconsax.calendar,
                          size: 16,
                          color: AppColor.primary,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cahaya Aabadi Photography",
                        style: FotoInHeadingTypography.mega(
                            color: AppColor.textPrimary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  EdgeInsets.only(right: index == 4 ? 0 : 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColor.secondary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "Prewedding",
                                style: FotoInSubHeadingTypography.xSmall(
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
