enum DeliveryStatus {
  pending('Pending'),
  onTheWay('On The Way'),
  dropOff('Drop Off');

  final String value;
  const DeliveryStatus(this.value);

  factory DeliveryStatus.fromString(String name) {
    return DeliveryStatus.values.firstWhere((e) => e.value == name);
  }

  String toJson() => value;
}
