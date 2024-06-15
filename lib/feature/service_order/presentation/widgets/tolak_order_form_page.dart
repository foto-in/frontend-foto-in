import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
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
        const Icon(
          Iconsax.arrow_left,
          weight: 5,
        ),
        const SizedBox(height: 20),
        const ProfileFormTitle(
          title: "Tolak Pesanan",
          subtitle: "Berikan alasan mengapa Anda menolak pesanan klien.",
        ),
        const SizedBox(height: 20),
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
        const SizedBox(height: 20),
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
