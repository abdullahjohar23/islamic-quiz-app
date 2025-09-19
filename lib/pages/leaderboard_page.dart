import 'package:flutter/material.dart';
import 'package:islamic_quiz_app/leaderboard_related/dummy_users.dart';
import 'package:islamic_quiz_app/leaderboard_related/top_three_card_design.dart';
import 'package:islamic_quiz_app/leaderboard_related/top_hundred_card_design.dart';

class LeaderboardPage extends StatelessWidget {
    const LeaderboardPage({super.key});

    @override
    Widget build(BuildContext context) {
        double deviceWidth = MediaQuery.of(context).size.width;
        double deviceHeight = MediaQuery.of(context).size.height;

        // Sort users by score in descending order (highest first)
        final sortedUsers = [...dummyUsers]..sort((a, b) => b.score.compareTo(a.score));

        return Scaffold(
            backgroundColor: Colors.white,
            
            body: Column(
                children: [
                    // Top 3 Section
                    Container(
                        // design
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.07),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                    Color(0xFF2D0A57),
                                    Color(0xFF675496),
                                    Color(0xFF675496),
                                    Color(0xFFE0A8FF),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                            ),
                            
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                            ),
                        ),
                        
                        // display top 3 users
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                                TopThreeCard(user: sortedUsers[1], rank: 2, heightFactor: 0.45),
                                TopThreeCard(user: sortedUsers[0], rank: 1, heightFactor: 0.52),
                                TopThreeCard(user: sortedUsers[2], rank: 3, heightFactor: 0.42),
                            ],
                        ),
                    ),

                    SizedBox(height: deviceHeight*0.02),

                    // "Top 100" Section Title
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
                        child: Text(
                            'Top 100',
                            style: TextStyle(
                                fontSize: deviceWidth * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                            ),
                        ),
                    ),

                    SizedBox(height: deviceHeight*0.02),

                    // Expanded List for Ranks 4–100
                    Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: sortedUsers.length - 3, // excluding top 3
                            itemBuilder: (context, index) {
                                int rank = index + 4; // starts at 4
                                
                                return TopHundredCard(
                                    user: sortedUsers[index + 3],
                                    rank: rank,
                                );
                            },
                        ),
                    ),
                ],
            ),
        );
    }
}
