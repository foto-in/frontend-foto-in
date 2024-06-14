import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';

enum Status { diproses, selesai }

class PerbaruiStatusDialog extends StatefulWidget {
  const PerbaruiStatusDialog({
    super.key,
  });

  @override
  State<PerbaruiStatusDialog> createState() => _PerbaruiStatusDialogState();
}

class _PerbaruiStatusDialogState extends State<PerbaruiStatusDialog> {
  Status _status = Status.diproses;

  void _onStatusChanged(Status status) {
    setState(() {
      _status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(16),
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
              icon: Icon(
                Iconsax.arrow_left,
                size: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 16),
              child: ProfileFormTitle(
                title: "Perbarui Status",
                subtitle: "Sesuaikan dengan proses pengerjaan Anda.",
              ),
            ),
            Row(
              children: [
                Radio(
                  value: Status.diproses,
                  groupValue: _status,
                  onChanged: (value) {
                    _onStatusChanged(value!);
                  },
                ),
                Text(
                  "Diproses",
                  style: FotoInLabelTypography.medium(),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: Status.selesai,
                  groupValue: _status,
                  onChanged: (value) {
                    _onStatusChanged(value!);
                  },
                ),
                Text(
                  "Selesai",
                  style: FotoInLabelTypography.medium(),
                ),
              ],
            ),
            FotoInButton(
              text: "Perbarui",
              onPressed: () {
                Navigator.pop(context);
              },
              margin: EdgeInsets.all(12),
            )
          ],
        ),
      ),
    );
  }
}
