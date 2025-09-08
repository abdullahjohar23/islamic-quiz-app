import 'package:flutter/material.dart';

class BadgeInfo {
    final String name;
    final String imagePath;
    final int minScore;
    final int? maxScore; // null means ∞
    final Color color;

    const BadgeInfo({
        required this.name,
        required this.imagePath,
        required this.minScore,
        this.maxScore,
        required this.color,
    });
}

final List<BadgeInfo> badges = [
    BadgeInfo(
        name: 'No Badge',
        imagePath: 'assets/images/badges/nothing.png',
        minScore: 0,
        maxScore: 0,
        color: Colors.black54,
    ),

    BadgeInfo(
        name: 'Bronzite',
        imagePath: 'assets/images/badges/1_bronzite.png',
        minScore: 1,
        maxScore: 99,
        color: Colors.brown,
    ),
    
    BadgeInfo(
        name: 'Amber',
        imagePath: 'assets/images/badges/2_amber.png',
        minScore: 100,
        maxScore: 299,
        color: Colors.amberAccent,
    ),
    
    BadgeInfo(
        name: 'Amethyst',
        imagePath: 'assets/images/badges/3_amethyst.png',
        minScore: 300,
        maxScore: 599,
        color: Colors.purple,
    ),
    
    BadgeInfo(
        name: 'Peridot',
        imagePath: 'assets/images/badges/4_peridot.png',
        minScore: 600,
        maxScore: 999,
        color: Colors.green,
    ),
    
    BadgeInfo(
        name: 'Garnet',
        imagePath: 'assets/images/badges/5_garnet.png',
        minScore: 1000,
        maxScore: 1499,
        color: Colors.red,
    ),
    
    BadgeInfo(
        name: 'Tanzanite',
        imagePath: 'assets/images/badges/6_tanzanite.png',
        minScore: 1500,
        maxScore: 1999,
        color: Colors.blueAccent,
    ),
    
    BadgeInfo(
        name: 'Gold',
        imagePath: 'assets/images/badges/7_gold.png',
        minScore: 2000,
        maxScore: 2999,
        color: Colors.amber,
    ),
    
    BadgeInfo(
        name: 'Black Opal',
        imagePath: 'assets/images/badges/8_blackopal.png',
        minScore: 3000,
        maxScore: 3999,
        color: Colors.black,
    ),
    
    BadgeInfo(
        name: 'Emerald',
        imagePath: 'assets/images/badges/9_emerald.png',
        minScore: 4000,
        maxScore: 6999,
        color: Colors.greenAccent,
    ),
    
    BadgeInfo(
        name: 'Ruby',
        imagePath: 'assets/images/badges/10_ruby.png',
        minScore: 7000,
        maxScore: 9999,
        color: Colors.redAccent,
    ),
    
    BadgeInfo(
        name: 'Sapphire',
        imagePath: 'assets/images/badges/11_sapphire.png',
        minScore: 10000,
        maxScore: 14999,
        color: Colors.blue,
    ),
    
    BadgeInfo(
        name: 'Diamond',
        imagePath: 'assets/images/badges/12_diamond.png',
        minScore: 15000,
        maxScore: null, // ∞
        color: Colors.lightBlueAccent,
    ),
];

// Function to determine the current badge based on score
BadgeInfo getCurrentBadge (int score) {
    for (var badge in badges.reversed) {
        if (score >= badge.minScore && (badge.maxScore == null || score <= badge.maxScore!)) {
            return badge;
        }
    }
    
    return badges.first; // Default to Bronzite if score is below minimum
}
