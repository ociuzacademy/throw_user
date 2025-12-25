import 'dart:math';

import 'package:throw_user/core/models/bid.dart';

class FakeData {
  // Function to generate random bids
  static List<Bid> generateRandomBids({
    int count = 5,
    bool includeBargainedPrices = false,
  }) {
    final Random random = Random();
    final List<Bid> bids = [];

    // Lists of fake data
    final List<String> firstNames = [
      'Ethan',
      'Liam',
      'Noah',
      'Oliver',
      'James',
      'William',
      'Benjamin',
      'Lucas',
      'Henry',
      'Alexander',
      'Mason',
      'Michael',
      'Daniel',
      'Jacob',
    ];

    final List<String> lastNames = [
      'Smith',
      'Johnson',
      'Williams',
      'Brown',
      'Jones',
      'Garcia',
      'Miller',
      'Davis',
      'Rodriguez',
      'Martinez',
      'Hernandez',
      'Lopez',
      'Gonzalez',
    ];

    final List<String> etas = [
      '5 min ETA',
      '8 min ETA',
      '10 min ETA',
      '12 min ETA',
      '15 min ETA',
      '18 min ETA',
      '20 min ETA',
      '25 min ETA',
      '30 min ETA',
    ];

    final List<String> avatarUrls = [
      'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
      'https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?w=150&h=150&fit=crop&crop=face',
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      'https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?w=150&h=150&fit=crop&crop=face',
      'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=150&h=150&fit=crop&crop=face',
      'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150&h=150&fit=crop&crop=face',
    ];

    for (int i = 0; i < count; i++) {
      final String firstName = firstNames[random.nextInt(firstNames.length)];
      final String lastName = lastNames[random.nextInt(lastNames.length)];
      final String fullName = '$firstName $lastName';

      // Generate random rating between 3.5 and 5.0 with one decimal place
      final double rating = (35 + random.nextInt(16)) / 10.0; // 3.5 to 5.0

      // Generate random price between 8.0 and 25.0 with two decimal places
      final double price =
          (800 + random.nextInt(1701)) / 100.0; // 8.00 to 25.00

      final String eta = etas[random.nextInt(etas.length)];
      final String imageUrl = avatarUrls[random.nextInt(avatarUrls.length)];

      // Randomly decide if this bid has a bargained price (30% chance)
      final double? bargainedPrice =
          includeBargainedPrices && random.nextDouble() < 0.3
          ? (price *
                (0.8 +
                    random.nextDouble() * 0.15)) // 80% to 95% of original price
          : null;

      // Randomly decide if agent left auction (10% chance)
      final bool agentLeftAuction = random.nextDouble() < 0.1;

      bids.add(
        Bid(
          name: fullName,
          rating: rating,
          eta: eta,
          price: double.parse(price.toStringAsFixed(2)),
          imageUrl: imageUrl,
          bargainedPrice: bargainedPrice != null
              ? double.parse(bargainedPrice.toStringAsFixed(2))
              : null,
          agentLeftAuction: agentLeftAuction,
        ),
      );
    }

    // Sort by price (lowest first) or rating (highest first) randomly
    if (random.nextBool()) {
      bids.sort((a, b) => a.price.compareTo(b.price));
    } else {
      bids.sort((a, b) => b.rating.compareTo(a.rating));
    }

    return bids;
  }

  // Alternative function that returns a fixed number of high-quality fake bids
  static List<Bid> generateSampleBids() {
    return [
      const Bid(
        name: 'Ethan Carter',
        rating: 4.8,
        eta: '15 min ETA',
        price: 12.50,
        imageUrl:
            'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
        bargainedPrice: 11.75,
      ),
      const Bid(
        name: 'Liam Harper',
        rating: 4.9,
        eta: '12 min ETA',
        price: 13.00,
        imageUrl:
            'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      ),
      const Bid(
        name: 'Noah Bennett',
        rating: 4.7,
        eta: '18 min ETA',
        price: 11.75,
        imageUrl:
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
        agentLeftAuction: true,
      ),
      const Bid(
        name: 'Oliver Chen',
        rating: 4.6,
        eta: '10 min ETA',
        price: 14.25,
        imageUrl:
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
        bargainedPrice: 13.50,
      ),
      const Bid(
        name: 'James Rodriguez',
        rating: 4.5,
        eta: '25 min ETA',
        price: 10.50,
        imageUrl:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
      ),
    ];
  }
}
