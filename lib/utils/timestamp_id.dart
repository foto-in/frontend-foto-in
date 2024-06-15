import 'package:intl/intl.dart';

String formatDateToIndonesian(String timestamp) {
  // Parse the input timestamp
  DateTime dateTime = DateTime.parse(timestamp);

  // Define the Indonesian locale
  String locale = 'id_ID';

  // Format the date
  DateFormat dateFormat = DateFormat('dd MMMM yyyy', locale);
  return dateFormat.format(dateTime);
}

String convertToStatus(String status) {
  switch (status) {
    case 'menunggu_konfirmasi':
      return 'Menunggu Konfirmasi';
    case 'diproses':
      return 'Diproses';
    case 'selesai':
      return 'Selesai';
    default:
      return 'Semua';
  }
}
