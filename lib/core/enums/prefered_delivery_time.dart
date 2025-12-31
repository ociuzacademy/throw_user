enum PreferedDeliveryTime {
  morning('Morning'),
  afternoon('Afternoon'),
  evening('Evening');

  final String value;
  const PreferedDeliveryTime(this.value);

  factory PreferedDeliveryTime.fromString(String name) {
    return PreferedDeliveryTime.values.firstWhere((e) => e.value == name);
  }

  String toJson() => value;
}
