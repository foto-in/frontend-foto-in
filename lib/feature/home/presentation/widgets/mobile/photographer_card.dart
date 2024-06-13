import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/fotografer/presentation/view/fotografer_detail_view.dart';

class PhotographCard extends StatelessWidget {
  const PhotographCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, FotograferDetailView.routeName);
      },
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Fotografer",
                        style: FotoInSubHeadingTypography.medium(
                            color: AppColor.textPrimary),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Portofolio",
                        style: FotoInLabelTypography.small(
                          color: AppColor.textTeriary,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.5, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColor.backgroundSecondary,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 4),
                        Text(
                          "4.5",
                          style: FotoInSubHeadingTypography.small(
                              color: AppColor.textTeriary),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 240,
                    height: 142,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundSecondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
