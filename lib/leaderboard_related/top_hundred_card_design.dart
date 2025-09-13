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

        // Get badge info from score
        final badge = getCurrentBadge(user.score);

        return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        // Left part: avatar + rank + name
                        Row(
                            children: [
                                CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    child: const Icon(Icons.person, color: Colors.black54),
                                ),
                                
                                const SizedBox(width: 10),
                                
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
            ),
        );
    }
}
