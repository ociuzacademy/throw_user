import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/core/models/delivery_request_model.dart';
import 'package:throw_user/modules/delivery_request_module/data/delivery_request_data.dart';

class DeliveryRequestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  // Collection reference
  static const String deliveryRequestCollection = 'deliveryRequest';

  // Create or update delivery request in Firestore
  Future<String> createDeliveryRequest(
    DeliveryRequestData deliveryRequestData,
  ) async {
    try {
      final DateTime pickupDate = DateTime(
        deliveryRequestData.pickupDate.year,
        deliveryRequestData.pickupDate.month,
        deliveryRequestData.pickupDate.day,
        deliveryRequestData.pickupTime.hour,
        deliveryRequestData.pickupTime.minute,
      );
      final userData = {
        'auctionStartingTime': FieldValue.serverTimestamp(),
        'baseDeliveryCharge': deliveryRequestData.baseDeliveryCharge,
        'createdAt': FieldValue.serverTimestamp(),
        'deliveryLocation': GeoPoint(
          deliveryRequestData.deliveryLocation.latitude,
          deliveryRequestData.deliveryLocation.longitude,
        ),
        'deliveryStatus': DeliveryStatus.pending.value,
        'dropOffAddress': deliveryRequestData.dropOffAddress,
        'dropOffDate': Timestamp.fromDate(deliveryRequestData.dropOffDate),
        'dropOffRemarks': deliveryRequestData.dropOffRemarks,
        'packageType': deliveryRequestData.packageType,
        'packageWeight': deliveryRequestData.packageWeight,
        'paymentStatus': PaymentStatus.pending.value,
        'pickupAddress': deliveryRequestData.pickupAddress,
        'pickupDate': Timestamp.fromDate(pickupDate),
        'pickupLocation': GeoPoint(
          deliveryRequestData.pickupLocation.latitude,
          deliveryRequestData.pickupLocation.longitude,
        ),
        'pickupRemarks': deliveryRequestData.pickupRemarks,
        'preferredDeliveryTime': deliveryRequestData.preferredDeliveryTime,
        'requestStatus': RequestStatus.requestCreated.value,
        'updatedAt': FieldValue.serverTimestamp(),
        'urgency': deliveryRequestData.urgency,
      };

      // Generate a document reference with auto-generated ID
      final docRef = _firestore
          .collection(deliveryRequestCollection)
          .doc(); // This creates a new doc with auto-generated ID

      // Save the data with the generated ID
      await docRef.set(userData, SetOptions(merge: true));

      // Return the auto-generated document ID
      return docRef.id;
    } catch (e) {
      debugPrint('Error saving user to Firestore: $e');
      rethrow;
    }
  }

  Future<void> cancelRequest(String requestId) async {
    try {
      await _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .update({
            'requestStatus': RequestStatus.requestCancelled.value,
            'updatedAt': FieldValue.serverTimestamp(),
          });
    } catch (e) {
      debugPrint('Error canceling request: $e');
      rethrow;
    }
  }

  Future<void> acceptRequest(
    String requestId,
    String deliveryAgentId,
    double agreedDeliveryCharge,
  ) async {
    try {
      await _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .update({
            'deliveryAgentId': deliveryAgentId,
            'agreedDeliveryCharge': agreedDeliveryCharge,
            'requestStatus': RequestStatus.requestAccepted.value,
            'updatedAt': FieldValue.serverTimestamp(),
          });
    } catch (e) {
      debugPrint('Error accepting request: $e');
      rethrow;
    }
  }

  Future<void> payEscrowAmount(String requestId) async {
    try {
      await _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .update({
            'paymentStatus': PaymentStatus.escrowAmountPaid.value,
            'updatedAt': FieldValue.serverTimestamp(),
          });
    } catch (e) {
      debugPrint('Error transferring escrow amount: $e');
      rethrow;
    }
  }

  Future<void> setDeliveryOnTheWay(String requestId) async {
    try {
      await _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .update({
            'deliveryStatus': DeliveryStatus.onTheWay.value,
            'updatedAt': FieldValue.serverTimestamp(),
          });
    } catch (e) {
      debugPrint('Error setting delivery on the way: $e');
      rethrow;
    }
  }

  // Get user by UID
  Future<DeliveryRequestModel?> getDeliveryRequestByUid(
    String requestId,
  ) async {
    try {
      final doc = await _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .get();

      debugPrint(doc.data().toString());

      return doc.exists ? DeliveryRequestModel.fromJson(doc.data()!) : null;
    } catch (e) {
      debugPrint('Error getting user: $e');
      return null;
    }
  }

  // Check if user exists in database
  Future<bool> userExists(String requestId) async {
    try {
      final doc = await _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .get();

      return doc.exists;
    } catch (e) {
      return false;
    }
  }
}
