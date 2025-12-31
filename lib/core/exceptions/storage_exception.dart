class StorageException implements Exception {
  final String message;
  final String code;
  final dynamic details;

  StorageException({
    required this.message,
    this.code = 'storage-error',
    this.details,
  });

  @override
  String toString() => 'StorageException: [$code] $message';
}
