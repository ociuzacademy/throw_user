class UserRepositoryException implements Exception {
  final String message;

  UserRepositoryException({required this.message});

  @override
  String toString() => 'UserRepositoryException: $message';
}
