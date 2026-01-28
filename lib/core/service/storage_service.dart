// storage_service.dart
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload image to Firebase Storage and return download URL
  Future<String> uploadImage({
    required String deliveryRequestId,
    required String imagePath,
    required String imageType, // 'license', 'vehicle', 'profile', etc.
    String? customFileName,
  }) async {
    try {
      // Create a unique file name
      final String fileName =
          customFileName ??
          '${imageType}_${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Create reference to storage location
      final Reference storageRef = _storage.ref().child(
        'delivery_requests/$deliveryRequestId/$imageType/$fileName',
      );

      // Upload the file
      UploadTask uploadTask;

      if (kIsWeb) {
        // For web, we need to handle differently
        final bytes = await _getFileBytesWeb(imagePath);
        uploadTask = storageRef.putData(
          bytes,
          SettableMetadata(contentType: 'image/jpeg'),
        );
      } else {
        // For mobile, use putFile
        final File file = File(imagePath);
        uploadTask = storageRef.putFile(
          file,
          SettableMetadata(contentType: 'image/jpeg'),
        );
      }

      // Monitor upload progress
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        debugPrint(
          'Upload progress: ${snapshot.bytesTransferred}/${snapshot.totalBytes}',
        );
      });

      // Wait for upload to complete
      final TaskSnapshot snapshot = await uploadTask;

      // Get download URL
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      debugPrint('Image uploaded successfully: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      debugPrint('Error uploading image: $e');
      rethrow;
    }
  }

  // Helper method for web
  Future<Uint8List> _getFileBytesWeb(String filePath) async {
    // Implement web file handling based on your web implementation
    // This depends on how you're getting the image on web
    throw UnimplementedError('Web file upload not implemented');
  }

  // Upload multiple images
  Future<List<String>> uploadMultipleImages({
    required String deliveryRequestId,
    required List<String> imagePaths,
    required String imageType,
  }) async {
    final List<String> urls = [];

    for (int i = 0; i < imagePaths.length; i++) {
      try {
        final url = await uploadImage(
          deliveryRequestId: deliveryRequestId,
          imagePath: imagePaths[i],
          imageType: imageType,
          customFileName: '${imageType}_${i + 1}.jpg',
        );
        urls.add(url);
      } catch (e) {
        debugPrint('Error uploading image ${i + 1}: $e');
      }
    }

    return urls;
  }

  // Delete image from storage
  Future<void> deleteImage(String imageUrl) async {
    try {
      final Reference ref = _storage.refFromURL(imageUrl);
      await ref.delete();
      debugPrint('Image deleted: $imageUrl');
    } catch (e) {
      debugPrint('Error deleting image: $e');
      rethrow;
    }
  }

  // Get image URL by path
  Future<String> getImageUrl(String path) async {
    try {
      final ref = _storage.ref().child(path);
      return await ref.getDownloadURL();
    } catch (e) {
      debugPrint('Error getting image URL: $e');
      rethrow;
    }
  }
}
