class FeedbackRepositoryException implements Exception {
  final String message;

  FeedbackRepositoryException({required this.message});

  @override
  String toString() => 'FeedbackRepositoryException: $message';
}
