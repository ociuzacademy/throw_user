// To parse this JSON data, do
//
//     final appovalStatus = appovalStatusFromJson(jsonString);

enum ApprovalStatus {
  approved('approved'),
  pending('pending'),
  rejected('rejected');

  final String value;
  const ApprovalStatus(this.value);

  factory ApprovalStatus.fromString(String? name) {
    if (name == null) return ApprovalStatus.pending;
    return ApprovalStatus.values.firstWhere(
      (e) => e.value == name,
      orElse: () => ApprovalStatus.pending,
    );
  }

  String toJson() => value;
}
