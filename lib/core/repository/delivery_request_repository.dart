import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:throw_user/core/exports/enum_exports.dart';
import 'package:throw_user/core/exports/exception_exports.dart';
import 'package:throw_user/core/models/delivery_request_model.dart';
import 'package:throw_user/core/models/user_profile_model.dart';
import 'package:throw_user/modules/delivery_request_module/data/delivery_request_data.dart';

class DeliveryRequestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  // Collection reference
  static const String userCollection = 'users';
  static const String deliveryRequestCollection = 'deliveryRequest';

  // Create or update delivery request in Firestore
  Future<String> createDeliveryRequest(
    DeliveryRequestData deliveryRequestData,
    String userUid,
  ) async {
    try {
      final DateTime pickupDate = DateTime(
        deliveryRequestData.pickupDate.year,
        deliveryRequestData.pickupDate.month,
        deliveryRequestData.pickupDate.day,
        deliveryRequestData.pickupTime.hour,
        deliveryRequestData.pickupTime.minute,
      );

      final userDoc = await _firestore
          .collection(userCollection)
          .doc(userUid)
          .get();

      if (!userDoc.exists) {
        throw Exception('User profile not found for ID: $userUid');
      }

      final UserProfileModel userProfileModel = UserProfileModel.fromJson(
        userDoc.data()!,
      );
      final userData = {
        'auctionStartingTime': FieldValue.serverTimestamp(),
        'baseDeliveryCharge': deliveryRequestData.baseDeliveryCharge,
        'createdAt': FieldValue.serverTimestamp(),
        'customerAvatarUrl': userProfileModel.photoUrl,
        'customerName': userProfileModel.displayName,
        'deliveryLocation': GeoPoint(
          deliveryRequestData.deliveryLocation.latitude,
          deliveryRequestData.deliveryLocation.longitude,
        ),
        'dropOffPhoneNumber': deliveryRequestData.dropOffPhone,
        'deliveryStatus': DeliveryStatus.pending.value,
        'dropOffAddress': deliveryRequestData.dropOffAddress,
        'dropOffDate': Timestamp.fromDate(deliveryRequestData.dropOffDate),
        'dropOffRemarks': deliveryRequestData.dropOffRemarks,
        'minimumDeliveryCharge': deliveryRequestData.baseDeliveryCharge,
        'packageType': deliveryRequestData.packageType.value,
        'packageWeight': deliveryRequestData.packageWeight,
        'paymentStatus': PaymentStatus.pending.value,
        'pickupAddress': deliveryRequestData.pickupAddress,
        'pickupDate': Timestamp.fromDate(pickupDate),
        'pickupLocation': GeoPoint(
          deliveryRequestData.pickupLocation.latitude,
          deliveryRequestData.pickupLocation.longitude,
        ),
        'pickupPhone': deliveryRequestData.pickupPhone,
        'pickupRemarks': deliveryRequestData.pickupRemarks,
        'preferredDeliveryTime':
            deliveryRequestData.preferredDeliveryTime.value,
        'requestStatus': RequestStatus.requestCreated.value,
        'updatedAt': FieldValue.serverTimestamp(),
        'urgency': deliveryRequestData.urgency.value,
      };

      // Generate a document reference with auto-generated ID
      final docRef = _firestore
          .collection(deliveryRequestCollection)
          .doc(); // This creates a new doc with auto-generated ID

      userData['deliveryRequestId'] = docRef.id;

      // Save the data with the generated ID
      await docRef.set(userData, SetOptions(merge: true));

      // Return the auto-generated document ID
      return docRef.id;
    } catch (e) {
      debugPrint('Error saving user to Firestore: $e');
      throw DeliveryRequestRepositoryException(
        message: 'Failed to save user to Firestore: ${e.toString()}',
      );
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
      throw DeliveryRequestRepositoryException(
        message: 'Failed to cancel request: ${e.toString()}',
      );
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
      throw DeliveryRequestRepositoryException(
        message: 'Failed to accept request: ${e.toString()}',
      );
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
      throw DeliveryRequestRepositoryException(
        message: 'Failed to transfer escrow amount: ${e.toString()}',
      );
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
      throw DeliveryRequestRepositoryException(
        message: 'Failed to set delivery on the way: ${e.toString()}',
      );
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
      debugPrint('Error getting delivery request details: $e');
      throw DeliveryRequestRepositoryException(
        message: 'Failed to get delivery request details: ${e.toString()}',
      );
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
      debugPrint('Error checking delivery request existence: $e');
      throw DeliveryRequestRepositoryException(
        message: 'Failed to check delivery request existence: ${e.toString()}',
      );
    }
  }
}
