import 'package:foto_in/utils/enums/order_status_enum.dart';

extension OrderStatusExtension on OrderStatus {
  String parseBookingStatusToString() {
    switch (this) {
      case OrderStatus.pendingConfirmation:
        return 'Menunggu Konfirmasi';
      case OrderStatus.pendingDP:
        return 'Menunggu Deposit';
      case OrderStatus.process:
        return 'Diproses';
      case OrderStatus.pendingPayment:
        return 'Menunggu Pelunasan';
      case OrderStatus.completed:
        return 'Selesai';
      default:
        throw Exception('Unknown status: $this');
    }
  }
}

extension StringExtension on String {
  OrderStatus parseBookingStatusFromString() {
    switch (this) {
      case 'menunggu_konfirmasi':
        return OrderStatus.pendingConfirmation;
      case 'menunggu_dp':
        return OrderStatus.pendingDP;
      case 'proses':
        return OrderStatus.process;
      case 'menunggu_pelunasan':
        return OrderStatus.pendingPayment;
      case 'selesai':
        return OrderStatus.completed;
      default:
        throw Exception('Unknown status: $this');
    }
  }
}
