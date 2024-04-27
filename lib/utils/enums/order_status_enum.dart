enum OrderStatus {
  pendingConfirmation(20),
  pendingDP(40),
  process(60),
  pendingPayment(80),
  completed(100);

  final int progress;
  const OrderStatus(this.progress);

  bool operator <(OrderStatus other) => progress < other.progress;
  bool operator <=(OrderStatus other) => progress <= other.progress;
  bool operator >(OrderStatus other) => progress > other.progress;
  bool operator >=(OrderStatus other) => progress >= other.progress;
}
