// ignore_for_file: file_names

class BookingRequest {
  final String photographerId;
  final String acara;
  final String lokasi;
  final String sesiFoto;
  final String tanggalBooking;
  final int durasi;
  final String konsep;
  final String waktuMulai;
  final int totalHarga;

  BookingRequest({
    required this.photographerId,
    required this.acara,
    required this.lokasi,
    required this.sesiFoto,
    required this.tanggalBooking,
    required this.durasi,
    required this.konsep,
    required this.waktuMulai,
    required this.totalHarga,
  });

  factory BookingRequest.fromJson(Map<String, dynamic> json) => BookingRequest(
        photographerId: json["photographer_id"],
        acara: json["acara"],
        lokasi: json["lokasi"],
        sesiFoto: json["sesi_foto"],
        tanggalBooking: json["tanggal_booking"],
        durasi: json["durasi"],
        konsep: json["konsep"],
        waktuMulai: json["waktu_mulai"],
        totalHarga: json["total_harga"],
      );

  Map<String, dynamic> toJson() => {
        "photographer_id": photographerId,
        "acara": acara,
        "lokasi": lokasi,
        "sesi_foto": sesiFoto,
        "tanggal_booking": tanggalBooking,
        "durasi": durasi,
        "konsep": konsep,
        "waktu_mulai": waktuMulai,
        "total_harga": totalHarga,
      };
}
