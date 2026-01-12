import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:throw_user/core/exports/exception_exports.dart';

class FeedbackRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  static const String feedbackCollection = 'feedback';
  static const String deliveryRequestCollection = 'deliveryRequest';

  Future<void> submitFeedback({
    required String deliveryRequestId,
    required String feedbackText,
    required int rating,
  }) async {
    try {
      final deliveryRequestRef = _firestore
          .collection(deliveryRequestCollection)
          .doc(deliveryRequestId);

      final feedbackData = {
        'deliveryRequestRef': deliveryRequestRef, // ✅ reference
        'comments': feedbackText,
        'rating': rating,
        'createdAt': FieldValue.serverTimestamp(),
      };

      final feedbackDoc = await _firestore
          .collection(feedbackCollection)
          .add(feedbackData);

      await deliveryRequestRef.update({
        'feedbackSubmitted': true,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      debugPrint('Feedback submitted with ID: ${feedbackDoc.id}');
    } catch (e, stack) {
      debugPrint('Error submitting feedback: $e\n$stack');
      throw FeedbackRepositoryException(
        message: 'Failed to submit feedback. Please try again.',
      );
    }
  }
}
