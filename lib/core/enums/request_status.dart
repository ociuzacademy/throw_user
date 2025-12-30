enum RequestStatus {
  requestCreated('Request Created'),
  requestAccepted('Request Accepted'),
  requestCancelled('Request Cancelled'),
  requestCompleted('Request Completed');

  final String value;
  const RequestStatus(this.value);

  factory RequestStatus.fromString(String name) {
    return RequestStatus.values.firstWhere((e) => e.value == name);
  }

  String toJson() => value;
}
