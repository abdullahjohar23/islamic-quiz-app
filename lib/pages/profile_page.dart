import 'package:flutter/material.dart';
import 'package:islamic_quiz_app/badge_related/badge_card_design.dart';
import 'package:islamic_quiz_app/badge_related/badge_information.dart';

class ProfilePage extends StatefulWidget {
    const ProfilePage({super.key});

    @override
    State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    late TextEditingController _nameController;
    
    String userName = 'Abdullah Johar'; // sample for now
    int userRank = 74;
    int userScore = 0; // sample for now
    int totalQuizPlayed = 45; // sample for now
    late BadgeInfo currentBadge;

    final filteredBadges = badges.sublist(1); // create new list without first item to skip displaying the no badge

    @override
    void initState() {
        super.initState();
        _nameController = TextEditingController(text: userName);
        currentBadge = getCurrentBadge(userScore); // initialize current badge
    }

    @override
    void dispose() {
        _nameController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        double deviceWidth = MediaQuery.of(context).size.width;
        double deviceHeight = MediaQuery.of(context).size.height;

        return Scaffold(
            backgroundColor: Colors.white,
            
            body: SafeArea(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical, // it's by default vertical
                    child: Column(
                        children: [
                            //* Top Purple Gradient Card
                            Container(
                                // Card Design
                                width: deviceWidth,
                                padding: EdgeInsets.symmetric(
                                    vertical: deviceHeight * 0.08,
                                    horizontal: deviceWidth * 0.01,
                                ),
                                
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
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                    ),
                                ),
                                
                                child: Column(
                                    children: [
                                        // User Avatar
                                        CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 30,
                                            child: Icon(
                                                Icons.person,
                                                size: deviceWidth * 0.12,
                                                color: Color(0xFF675496),
                                            ),
                                        ),
                                        
                                        SizedBox(height: deviceHeight * 0.03),
                                        
                                        // User Name
                                        Text(
                                            userName.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: deviceWidth * 0.047,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        
                                        SizedBox(height: deviceHeight * 0.03),
                                        
                                        // User Position, Badge, Score
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                                Text(
                                                    userRank.toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: deviceWidth * 0.055,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                ),
                                                
                                                Image.asset(
                                                    currentBadge.imagePath,
                                                    height: deviceWidth * 0.1
                                                ),

                                                Text(
                                                    userScore.toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: deviceWidth * 0.055,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                ),
                                            ],
                                        ),

                                        SizedBox(height: deviceHeight * 0.01),

                                        // Text Labels (Position, Badge, Score)
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                                Text(
                                                    'Position',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: deviceWidth * 0.045,
                                                    ),
                                                ),
                                                
                                                Text(
                                                    currentBadge.name,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: deviceWidth * 0.045,
                                                    ),
                                                ),
                                                
                                                Text(
                                                    'SCORE',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: deviceWidth * 0.045,
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ],
                                ),
                            ),

                            SizedBox(height: deviceHeight * 0.05),

                            //* Editable Name + Save Button
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
                                child: Row(
                                    children: [
                                        Expanded(
                                            child: TextField(
                                                controller: _nameController,
                                                
                                                style: TextStyle(fontSize: deviceWidth * 0.05),
                                                
                                                decoration: InputDecoration(
                                                    labelText: 'Name',
                                                    labelStyle: TextStyle(
                                                        color: Color(0xFF2D0A57),
                                                        fontSize: deviceWidth * 0.06,
                                                    ),
                                                    
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                    ),
                                                ),
                                            ),
                                        ),

                                        SizedBox(width: deviceWidth * 0.02), // gap between TextField and the Save Button
                                        
                                        ElevatedButton(
                                            onPressed: () {
                                                setState(() {
                                                    userName = _nameController.text;
                                                });
                                            },
                                            
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(0xFF675496),
                                                foregroundColor: Colors.white,
                                                
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: deviceWidth * 0.07,
                                                    vertical: deviceHeight * 0.018
                                                ),
                                                
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                ),
                                                
                                                elevation: 8,
                                            ),

                                            child: Text(
                                                'Save',
                                                style: TextStyle(
                                                    fontSize: deviceWidth * 0.05,
                                                    color: Colors.white,
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),

                            SizedBox(height: deviceHeight * 0.03),

                            //* Total Quizzes Attempted
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
                                child: Container(
                                    padding: EdgeInsets.all(deviceWidth * 0.03),
                                    
                                    decoration: BoxDecoration(
                                        color: Color(0xFF675496),
                                        borderRadius: BorderRadius.circular(12),
                                    ),
                                    
                                    child: Row(
                                        children: [
                                            Icon(
                                                Icons.assignment,
                                                color: Colors.white,
                                                size: deviceWidth * 0.065,
                                            ),
                                            
                                            SizedBox(width: deviceWidth * 0.027),
                                            
                                            Text(
                                                'Total Quizzes Played: $totalQuizPlayed',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: deviceWidth * 0.046,
                                                    fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ),

                            SizedBox(height: deviceHeight * 0.03),

                            //* Badges Earned
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    // Badges Earned Label
                                    Padding(
                                        padding: EdgeInsets.only(left: deviceWidth * 0.06, bottom: deviceHeight * 0.02),
                                        child: Text(
                                            'Badges Earned',
                                            style: TextStyle(
                                                color: Color(0xFF675496),
                                                fontSize: deviceWidth*0.048,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ),

                                    // Badges Display
                                    Padding(
                                        padding: EdgeInsets.only(right: deviceWidth*0.048, left: deviceWidth*0.048, bottom: deviceWidth*0.06),
                                        child: GridView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                mainAxisSpacing: 12,
                                                crossAxisSpacing: 12,
                                                childAspectRatio: 0.9,
                                            ),
                                            
                                            itemCount: filteredBadges.length,
                                            
                                            itemBuilder: (context, index) {
                                                return BadgeCard(
                                                    badge: filteredBadges[index],
                                                    userScore: userScore,
                                                );
                                            },
                                        ),
                                    ),
                                ],
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
