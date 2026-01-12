// To parse this JSON data, do
//
//     final deliveryRequestModel = deliveryRequestModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:throw_user/core/exports/enum_exports.dart';

DeliveryRequestModel deliveryRequestModelFromJson(String str) =>
    DeliveryRequestModel.fromJson(json.decode(str));

String deliveryRequestModelToJson(DeliveryRequestModel data) =>
    json.encode(data.toJson());

class DeliveryRequestModel {
  final double? agreedDeliveryCharge;
  final Timestamp auctionStartingTime;
  final double baseDeliveryCharge;
  final Timestamp createdAt;
  final String customerAvatarUrl;
  final String customerName;
  final String? deliveryAgentId;
  final GeoPoint deliveryLocation;
  final String deliveryRequestId;
  final DeliveryStatus deliveryStatus;
  final String dropOffAddress;
  final Timestamp dropOffDate;
  final String dropOffPhoneNumber;
  final String dropOffRemarks;
  final bool feedbackSubmitted;
  final double minimumDeliveryCharge;
  final String? otp;
  final PackageType packageType;
  final double packageWeight;
  final PaymentStatus paymentStatus;
  final String pickupAddress;
  final Timestamp pickupDate;
  final GeoPoint pickupLocation;
  final String pickupPhoneNumber;
  final String pickupRemarks;
  final PreferedDeliveryTime preferredDeliveryTime;
  final RequestStatus requestStatus;
  final Timestamp updatedAt;
  final Urgency urgency;
  final String userId;

  const DeliveryRequestModel({
    this.agreedDeliveryCharge,
    required this.auctionStartingTime,
    required this.baseDeliveryCharge,
    required this.customerAvatarUrl,
    required this.customerName,
    required this.createdAt,
    this.deliveryAgentId,
    required this.deliveryLocation,
    required this.deliveryRequestId,
    required this.deliveryStatus,
    required this.dropOffAddress,
    required this.dropOffDate,
    required this.dropOffPhoneNumber,
    required this.dropOffRemarks,
    required this.feedbackSubmitted,
    required this.minimumDeliveryCharge,
    this.otp,
    required this.packageType,
    required this.packageWeight,
    required this.paymentStatus,
    required this.pickupAddress,
    required this.pickupDate,
    required this.pickupLocation,
    required this.pickupPhoneNumber,
    required this.pickupRemarks,
    required this.preferredDeliveryTime,
    required this.requestStatus,
    required this.updatedAt,
    required this.urgency,
    required this.userId,
  });

  DeliveryRequestModel copyWith({
    dynamic agreedDeliveryCharge,
    Timestamp? auctionStartingTime,
    double? baseDeliveryCharge,
    Timestamp? createdAt,
    String? customerAvatarUrl,
    String? customerName,
    dynamic deliveryAgentId,
    GeoPoint? deliveryLocation,
    String? deliveryRequestId,
    DeliveryStatus? deliveryStatus,
    String? dropOffAddress,
    Timestamp? dropOffDate,
    String? dropOffPhoneNumber,
    String? dropOffRemarks,
    bool? feedbackSubmitted,
    double? minimumDeliveryCharge,
    dynamic otp,
    PackageType? packageType,
    double? packageWeight,
    PaymentStatus? paymentStatus,
    String? pickupAddress,
    Timestamp? pickupDate,
    GeoPoint? pickupLocation,
    String? pickupPhoneNumber,
    String? pickupRemarks,
    PreferedDeliveryTime? preferredDeliveryTime,
    RequestStatus? requestStatus,
    Timestamp? updatedAt,
    Urgency? urgency,
    String? userId,
  }) => DeliveryRequestModel(
    agreedDeliveryCharge: agreedDeliveryCharge ?? this.agreedDeliveryCharge,
    auctionStartingTime: auctionStartingTime ?? this.auctionStartingTime,
    baseDeliveryCharge: baseDeliveryCharge ?? this.baseDeliveryCharge,
    createdAt: createdAt ?? this.createdAt,
    customerAvatarUrl: customerAvatarUrl ?? this.customerAvatarUrl,
    customerName: customerName ?? this.customerName,
    deliveryAgentId: deliveryAgentId ?? this.deliveryAgentId,
    deliveryLocation: deliveryLocation ?? this.deliveryLocation,
    deliveryRequestId: deliveryRequestId ?? this.deliveryRequestId,
    deliveryStatus: deliveryStatus ?? this.deliveryStatus,
    dropOffAddress: dropOffAddress ?? this.dropOffAddress,
    dropOffDate: dropOffDate ?? this.dropOffDate,
    dropOffPhoneNumber: dropOffPhoneNumber ?? this.dropOffPhoneNumber,
    dropOffRemarks: dropOffRemarks ?? this.dropOffRemarks,
    feedbackSubmitted: feedbackSubmitted ?? this.feedbackSubmitted,
    minimumDeliveryCharge: minimumDeliveryCharge ?? this.minimumDeliveryCharge,
    otp: otp ?? this.otp,
    packageType: packageType ?? this.packageType,
    packageWeight: packageWeight ?? this.packageWeight,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    pickupAddress: pickupAddress ?? this.pickupAddress,
    pickupDate: pickupDate ?? this.pickupDate,
    pickupLocation: pickupLocation ?? this.pickupLocation,
    pickupPhoneNumber: pickupPhoneNumber ?? this.pickupPhoneNumber,
    pickupRemarks: pickupRemarks ?? this.pickupRemarks,
    preferredDeliveryTime: preferredDeliveryTime ?? this.preferredDeliveryTime,
    requestStatus: requestStatus ?? this.requestStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    urgency: urgency ?? this.urgency,
    userId: userId ?? this.userId,
  );

  factory DeliveryRequestModel.fromJson(Map<String, dynamic> json) =>
      DeliveryRequestModel(
        agreedDeliveryCharge: json['agreedDeliveryCharge']?.toDouble(),
        auctionStartingTime: json['auctionStartingTime'] != null
            ? json['auctionStartingTime'] as Timestamp
            : Timestamp.now(),
        baseDeliveryCharge: (json['baseDeliveryCharge'] ?? 0.0).toDouble(),
        createdAt: json['createdAt'] != null
            ? json['createdAt'] as Timestamp
            : Timestamp.now(),
        customerAvatarUrl: json['customerAvatarUrl'],
        customerName: json['customerName'],
        deliveryAgentId: json['deliveryAgentId'],
        deliveryLocation: json['deliveryLocation'] as GeoPoint,
        deliveryRequestId: json['deliveryRequestId'],
        deliveryStatus: DeliveryStatus.fromString(json['deliveryStatus']),
        dropOffAddress: json['dropOffAddress'],
        dropOffDate: json['dropOffDate'] != null
            ? json['dropOffDate'] as Timestamp
            : Timestamp.now(),
        dropOffPhoneNumber: json['dropOffPhoneNumber'],
        dropOffRemarks: json['dropOffRemarks'],
        feedbackSubmitted: json['feedbackSubmitted'],
        minimumDeliveryCharge: (json['minimumDeliveryCharge'] ?? 0.0)
            .toDouble(),
        otp: json['otp'],
        packageType: PackageType.fromString(json['packageType']),
        packageWeight: (json['packageWeight'] ?? 0.0).toDouble(),
        paymentStatus: PaymentStatus.fromString(json['paymentStatus']),
        pickupAddress: json['pickupAddress'],
        pickupDate: json['pickupDate'] != null
            ? json['pickupDate'] as Timestamp
            : Timestamp.now(),
        pickupLocation: json['pickupLocation'] as GeoPoint,
        pickupPhoneNumber: json['pickupPhoneNumber'],
        pickupRemarks: json['pickupRemarks'],
        preferredDeliveryTime: PreferedDeliveryTime.fromString(
          json['preferredDeliveryTime'],
        ),
        requestStatus: RequestStatus.fromString(json['requestStatus']),
        updatedAt: json['updatedAt'] != null
            ? json['updatedAt'] as Timestamp
            : Timestamp.now(),
        urgency: Urgency.fromString(json['urgency']),
        userId: json['userId'],
      );

  Map<String, dynamic> toJson() => {
    'agreedDeliveryCharge': agreedDeliveryCharge,
    'auctionStartingTime':
        "${auctionStartingTime.toDate().year.toString().padLeft(4, '0')}-${auctionStartingTime.toDate().month.toString().padLeft(2, '0')}-${auctionStartingTime.toDate().day.toString().padLeft(2, '0')}",
    'baseDeliveryCharge': baseDeliveryCharge,
    'createdAt':
        "${createdAt.toDate().year.toString().padLeft(4, '0')}-${createdAt.toDate().month.toString().padLeft(2, '0')}-${createdAt.toDate().day.toString().padLeft(2, '0')}",
    'customerAvatarUrl': customerAvatarUrl,
    'customerName': customerName,
    'deliveryAgentId': deliveryAgentId,
    'deliveryLocation': {
      'latitude': deliveryLocation.latitude,
      'longitude': deliveryLocation.longitude,
    },
    'deliveryRequestId': deliveryRequestId,
    'deliveryStatus': deliveryStatus.value,
    'dropOffAddress': dropOffAddress,
    'dropOffDate':
        "${dropOffDate.toDate().year.toString().padLeft(4, '0')}-${dropOffDate.toDate().month.toString().padLeft(2, '0')}-${dropOffDate.toDate().day.toString().padLeft(2, '0')}",
    'dropOffPhoneNumber': dropOffPhoneNumber,
    'dropOffRemarks': dropOffRemarks,
    'feedbackSubmitted': feedbackSubmitted,
    'minimumDeliveryCharge': minimumDeliveryCharge,
    'otp': otp,
    'packageType': packageType.value,
    'packageWeight': packageWeight,
    'paymentStatus': paymentStatus.value,
    'pickupAddress': pickupAddress,
    'pickupDate':
        "${pickupDate.toDate().year.toString().padLeft(4, '0')}-${pickupDate.toDate().month.toString().padLeft(2, '0')}-${pickupDate.toDate().day.toString().padLeft(2, '0')}",
    'pickupLocation': {
      'latitude': pickupLocation.latitude,
      'longitude': pickupLocation.longitude,
    },
    'pickupPhoneNumber': pickupPhoneNumber,
    'pickupRemarks': pickupRemarks,
    'preferredDeliveryTime': preferredDeliveryTime.value,
    'requestStatus': requestStatus.value,
    'updatedAt':
        "${updatedAt.toDate().year.toString().padLeft(4, '0')}-${updatedAt.toDate().month.toString().padLeft(2, '0')}-${updatedAt.toDate().day.toString().padLeft(2, '0')}",
    'urgency': urgency.value,
    'userId': userId,
  };
}
