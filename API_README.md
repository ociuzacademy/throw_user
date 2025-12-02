# Throw - Delivery Application API Documentation

## Table of Contents

1. [Overview](#overview)
2. [Authentication](#authentication)
3. [Common Response Formats](#common-response-formats)
4. [API Endpoints](#api-endpoints)
   - [Authentication Module](#authentication-module)
   - [User Profile Module](#user-profile-module)
   - [Delivery Request Module](#delivery-request-module)
   - [Auction Module](#auction-module)
   - [Payment Module](#payment-module)
   - [Delivery Details Module](#delivery-details-module)
   - [Feedback Module](#feedback-module)
   - [Home Module](#home-module)
   - [Location Services](#location-services)
5. [Error Codes](#error-codes)
6. [Webhooks](#webhooks)

---

## Overview

The Throw API is a RESTful API for a delivery application that uses an auction-based system for connecting users with delivery agents. The platform allows users to create delivery requests, receive bids from agents, make secure escrow payments, and track deliveries in real-time.

**Base URL**: `https://api.throw.com/v1`

**Content Type**: `application/json`

**Authentication**: Bearer Token (JWT)

---

## Authentication

All API requests (except login and registration) require authentication using JWT tokens.

### Headers

```http
Authorization: Bearer <access_token>
Content-Type: application/json
```

### Token Refresh

Access tokens expire after 24 hours. Use the refresh token to obtain a new access token.

---

## Common Response Formats

### Success Response

```json
{
  "success": true,
  "data": { ... },
  "message": "Operation completed successfully"
}
```

### Error Response

```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message",
    "details": { ... }
  }
}
```

### Pagination

```json
{
  "success": true,
  "data": [ ... ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "totalPages": 5
  }
}
```

---

## API Endpoints

## Authentication Module

### 1. User Login

**Endpoint**: `POST /auth/login`

**Description**: Authenticate user and receive access tokens

**Authentication**: Not required

**Request Body**:
```json
{
  "email": "user@example.com",
  "password": "securePassword123"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "usr_1234567890",
      "email": "user@example.com",
      "fullName": "John Doe",
      "phoneNumber": "+1234567890",
      "profileImage": "https://cdn.throw.com/profiles/user123.jpg",
      "createdAt": "2024-01-15T10:30:00Z"
    },
    "tokens": {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "expiresIn": 86400
    }
  },
  "message": "Login successful"
}
```

**Errors**:
- `401 INVALID_CREDENTIALS`: Invalid email or password
- `404 USER_NOT_FOUND`: User does not exist
- `403 ACCOUNT_SUSPENDED`: Account has been suspended

---

### 2. User Registration

**Endpoint**: `POST /auth/register`

**Description**: Register a new user account

**Authentication**: Not required

**Request Body**:
```json
{
  "fullName": "John Doe",
  "email": "user@example.com",
  "phoneNumber": "+1234567890",
  "password": "securePassword123",
  "profileImage": "base64_encoded_image_or_url"
}
```

**Response** (201 Created):
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "usr_1234567890",
      "email": "user@example.com",
      "fullName": "John Doe",
      "phoneNumber": "+1234567890",
      "profileImage": "https://cdn.throw.com/profiles/user123.jpg",
      "createdAt": "2024-01-15T10:30:00Z"
    },
    "tokens": {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "expiresIn": 86400
    }
  },
  "message": "Registration successful"
}
```

**Errors**:
- `409 EMAIL_EXISTS`: Email already registered
- `409 PHONE_EXISTS`: Phone number already registered
- `400 INVALID_EMAIL`: Invalid email format
- `400 WEAK_PASSWORD`: Password does not meet requirements

---

### 3. Refresh Token

**Endpoint**: `POST /auth/refresh`

**Description**: Obtain a new access token using refresh token

**Authentication**: Not required

**Request Body**:
```json
{
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expiresIn": 86400
  }
}
```

**Errors**:
- `401 INVALID_TOKEN`: Invalid or expired refresh token

---

### 4. Logout

**Endpoint**: `POST /auth/logout`

**Description**: Invalidate current session and tokens

**Authentication**: Required

**Request Body**:
```json
{
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "message": "Logout successful"
}
```

---

## User Profile Module

### 5. Get User Profile

**Endpoint**: `GET /users/profile`

**Description**: Retrieve current user's profile information

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "id": "usr_1234567890",
    "email": "user@example.com",
    "fullName": "John Doe",
    "phoneNumber": "+1234567890",
    "profileImage": "https://cdn.throw.com/profiles/user123.jpg",
    "createdAt": "2024-01-15T10:30:00Z",
    "stats": {
      "totalDeliveries": 45,
      "activeDeliveries": 2,
      "totalSpent": 1250.50
    }
  }
}
```

---

### 6. Update User Profile

**Endpoint**: `PUT /users/profile`

**Description**: Update user profile information

**Authentication**: Required

**Request Body**:
```json
{
  "fullName": "John Doe Updated",
  "phoneNumber": "+1234567890",
  "profileImage": "base64_encoded_image_or_url"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "id": "usr_1234567890",
    "email": "user@example.com",
    "fullName": "John Doe Updated",
    "phoneNumber": "+1234567890",
    "profileImage": "https://cdn.throw.com/profiles/user123_updated.jpg",
    "updatedAt": "2024-01-20T14:30:00Z"
  },
  "message": "Profile updated successfully"
}
```

---

### 7. Change Password

**Endpoint**: `PUT /users/password`

**Description**: Change user password

**Authentication**: Required

**Request Body**:
```json
{
  "currentPassword": "oldPassword123",
  "newPassword": "newSecurePassword456"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "message": "Password changed successfully"
}
```

**Errors**:
- `401 INVALID_PASSWORD`: Current password is incorrect
- `400 WEAK_PASSWORD`: New password does not meet requirements

---

## Delivery Request Module

### 8. Create Delivery Request

**Endpoint**: `POST /deliveries/requests`

**Description**: Create a new delivery request and initiate auction

**Authentication**: Required

**Request Body**:
```json
{
  "pickupLocation": {
    "latitude": 40.7128,
    "longitude": -74.0060,
    "address": "123 Main St, New York, NY 10001",
    "remarks": "Near the coffee shop"
  },
  "dropOffLocation": {
    "latitude": 40.7580,
    "longitude": -73.9855,
    "address": "456 Park Ave, New York, NY 10022",
    "remarks": "Building entrance on left"
  },
  "pickupDate": "2024-01-25",
  "pickupTime": "14:30",
  "dropOffPreferredDate": "2024-01-25",
  "preferredTimeSlot": "Afternoon",
  "packageType": "Small",
  "weight": "2.5",
  "urgency": "Standard",
  "recipientPhone": "+1234567890"
}
```

**Response** (201 Created):
```json
{
  "success": true,
  "data": {
    "deliveryRequestId": "dlv_req_9876543210",
    "status": "auction_started",
    "pickupLocation": {
      "latitude": 40.7128,
      "longitude": -74.0060,
      "address": "123 Main St, New York, NY 10001",
      "remarks": "Near the coffee shop"
    },
    "dropOffLocation": {
      "latitude": 40.7580,
      "longitude": -73.9855,
      "address": "456 Park Ave, New York, NY 10022",
      "remarks": "Building entrance on left"
    },
    "pickupDateTime": "2024-01-25T14:30:00Z",
    "dropOffPreferredDate": "2024-01-25",
    "preferredTimeSlot": "Afternoon",
    "packageDetails": {
      "type": "Small",
      "weight": "2.5 kg",
      "urgency": "Standard"
    },
    "recipientPhone": "+1234567890",
    "auctionExpiresAt": "2024-01-25T15:00:00Z",
    "createdAt": "2024-01-25T14:00:00Z"
  },
  "message": "Delivery request created successfully"
}
```

**Errors**:
- `400 INVALID_LOCATION`: Invalid coordinates or address
- `400 INVALID_DATE`: Pickup date must be in the future
- `400 INVALID_PACKAGE_TYPE`: Invalid package type

---

### 9. Get Delivery Request

**Endpoint**: `GET /deliveries/requests/{deliveryRequestId}`

**Description**: Retrieve details of a specific delivery request

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "deliveryRequestId": "dlv_req_9876543210",
    "status": "auction_active",
    "pickupLocation": {
      "latitude": 40.7128,
      "longitude": -74.0060,
      "address": "123 Main St, New York, NY 10001",
      "remarks": "Near the coffee shop"
    },
    "dropOffLocation": {
      "latitude": 40.7580,
      "longitude": -73.9855,
      "address": "456 Park Ave, New York, NY 10022",
      "remarks": "Building entrance on left"
    },
    "pickupDateTime": "2024-01-25T14:30:00Z",
    "packageDetails": {
      "type": "Small",
      "weight": "2.5 kg",
      "urgency": "Standard"
    },
    "recipientPhone": "+1234567890",
    "auctionExpiresAt": "2024-01-25T15:00:00Z",
    "bidCount": 5,
    "createdAt": "2024-01-25T14:00:00Z"
  }
}
```

---

### 10. List User's Delivery Requests

**Endpoint**: `GET /deliveries/requests`

**Description**: Get all delivery requests for the authenticated user

**Authentication**: Required

**Query Parameters**:
- `status` (optional): Filter by status (auction_active, in_progress, completed, cancelled)
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20)

**Response** (200 OK):
```json
{
  "success": true,
  "data": [
    {
      "deliveryRequestId": "dlv_req_9876543210",
      "status": "in_progress",
      "pickupAddress": "123 Main St, New York, NY 10001",
      "dropOffAddress": "456 Park Ave, New York, NY 10022",
      "pickupDateTime": "2024-01-25T14:30:00Z",
      "assignedAgent": {
        "id": "agt_1234567890",
        "name": "Ethan Carter",
        "rating": 4.8,
        "imageUrl": "https://cdn.throw.com/agents/agent123.jpg"
      },
      "createdAt": "2024-01-25T14:00:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 45,
    "totalPages": 3
  }
}
```

---

### 11. Cancel Delivery Request

**Endpoint**: `DELETE /deliveries/requests/{deliveryRequestId}`

**Description**: Cancel a delivery request (only if not yet accepted)

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "message": "Delivery request cancelled successfully"
}
```

**Errors**:
- `400 CANNOT_CANCEL`: Cannot cancel request in current status
- `404 REQUEST_NOT_FOUND`: Delivery request not found

---

## Auction Module

### 12. Get Auction Bids

**Endpoint**: `GET /auctions/{deliveryRequestId}/bids`

**Description**: Get all bids for a delivery request auction

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "deliveryRequestId": "dlv_req_9876543210",
    "auctionStatus": "active",
    "expiresAt": "2024-01-25T15:00:00Z",
    "bids": [
      {
        "bidId": "bid_1111111111",
        "agent": {
          "id": "agt_1234567890",
          "name": "Ethan Carter",
          "rating": 4.8,
          "imageUrl": "https://cdn.throw.com/agents/agent123.jpg",
          "completedDeliveries": 234
        },
        "price": 12.50,
        "eta": "15 min ETA",
        "bargainedPrice": null,
        "status": "active",
        "createdAt": "2024-01-25T14:05:00Z"
      },
      {
        "bidId": "bid_2222222222",
        "agent": {
          "id": "agt_9876543210",
          "name": "Liam Harper",
          "rating": 4.9,
          "imageUrl": "https://cdn.throw.com/agents/agent456.jpg",
          "completedDeliveries": 456
        },
        "price": 13.00,
        "eta": "12 min ETA",
        "bargainedPrice": null,
        "status": "active",
        "createdAt": "2024-01-25T14:08:00Z"
      }
    ]
  }
}
```

---

### 13. Submit Bargain Offer

**Endpoint**: `POST /auctions/bids/{bidId}/bargain`

**Description**: Submit a counter-offer (bargain) to an agent's bid

**Authentication**: Required

**Request Body**:
```json
{
  "bargainPrice": 11.75
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "bidId": "bid_1111111111",
    "originalPrice": 12.50,
    "bargainPrice": 11.75,
    "status": "bargain_pending",
    "createdAt": "2024-01-25T14:15:00Z"
  },
  "message": "Bargain offer submitted successfully"
}
```

**Errors**:
- `400 INVALID_PRICE`: Bargain price must be less than original price
- `404 BID_NOT_FOUND`: Bid not found
- `400 AUCTION_EXPIRED`: Auction has expired

---

### 14. Accept Bid

**Endpoint**: `POST /auctions/bids/{bidId}/accept`

**Description**: Accept an agent's bid and assign them to the delivery

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "deliveryRequestId": "dlv_req_9876543210",
    "bidId": "bid_1111111111",
    "agent": {
      "id": "agt_1234567890",
      "name": "Ethan Carter",
      "rating": 4.8,
      "phoneNumber": "+1234567890",
      "imageUrl": "https://cdn.throw.com/agents/agent123.jpg"
    },
    "finalPrice": 11.75,
    "status": "assigned",
    "assignedAt": "2024-01-25T14:20:00Z"
  },
  "message": "Bid accepted successfully"
}
```

**Errors**:
- `404 BID_NOT_FOUND`: Bid not found
- `400 AUCTION_EXPIRED`: Auction has expired
- `400 AGENT_LEFT_AUCTION`: Agent has withdrawn from auction

---

### 15. Get Auction Status

**Endpoint**: `GET /auctions/{deliveryRequestId}/status`

**Description**: Check if auction has expired or is still active

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "deliveryRequestId": "dlv_req_9876543210",
    "status": "expired",
    "expiresAt": "2024-01-25T15:00:00Z",
    "bidCount": 5,
    "hasAcceptedBid": false
  }
}
```

---

## Payment Module

### 16. Create Payment Intent

**Endpoint**: `POST /payments/intent`

**Description**: Create a payment intent for escrow payment

**Authentication**: Required

**Request Body**:
```json
{
  "deliveryRequestId": "dlv_req_9876543210",
  "bidId": "bid_1111111111",
  "amount": 11.75,
  "currency": "USD"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "paymentIntentId": "pi_1234567890",
    "clientSecret": "pi_1234567890_secret_abcdef",
    "amount": 11.75,
    "currency": "USD",
    "status": "requires_payment_method",
    "deliveryRequestId": "dlv_req_9876543210",
    "bidId": "bid_1111111111"
  }
}
```

---

### 17. Confirm Payment

**Endpoint**: `POST /payments/{paymentIntentId}/confirm`

**Description**: Confirm escrow payment after successful payment gateway transaction

**Authentication**: Required

**Request Body**:
```json
{
  "paymentMethodId": "pm_1234567890"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "paymentId": "pay_9876543210",
    "paymentIntentId": "pi_1234567890",
    "amount": 11.75,
    "currency": "USD",
    "status": "held_in_escrow",
    "deliveryRequestId": "dlv_req_9876543210",
    "paidAt": "2024-01-25T14:25:00Z"
  },
  "message": "Payment confirmed and held in escrow"
}
```

**Errors**:
- `400 PAYMENT_FAILED`: Payment processing failed
- `404 PAYMENT_INTENT_NOT_FOUND`: Payment intent not found

---

### 18. Release Payment to Agent

**Endpoint**: `POST /payments/{paymentId}/release`

**Description**: Release escrow payment to agent after delivery confirmation

**Authentication**: Required

**Request Body**:
```json
{
  "deliveryRequestId": "dlv_req_9876543210",
  "confirmationCode": "CONF123456"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "paymentId": "pay_9876543210",
    "amount": 11.75,
    "status": "released_to_agent",
    "releasedAt": "2024-01-25T16:30:00Z"
  },
  "message": "Payment released to agent successfully"
}
```

**Errors**:
- `400 DELIVERY_NOT_CONFIRMED`: Delivery not yet confirmed
- `400 INVALID_CONFIRMATION_CODE`: Invalid confirmation code

---

### 19. Get Payment Details

**Endpoint**: `GET /payments/{paymentId}`

**Description**: Retrieve payment details

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "paymentId": "pay_9876543210",
    "deliveryRequestId": "dlv_req_9876543210",
    "amount": 11.75,
    "currency": "USD",
    "status": "held_in_escrow",
    "agent": {
      "id": "agt_1234567890",
      "name": "Ethan Carter"
    },
    "paidAt": "2024-01-25T14:25:00Z",
    "releasedAt": null
  }
}
```

---

## Delivery Details Module

### 20. Get Delivery Details

**Endpoint**: `GET /deliveries/{deliveryRequestId}/details`

**Description**: Get detailed information about an ongoing or completed delivery

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "deliveryId": "dlv_9876543210",
    "deliveryRequestId": "dlv_req_9876543210",
    "status": "in_transit",
    "agent": {
      "id": "agt_1234567890",
      "name": "Ethan Carter",
      "rating": 4.8,
      "phoneNumber": "+1234567890",
      "imageUrl": "https://cdn.throw.com/agents/agent123.jpg",
      "currentLocation": {
        "latitude": 40.7300,
        "longitude": -74.0100
      }
    },
    "pickupLocation": {
      "latitude": 40.7128,
      "longitude": -74.0060,
      "address": "123 Main St, New York, NY 10001"
    },
    "dropOffLocation": {
      "latitude": 40.7580,
      "longitude": -73.9855,
      "address": "456 Park Ave, New York, NY 10022"
    },
    "packageDetails": {
      "type": "Small",
      "weight": "2.5 kg",
      "urgency": "Standard"
    },
    "timeline": [
      {
        "status": "order_placed",
        "timestamp": "2024-01-25T14:00:00Z",
        "completed": true
      },
      {
        "status": "agent_assigned",
        "timestamp": "2024-01-25T14:20:00Z",
        "completed": true
      },
      {
        "status": "picked_up",
        "timestamp": "2024-01-25T14:45:00Z",
        "completed": true
      },
      {
        "status": "in_transit",
        "timestamp": "2024-01-25T14:50:00Z",
        "completed": true
      },
      {
        "status": "delivered",
        "timestamp": null,
        "completed": false
      }
    ],
    "estimatedDeliveryTime": "2024-01-25T15:30:00Z",
    "price": 11.75
  }
}
```

---

### 21. Track Delivery (Real-time)

**Endpoint**: `GET /deliveries/{deliveryRequestId}/track`

**Description**: Get real-time location updates for active delivery

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "deliveryId": "dlv_9876543210",
    "status": "in_transit",
    "agentLocation": {
      "latitude": 40.7300,
      "longitude": -74.0100,
      "heading": 45,
      "speed": 25,
      "lastUpdated": "2024-01-25T15:00:00Z"
    },
    "distanceToDestination": 2.5,
    "estimatedTimeRemaining": 15
  }
}
```

---

### 22. Confirm Delivery

**Endpoint**: `POST /deliveries/{deliveryRequestId}/confirm`

**Description**: Confirm delivery completion and trigger payment release

**Authentication**: Required

**Request Body**:
```json
{
  "confirmationCode": "CONF123456",
  "rating": 5,
  "feedback": "Great service!"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "deliveryId": "dlv_9876543210",
    "status": "delivered",
    "deliveredAt": "2024-01-25T15:30:00Z",
    "confirmationCode": "CONF123456"
  },
  "message": "Delivery confirmed successfully"
}
```

**Errors**:
- `400 INVALID_CONFIRMATION_CODE`: Invalid confirmation code
- `400 DELIVERY_NOT_COMPLETE`: Delivery not yet marked as complete by agent

---

## Feedback Module

### 23. Submit Feedback

**Endpoint**: `POST /feedback`

**Description**: Submit feedback and rating for a completed delivery

**Authentication**: Required

**Request Body**:
```json
{
  "deliveryRequestId": "dlv_req_9876543210",
  "agentId": "agt_1234567890",
  "rating": 5,
  "comment": "Excellent service! Very professional and on time."
}
```

**Response** (201 Created):
```json
{
  "success": true,
  "data": {
    "feedbackId": "fdb_1234567890",
    "deliveryRequestId": "dlv_req_9876543210",
    "agentId": "agt_1234567890",
    "rating": 5,
    "comment": "Excellent service! Very professional and on time.",
    "createdAt": "2024-01-25T16:00:00Z"
  },
  "message": "Feedback submitted successfully"
}
```

**Errors**:
- `400 ALREADY_SUBMITTED`: Feedback already submitted for this delivery
- `400 DELIVERY_NOT_COMPLETE`: Cannot submit feedback for incomplete delivery
- `400 INVALID_RATING`: Rating must be between 1 and 5

---

### 24. Get Feedback History

**Endpoint**: `GET /feedback`

**Description**: Get user's feedback history

**Authentication**: Required

**Query Parameters**:
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20)

**Response** (200 OK):
```json
{
  "success": true,
  "data": [
    {
      "feedbackId": "fdb_1234567890",
      "deliveryRequestId": "dlv_req_9876543210",
      "agent": {
        "id": "agt_1234567890",
        "name": "Ethan Carter",
        "imageUrl": "https://cdn.throw.com/agents/agent123.jpg"
      },
      "rating": 5,
      "comment": "Excellent service! Very professional and on time.",
      "createdAt": "2024-01-25T16:00:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 15,
    "totalPages": 1
  }
}
```

---

## Home Module

### 25. Get Home Dashboard

**Endpoint**: `GET /home/dashboard`

**Description**: Get home screen data including carousel, quick actions, and active deliveries

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "user": {
      "fullName": "John Doe",
      "profileImage": "https://cdn.throw.com/profiles/user123.jpg"
    },
    "carousel": [
      {
        "id": "car_1",
        "image": "https://cdn.throw.com/carousel/promo1.jpg",
        "title": "Fast Delivery",
        "subtitle": "Get your packages delivered in minutes"
      },
      {
        "id": "car_2",
        "image": "https://cdn.throw.com/carousel/promo2.jpg",
        "title": "Secure Payments",
        "subtitle": "Your money is safe with escrow protection"
      }
    ],
    "quickActions": [
      {
        "id": "action_1",
        "title": "New Delivery",
        "iconUrl": "https://cdn.throw.com/icons/delivery.png",
        "action": "create_delivery"
      },
      {
        "id": "action_2",
        "title": "Track Order",
        "iconUrl": "https://cdn.throw.com/icons/track.png",
        "action": "track_delivery"
      },
      {
        "id": "action_3",
        "title": "History",
        "iconUrl": "https://cdn.throw.com/icons/history.png",
        "action": "view_history"
      },
      {
        "id": "action_4",
        "title": "Support",
        "iconUrl": "https://cdn.throw.com/icons/support.png",
        "action": "contact_support"
      }
    ],
    "activeDeliveries": [
      {
        "deliveryRequestId": "dlv_req_9876543210",
        "status": "in_transit",
        "pickupAddress": "123 Main St, New York, NY",
        "dropOffAddress": "456 Park Ave, New York, NY",
        "agent": {
          "name": "Ethan Carter",
          "imageUrl": "https://cdn.throw.com/agents/agent123.jpg"
        },
        "estimatedDeliveryTime": "2024-01-25T15:30:00Z"
      }
    ],
    "stats": {
      "totalDeliveries": 45,
      "activeDeliveries": 2,
      "completedThisMonth": 8
    }
  }
}
```

---

### 26. Get Notifications

**Endpoint**: `GET /notifications`

**Description**: Get user notifications

**Authentication**: Required

**Query Parameters**:
- `unreadOnly` (optional): Filter unread notifications (default: false)
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20)

**Response** (200 OK):
```json
{
  "success": true,
  "data": [
    {
      "notificationId": "ntf_1234567890",
      "type": "new_bid",
      "title": "New Bid Received",
      "message": "Ethan Carter placed a bid of $12.50 on your delivery request",
      "data": {
        "deliveryRequestId": "dlv_req_9876543210",
        "bidId": "bid_1111111111"
      },
      "read": false,
      "createdAt": "2024-01-25T14:05:00Z"
    },
    {
      "notificationId": "ntf_9876543210",
      "type": "delivery_completed",
      "title": "Delivery Completed",
      "message": "Your delivery has been completed successfully",
      "data": {
        "deliveryRequestId": "dlv_req_1111111111"
      },
      "read": true,
      "createdAt": "2024-01-24T18:30:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 25,
    "totalPages": 2
  }
}
```

---

### 27. Mark Notification as Read

**Endpoint**: `PUT /notifications/{notificationId}/read`

**Description**: Mark a notification as read

**Authentication**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "message": "Notification marked as read"
}
```

---

## Location Services

### 28. Geocode Address

**Endpoint**: `POST /location/geocode`

**Description**: Convert address to coordinates

**Authentication**: Required

**Request Body**:
```json
{
  "address": "123 Main St, New York, NY 10001"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "address": "123 Main St, New York, NY 10001",
    "latitude": 40.7128,
    "longitude": -74.0060,
    "formattedAddress": "123 Main Street, New York, NY 10001, USA"
  }
}
```

---

### 29. Reverse Geocode

**Endpoint**: `POST /location/reverse-geocode`

**Description**: Convert coordinates to address

**Authentication**: Required

**Request Body**:
```json
{
  "latitude": 40.7128,
  "longitude": -74.0060
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "latitude": 40.7128,
    "longitude": -74.0060,
    "address": "123 Main St, New York, NY 10001",
    "formattedAddress": "123 Main Street, New York, NY 10001, USA",
    "city": "New York",
    "state": "NY",
    "country": "USA",
    "postalCode": "10001"
  }
}
```

---

### 30. Calculate Distance

**Endpoint**: `POST /location/distance`

**Description**: Calculate distance between two locations

**Authentication**: Required

**Request Body**:
```json
{
  "origin": {
    "latitude": 40.7128,
    "longitude": -74.0060
  },
  "destination": {
    "latitude": 40.7580,
    "longitude": -73.9855
  }
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "distance": 5.2,
    "unit": "km",
    "duration": 15,
    "durationUnit": "minutes"
  }
}
```

---

## Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| `INVALID_CREDENTIALS` | 401 | Invalid email or password |
| `USER_NOT_FOUND` | 404 | User does not exist |
| `ACCOUNT_SUSPENDED` | 403 | Account has been suspended |
| `EMAIL_EXISTS` | 409 | Email already registered |
| `PHONE_EXISTS` | 409 | Phone number already registered |
| `INVALID_EMAIL` | 400 | Invalid email format |
| `WEAK_PASSWORD` | 400 | Password does not meet requirements |
| `INVALID_TOKEN` | 401 | Invalid or expired token |
| `INVALID_LOCATION` | 400 | Invalid coordinates or address |
| `INVALID_DATE` | 400 | Invalid date or time |
| `INVALID_PACKAGE_TYPE` | 400 | Invalid package type |
| `REQUEST_NOT_FOUND` | 404 | Delivery request not found |
| `CANNOT_CANCEL` | 400 | Cannot cancel request in current status |
| `BID_NOT_FOUND` | 404 | Bid not found |
| `AUCTION_EXPIRED` | 400 | Auction has expired |
| `AGENT_LEFT_AUCTION` | 400 | Agent has withdrawn from auction |
| `INVALID_PRICE` | 400 | Invalid price value |
| `PAYMENT_FAILED` | 400 | Payment processing failed |
| `PAYMENT_INTENT_NOT_FOUND` | 404 | Payment intent not found |
| `DELIVERY_NOT_CONFIRMED` | 400 | Delivery not yet confirmed |
| `INVALID_CONFIRMATION_CODE` | 400 | Invalid confirmation code |
| `ALREADY_SUBMITTED` | 400 | Feedback already submitted |
| `DELIVERY_NOT_COMPLETE` | 400 | Delivery not yet complete |
| `INVALID_RATING` | 400 | Rating must be between 1 and 5 |
| `RATE_LIMIT_EXCEEDED` | 429 | Too many requests |
| `INTERNAL_SERVER_ERROR` | 500 | Internal server error |

---

## Webhooks

Webhooks allow you to receive real-time notifications about events in your account.

### Webhook Events

| Event | Description |
|-------|-------------|
| `bid.created` | New bid received on delivery request |
| `bid.accepted` | Bid accepted by user |
| `bid.bargain_received` | Bargain offer received from user |
| `auction.expired` | Auction expired without accepted bid |
| `delivery.assigned` | Agent assigned to delivery |
| `delivery.picked_up` | Package picked up by agent |
| `delivery.in_transit` | Delivery in transit |
| `delivery.delivered` | Delivery completed |
| `payment.confirmed` | Payment confirmed and held in escrow |
| `payment.released` | Payment released to agent |
| `feedback.submitted` | Feedback submitted for delivery |

### Webhook Payload Format

```json
{
  "event": "bid.created",
  "timestamp": "2024-01-25T14:05:00Z",
  "data": {
    "bidId": "bid_1111111111",
    "deliveryRequestId": "dlv_req_9876543210",
    "agentId": "agt_1234567890",
    "price": 12.50
  }
}
```

### Webhook Configuration

**Endpoint**: `POST /webhooks`

**Request Body**:
```json
{
  "url": "https://your-server.com/webhooks/throw",
  "events": ["bid.created", "delivery.delivered"],
  "secret": "your_webhook_secret"
}
```

---

## Rate Limiting

- **Rate Limit**: 100 requests per minute per user
- **Headers**: 
  - `X-RateLimit-Limit`: Maximum requests per minute
  - `X-RateLimit-Remaining`: Remaining requests in current window
  - `X-RateLimit-Reset`: Time when rate limit resets (Unix timestamp)

---

## Versioning

The API uses URL versioning. The current version is `v1`.

**Base URL**: `https://api.throw.com/v1`

---

## Support

For API support, contact:
- **Email**: api-support@throw.com
- **Documentation**: https://docs.throw.com
- **Status Page**: https://status.throw.com
