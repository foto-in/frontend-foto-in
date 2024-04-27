import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/portofolio/widget/description_form.dart';
import 'package:foto_in/feature/profile/portofolio/widget/images_form.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';

enum RejectReason {
  jadwalBentrook,
  diluarSpesialis,
  lokasiTidakCocok,
  perangkatBermasalah,
  kendalaPribadi,
  lainnya
}

List<String> rejectReasons = [
  'Jadwal bentrok',
  'Diluar spesialis',
  'Lokasi tidak cocok',
  'Perangkat bermasalah',
  'Kendala pribadi',
  'Lainnya'
];

class TolakOrderFormPage extends StatefulWidget {
  const TolakOrderFormPage({super.key});

  @override
  State<TolakOrderFormPage> createState() => _TolakOrderFormPageState();
}

class _TolakOrderFormPageState extends State<TolakOrderFormPage> {
  RejectReason? _rejectReason;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Iconsax.arrow_left,
          weight: 5,
        ),
        SizedBox(height: 20),
        ProfileFormTitle(
          title: "Tolak Pesanan",
          subtitle: "Berikan alasan mengapa Anda menolak pesanan klien.",
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: rejectReasons.length,
            itemBuilder: (context, index) {
              return RadioListTile<RejectReason>(
                contentPadding: EdgeInsets.zero,
                title: Text(rejectReasons[index]),
                value: RejectReason.values[index],
                groupValue: _rejectReason,
                onChanged: (RejectReason? value) {
                  setState(() {
                    _rejectReason = value;
                  });
                },
              );
            },
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FotoInButton(
            text: 'Tolak',
            onPressed: () {},
            backgroundColor: AppColor.primary,
            textColor: AppColor.backgroundPrimary,
          ),
        ),
      ],
    );
  }
}
