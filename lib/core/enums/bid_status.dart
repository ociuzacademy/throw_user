// To parse this JSON data, do
//
//     final appovalStatus = appovalStatusFromJson(jsonString);

enum BidStatus {
  approved('approved'),
  pending('pending'),
  rejected('rejected');

  final String value;
  const BidStatus(this.value);

  factory BidStatus.fromString(String? name) {
    if (name == null) return BidStatus.pending;
    return BidStatus.values.firstWhere(
      (e) => e.value == name,
      orElse: () => BidStatus.pending,
    );
  }

  String toJson() => value;
}
