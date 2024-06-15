import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';

enum RejectReason {
  jadwal_tidak_tersedia,
  diluar_spesialis,
  lokasi_tidak_cocok,
  perangkat_bermasalah,
  kendala_pribadi,
  lainnya
}

class TolakStatusDialog extends StatefulWidget {
  const TolakStatusDialog({
    super.key,
  });

  @override
  State<TolakStatusDialog> createState() => _TolakStatusDialogState();
}

class _TolakStatusDialogState extends State<TolakStatusDialog> {
  RejectReason _status = RejectReason.jadwal_tidak_tersedia;

  void _onStatusChanged(RejectReason status) {
    setState(() {
      _status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffffffff),
        ),
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Iconsax.arrow_left,
                size: 24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 16),
              child: ProfileFormTitle(
                title: "Tolak Pesanan",
                subtitle: "Berikan alasan mengapa Anda menolak pesanan klien.",
              ),
            ),
            Row(
              children: [
                Radio(
                  value: RejectReason.jadwal_tidak_tersedia,
                  groupValue: _status,
                  onChanged: (value) {
                    _onStatusChanged(value!);
                  },
                ),
                Text(
                  "Jadwal tidak tersedia",
                  style: FotoInLabelTypography.medium(),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: RejectReason.diluar_spesialis,
                  groupValue: _status,
                  onChanged: (value) {
                    _onStatusChanged(value!);
                  },
                ),
                Text(
                  "Diluar spesialis",
                  style: FotoInLabelTypography.medium(),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: RejectReason.lokasi_tidak_cocok,
                  groupValue: _status,
                  onChanged: (value) {
                    _onStatusChanged(value!);
                  },
                ),
                Text(
                  "Lokasi tidak cocok",
                  style: FotoInLabelTypography.medium(),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: RejectReason.perangkat_bermasalah,
                  groupValue: _status,
                  onChanged: (value) {
                    _onStatusChanged(value!);
                  },
                ),
                Text(
                  "Perangkat bermasalah",
                  style: FotoInLabelTypography.medium(),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: RejectReason.kendala_pribadi,
                  groupValue: _status,
                  onChanged: (value) {
                    _onStatusChanged(value!);
                  },
                ),
                Text(
                  "Kendala pribadi",
                  style: FotoInLabelTypography.medium(),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: RejectReason.lainnya,
                  groupValue: _status,
                  onChanged: (value) {
                    _onStatusChanged(value!);
                  },
                ),
                Text(
                  "Lainnya",
                  style: FotoInLabelTypography.medium(),
                ),
              ],
            ),
            FotoInButton(
              text: "Kirim",
              onPressed: () {
                Navigator.pop(context);
              },
              margin: const EdgeInsets.all(12),
            )
          ],
        ),
      ),
    );
  }
}
