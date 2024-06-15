// ignore_for_file: file_names

import 'package:foto_in/utils/enums/order_status_enum.dart';
import 'package:foto_in/utils/extensions/extensions.dart';

class BookingModel {
  final String userId;
  final String photographerId;
  final String acara;
  final String lokasi;
  final String sesiFoto;
  final String tanggalBooking;
  final int durasi;
  final String konsep;
  final int totalHarga;
  final String status;
  final int totalDp;
  final bool statusPaid;
  final String waktuMulai;
  final String id;

  BookingModel({
    required this.userId,
    required this.photographerId,
    required this.acara,
    required this.lokasi,
    required this.sesiFoto,
    required this.tanggalBooking,
    required this.durasi,
    required this.konsep,
    required this.totalHarga,
    required this.status,
    required this.totalDp,
    required this.statusPaid,
    required this.waktuMulai,
    required this.id,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        userId: json["user_id"],
        photographerId: json["photographer_id"],
        acara: json["acara"],
        lokasi: json["lokasi"],
        sesiFoto: json["sesi_foto"],
        tanggalBooking: json["tanggal_booking"],
        durasi: json["durasi"],
        konsep: json["konsep"],
        totalHarga: json["total_harga"],
        status: json["status"],
        totalDp: json["total_dp"],
        statusPaid: json["status_paid"],
        waktuMulai: json["waktu_mulai"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "photographer_id": photographerId,
        "acara": acara,
        "lokasi": lokasi,
        "sesi_foto": sesiFoto,
        "tanggal_booking": tanggalBooking,
        "durasi": durasi,
        "konsep": konsep,
        "total_harga": totalHarga,
        "status": status,
        "total_dp": totalDp,
        "status_paid": statusPaid,
        "waktu_mulai": waktuMulai,
        "id": id,
      };
}
