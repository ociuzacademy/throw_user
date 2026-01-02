// To parse this JSON data, do
//
//     final bidModel = bidModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:throw_user/core/exports/enum_exports.dart';

BidModel bidModelFromJson(String str) => BidModel.fromJson(json.decode(str));

String bidModelToJson(BidModel data) => json.encode(data.toJson());

class BidModel {
  final String agentAvatarUrl;
  final double agentAverageRating;
  final String agentId;
  final String agentName;
  final double? bargainAmount;
  final double bidAmount;
  final String bidId;
  final BidStatus bidStatus;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  BidModel({
    required this.agentAvatarUrl,
    required this.agentAverageRating,
    required this.agentId,
    required this.agentName,
    this.bargainAmount,
    required this.bidAmount,
    required this.bidId,
    required this.bidStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  BidModel copyWith({
    String? agentAvatarUrl,
    double? agentAverageRating,
    String? agentId,
    String? agentName,
    double? bargainAmount,
    double? bidAmount,
    String? bidId,
    BidStatus? bidStatus,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) => BidModel(
    agentAvatarUrl: agentAvatarUrl ?? this.agentAvatarUrl,
    agentAverageRating: agentAverageRating ?? this.agentAverageRating,
    agentId: agentId ?? this.agentId,
    agentName: agentName ?? this.agentName,
    bargainAmount: bargainAmount ?? this.bargainAmount,
    bidAmount: bidAmount ?? this.bidAmount,
    bidId: bidId ?? this.bidId,
    bidStatus: bidStatus ?? this.bidStatus,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  factory BidModel.fromJson(Map<String, dynamic> json) => BidModel(
    agentAvatarUrl: json['agentAvatarUrl'],
    agentAverageRating: (json['agentAverageRating'] ?? 0.0).toDouble(),
    agentId: json['agentId'],
    agentName: json['agentName'],
    bargainAmount: json['bargainAmount']?.toDouble(),
    bidAmount: (json['bidAmount'] ?? 0.0).toDouble(),
    bidId: json['bidId'],
    bidStatus: BidStatus.fromString(json['bidStatus']),
    createdAt: json['createdAt'] as Timestamp,
    updatedAt: json['updatedAt'] as Timestamp,
  );

  Map<String, dynamic> toJson() => {
    'agentAvatarUrl': agentAvatarUrl,
    'agentAverageRating': agentAverageRating,
    'agentId': agentId,
    'agentName': agentName,
    'bargainAmount': bargainAmount,
    'bidAmount': bidAmount,
    'bidId': bidId,
    'bidStatus': bidStatus.value,
    'createdAt':
        "${createdAt.toDate().year.toString().padLeft(4, '0')}-${createdAt.toDate().month.toString().padLeft(2, '0')}-${createdAt.toDate().day.toString().padLeft(2, '0')}",
    'updatedAt':
        "${updatedAt.toDate().year.toString().padLeft(4, '0')}-${updatedAt.toDate().month.toString().padLeft(2, '0')}-${updatedAt.toDate().day.toString().padLeft(2, '0')}",
  };
}
