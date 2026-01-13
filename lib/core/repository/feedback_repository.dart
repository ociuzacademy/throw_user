import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:throw_user/core/exports/exception_exports.dart';
import 'package:throw_user/core/models/delivery_agent_model.dart';
import 'package:throw_user/core/models/delivery_request_model.dart';

class FeedbackRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  static const String feedbackCollection = 'feedback';
  static const String deliveryRequestCollection = 'deliveryRequest';
  static const String deliveryAgentsCollection = 'deliveryAgents';

  Future<void> submitFeedback({
    required String deliveryRequestId,
    required String feedbackText,
    required int rating,
  }) async {
    try {
      final DocumentReference<Map<String, dynamic>> deliveryRequestRef =
          _firestore
              .collection(deliveryRequestCollection)
              .doc(deliveryRequestId);

      final DeliveryRequestModel deliveryRequest = await deliveryRequestRef
          .get()
          .then((doc) => DeliveryRequestModel.fromJson(doc.data()!));

      final feedbackData = {
        'deliveryRequestRef': deliveryRequestRef, // ✅ reference
        'comments': feedbackText,
        'rating': rating,
        'userName': deliveryRequest.customerName,
        'userAvatarImageUrl': deliveryRequest.customerAvatarUrl,
        'deliveryAgentUid': deliveryRequest.deliveryAgentId,
        'createdAt': FieldValue.serverTimestamp(),
      };

      final feedbackDoc = await _firestore
          .collection(feedbackCollection)
          .add(feedbackData);

      await deliveryRequestRef.update({
        'feedbackSubmitted': true,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      final DeliveryAgentModel deliveryAgent = await _firestore
          .collection(deliveryAgentsCollection)
          .doc(deliveryRequest.deliveryAgentId)
          .get()
          .then((doc) => DeliveryAgentModel.fromJson(doc.data()!));

      final double newAverageRating =
          ((deliveryAgent.averageRating * deliveryAgent.numberOfRatings) +
              rating) /
          (deliveryAgent.numberOfRatings + 1);

      await _firestore
          .collection(deliveryAgentsCollection)
          .doc(deliveryAgent.uid)
          .update({
            'averageRating': newAverageRating,
            'numberOfRatings': deliveryAgent.numberOfRatings + 1,
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
