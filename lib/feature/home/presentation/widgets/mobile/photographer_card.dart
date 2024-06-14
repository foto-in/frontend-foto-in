import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/data/photographer/model/PortofolioDetail.dart';
import 'package:foto_in/feature/fotografer/presentation/view/fotografer_detail_view.dart';

class PhotographCard extends StatelessWidget {
  final String namaFotografer;
  final double rating;
  final List<PortofolioDetail> portofolio;
  final String? photoProfile;

  const PhotographCard(
      {super.key,
      required this.namaFotografer,
      required this.rating,
      required this.portofolio,
      required this.photoProfile});

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
                  CircleAvatar(
                    foregroundImage: NetworkImage(photoProfile ?? ""),
                    radius: 30,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        namaFotografer,
                        style: FotoInSubHeadingTypography.medium(
                            color: AppColor.textPrimary),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${portofolio.length} Portofolio",
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
                          rating.toString(),
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
