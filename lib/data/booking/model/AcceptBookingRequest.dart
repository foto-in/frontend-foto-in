class AcceptBookingRequest {
  final bool confirmation;

  AcceptBookingRequest({
    required this.confirmation,
  });

  factory AcceptBookingRequest.fromJson(Map<String, dynamic> json) =>
      AcceptBookingRequest(
        confirmation: json["confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "confirmation": confirmation,
      };
}
