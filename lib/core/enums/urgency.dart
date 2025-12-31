enum Urgency {
  standard('Standard'),
  express('Express'),
  overnight('Overnight');

  final String value;
  const Urgency(this.value);

  factory Urgency.fromString(String name) {
    return Urgency.values.firstWhere((e) => e.value == name);
  }

  String toJson() => value;
}
