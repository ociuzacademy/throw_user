enum PaymentStatus {
  pending('Pending'),
  escrowAmountPaid('Escrow Amount Paid'),
  escrowAmountReleased('Escrow Amount Released');

  final String value;
  const PaymentStatus(this.value);

  factory PaymentStatus.fromString(String name) {
    return PaymentStatus.values.firstWhere((e) => e.value == name);
  }

  String toJson() => value;
}
