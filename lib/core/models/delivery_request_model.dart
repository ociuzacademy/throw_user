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
  final String? deliveryAgentId;
  final GeoPoint deliveryLocation;
  final String deliveryRequestId;
  final DeliveryStatus deliveryStatus;
  final String dropOffAddress;
  final Timestamp dropOffDate;
  final String dropOffRemarks;
  final double minimumDeliveryCharge;
  final String? otp;
  final PackageType packageType;
  final double packageWeight;
  final PaymentStatus paymentStatus;
  final String pickupAddress;
  final Timestamp pickupDate;
  final GeoPoint pickupLocation;
  final String pickupRemarks;
  final String preferredDeliveryTime;
  final RequestStatus requestStatus;
  final Timestamp updatedAt;
  final Urgency urgency;

  DeliveryRequestModel({
    this.agreedDeliveryCharge,
    required this.auctionStartingTime,
    required this.baseDeliveryCharge,
    required this.createdAt,
    this.deliveryAgentId,
    required this.deliveryLocation,
    required this.deliveryRequestId,
    required this.deliveryStatus,
    required this.dropOffAddress,
    required this.dropOffDate,
    required this.dropOffRemarks,
    required this.minimumDeliveryCharge,
    this.otp,
    required this.packageType,
    required this.packageWeight,
    required this.paymentStatus,
    required this.pickupAddress,
    required this.pickupDate,
    required this.pickupLocation,
    required this.pickupRemarks,
    required this.preferredDeliveryTime,
    required this.requestStatus,
    required this.updatedAt,
    required this.urgency,
  });

  DeliveryRequestModel copyWith({
    dynamic agreedDeliveryCharge,
    Timestamp? auctionStartingTime,
    double? baseDeliveryCharge,
    Timestamp? createdAt,
    dynamic deliveryAgentId,
    GeoPoint? deliveryLocation,
    String? deliveryRequestId,
    DeliveryStatus? deliveryStatus,
    String? dropOffAddress,
    Timestamp? dropOffDate,
    String? dropOffRemarks,
    double? minimumDeliveryCharge,
    dynamic otp,
    PackageType? packageType,
    double? packageWeight,
    PaymentStatus? paymentStatus,
    String? pickupAddress,
    Timestamp? pickupDate,
    GeoPoint? pickupLocation,
    String? pickupRemarks,
    String? preferredDeliveryTime,
    RequestStatus? requestStatus,
    Timestamp? updatedAt,
    Urgency? urgency,
  }) => DeliveryRequestModel(
    agreedDeliveryCharge: agreedDeliveryCharge ?? this.agreedDeliveryCharge,
    auctionStartingTime: auctionStartingTime ?? this.auctionStartingTime,
    baseDeliveryCharge: baseDeliveryCharge ?? this.baseDeliveryCharge,
    createdAt: createdAt ?? this.createdAt,
    deliveryAgentId: deliveryAgentId ?? this.deliveryAgentId,
    deliveryLocation: deliveryLocation ?? this.deliveryLocation,
    deliveryRequestId: deliveryRequestId ?? this.deliveryRequestId,
    deliveryStatus: deliveryStatus ?? this.deliveryStatus,
    dropOffAddress: dropOffAddress ?? this.dropOffAddress,
    dropOffDate: dropOffDate ?? this.dropOffDate,
    dropOffRemarks: dropOffRemarks ?? this.dropOffRemarks,
    minimumDeliveryCharge: minimumDeliveryCharge ?? this.minimumDeliveryCharge,
    otp: otp ?? this.otp,
    packageType: packageType ?? this.packageType,
    packageWeight: packageWeight ?? this.packageWeight,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    pickupAddress: pickupAddress ?? this.pickupAddress,
    pickupDate: pickupDate ?? this.pickupDate,
    pickupLocation: pickupLocation ?? this.pickupLocation,
    pickupRemarks: pickupRemarks ?? this.pickupRemarks,
    preferredDeliveryTime: preferredDeliveryTime ?? this.preferredDeliveryTime,
    requestStatus: requestStatus ?? this.requestStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    urgency: urgency ?? this.urgency,
  );

  factory DeliveryRequestModel.fromJson(Map<String, dynamic> json) =>
      DeliveryRequestModel(
        agreedDeliveryCharge: json['agreedDeliveryCharge']?.toDouble(),
        auctionStartingTime: Timestamp.fromDate(json['auctionStartingTime']),
        baseDeliveryCharge: json['baseDeliveryCharge']?.toDouble(),
        createdAt: Timestamp.fromDate(json['createdAt']),
        deliveryAgentId: json['deliveryAgentId'],
        deliveryLocation: GeoPoint(
          json['deliveryLocation']['latitude'],
          json['deliveryLocation']['longitude'],
        ),
        deliveryRequestId: json['deliveryRequestId'],
        deliveryStatus: DeliveryStatus.fromString(json['deliveryStatus']),
        dropOffAddress: json['dropOffAddress'],
        dropOffDate: Timestamp.fromDate(json['dropOffDate']),
        dropOffRemarks: json['dropOffRemarks'],
        minimumDeliveryCharge: json['minimumDeliveryCharge']?.toDouble(),
        otp: json['otp'],
        packageType: PackageType.fromString(json['packageType']),
        packageWeight: json['packageWeight']?.toDouble(),
        paymentStatus: PaymentStatus.fromString(json['paymentStatus']),
        pickupAddress: json['pickupAddress'],
        pickupDate: Timestamp.fromDate(json['pickupDate']),
        pickupLocation: GeoPoint(
          json['pickupLocation']['latitude'],
          json['pickupLocation']['longitude'],
        ),
        pickupRemarks: json['pickupRemarks'],
        preferredDeliveryTime: json['preferredDeliveryTime'],
        requestStatus: RequestStatus.fromString(json['requestStatus']),
        updatedAt: Timestamp.fromDate(json['updatedAt']),
        urgency: Urgency.fromString(json['urgency']),
      );

  Map<String, dynamic> toJson() => {
    'agreedDeliveryCharge': agreedDeliveryCharge,
    'auctionStartingTime':
        "${auctionStartingTime.toDate().year.toString().padLeft(4, '0')}-${auctionStartingTime.toDate().month.toString().padLeft(2, '0')}-${auctionStartingTime.toDate().day.toString().padLeft(2, '0')}",
    'baseDeliveryCharge': baseDeliveryCharge,
    'createdAt':
        "${createdAt.toDate().year.toString().padLeft(4, '0')}-${createdAt.toDate().month.toString().padLeft(2, '0')}-${createdAt.toDate().day.toString().padLeft(2, '0')}",
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
    'dropOffRemarks': dropOffRemarks,
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
    'pickupRemarks': pickupRemarks,
    'preferredDeliveryTime': preferredDeliveryTime,
    'requestStatus': requestStatus.value,
    'updatedAt':
        "${updatedAt.toDate().year.toString().padLeft(4, '0')}-${updatedAt.toDate().month.toString().padLeft(2, '0')}-${updatedAt.toDate().day.toString().padLeft(2, '0')}",
    'urgency': urgency.value,
  };
}
