class DeliveryRequestRepositoryException implements Exception {
  final String message;

  DeliveryRequestRepositoryException({required this.message});

  @override
  String toString() => 'DeliveryRequestRepositoryException: $message';
}
