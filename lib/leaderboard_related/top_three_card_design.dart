import 'dummy_users.dart';
import 'package:flutter/material.dart';
import 'package:islamic_quiz_app/badge_related/badge_information.dart';

class TopThreeCard extends StatelessWidget {
    final UserInfoModel user;
    final int rank;
    final double heightFactor; // different size for 1, 2, 3

    const TopThreeCard({
        super.key,
        required this.user,
        required this.rank,
        required this.heightFactor,
    });

    @override
    Widget build(BuildContext context) {
        double deviceWidth = MediaQuery.of(context).size.width;
        // double deviceHeight = MediaQuery.of(context).size.height;

        // Get badge info from score
        final badge = getCurrentBadge(user.score);

        return Container(
            width: deviceWidth * 0.3,
            height: deviceWidth * heightFactor,
            padding: EdgeInsets.only(top: 5),
            
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                    ),
                ],
            ),
            
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                    CircleAvatar(
                        radius: deviceWidth * 0.09,
                        backgroundColor: Colors.grey[300],
                        child: const Icon(Icons.person, size: 40, color: Colors.black54),
                    ),
                
                    const SizedBox(height: 8),

                    // Name
                    Text(
                        user.name,
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: deviceWidth * 0.04,
                        ),
                    ),

                    // Rank number
                    Text(
                        "$rank",
                        style: TextStyle(
                        fontSize: deviceWidth * 0.045,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                        ),
                    ),

                    // Score + Badge
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                                "${user.score ~/ 1000}k", // simplified
                                style: TextStyle(
                                    fontSize: deviceWidth * 0.035,
                                    fontWeight: FontWeight.w500,
                                ),
                            ),
                            
                            const SizedBox(width: 6),

                            Image.asset(
                                badge.imagePath,
                                width: 20,
                                height: 20,
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}
