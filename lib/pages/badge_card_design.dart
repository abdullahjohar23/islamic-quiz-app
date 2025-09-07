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
        double deviceWidth = MediaQuery.of(context).size.width;
        double deviceHeight = MediaQuery.of(context).size.height;

        
        return Container(
            padding: EdgeInsets.only(top: deviceHeight*0.01),
            
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
            ),

            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Image.asset(
                        isUnlocked ? badge.imagePath : 'assets/images/badges/questionmark.png',
                        width: deviceWidth*0.085,
                        fit: BoxFit.contain,
                    ),
                    
                    SizedBox(height: deviceHeight*0.008),
                    
                    Text(
                        badge.name,
                        style: TextStyle(
                            fontSize: deviceWidth*0.035,
                            fontWeight: FontWeight.bold,
                            color: isUnlocked ? badge.color : Colors.grey,
                        ),
                    ),
                ],
            ),
        );
    }
}
