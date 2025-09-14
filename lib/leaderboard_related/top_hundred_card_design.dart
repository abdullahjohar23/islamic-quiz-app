import 'dummy_users.dart';
import 'package:flutter/material.dart';
import 'package:islamic_quiz_app/badge_related/badge_information.dart';

class TopHundredCard extends StatelessWidget {
    final UserInfoModel user;
    final int rank;

    const TopHundredCard({
        super.key,
        required this.user,
        required this.rank,
    });
    
    @override
    Widget build(BuildContext context) {
        double deviceWidth = MediaQuery.of(context).size.width;
        double deviceHeight = MediaQuery.of(context).size.height;

        // Get badge info from score
        final badge = getCurrentBadge(user.score);

        return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: deviceWidth*0.035, vertical: deviceHeight*0.006), // gaps outside the card
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.04, vertical: deviceHeight*0.013), // gaps inside the card
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        // Left part: avatar + rank + name
                        Row(
                            children: [
                                CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    child: Icon(
                                        Icons.person,
                                        size: deviceWidth*0.07,
                                        color: Colors.black54,
                                    ),
                                ),
                                
                                SizedBox(width: deviceWidth * 0.03), // gap between 'icon' and 'rank. name'
                                
                                Text(
                                    "$rank. ${user.name}",
                                    style: TextStyle(
                                        fontSize: deviceWidth * 0.04,
                                        fontWeight: FontWeight.w500,
                                    ),
                                ),
                            ],
                        ),

                        // Right part: score + badge
                        Row(
                            children: [
                                Text(
                                    "${user.score}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: deviceWidth * 0.04,
                                    ),
                                ),
                                
                                SizedBox(width: deviceWidth * 0.03), // gap between 'score' and 'badge'
                                
                                Image.asset(
                                    badge.imagePath,
                                    width: deviceWidth*0.047,
                                    height: deviceWidth*0.047,
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}
