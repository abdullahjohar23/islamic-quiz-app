import 'badge_information.dart';
import 'package:flutter/material.dart';

class BadgeCard extends StatelessWidget {
    final BadgeInfo badge;
    final int userScore;

    const BadgeCard({
        super.key,
        required this.badge,
        required this.userScore,
    });

    bool get isUnlocked {
        final currentBadge = getCurrentBadge(userScore);
        return badges.indexOf(badge) <= badges.indexOf(currentBadge);
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.all(6),
            
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
            ),

            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.asset(
                        isUnlocked ? badge.imagePath : "assets/images/badges/questionmark.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                    ),
                    
                    const SizedBox(height: 6),
                    
                    Text(
                        badge.name,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isUnlocked ? badge.color : Colors.grey,
                        ),
                    ),
                ],
            ),
        );
    }
}
