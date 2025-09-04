import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
    const ProfilePage({super.key});

    @override
    State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    late TextEditingController _nameController;
    String userName = 'Abdullah Johar'; // sample for now
    int totalQuizPlayed = 45; // sample for now

    List<String> earnedBadges = [
        "assets/images/badges/copper.png",
        "assets/images/badges/amber.png",
        "assets/images/badges/amethyst.png",
    ];

    @override
    void initState() {
        super.initState();
        _nameController = TextEditingController(text: userName);
    }

    @override
    void dispose() {
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        double deviceWidth = MediaQuery.of(context).size.width;
        double deviceHeight = MediaQuery.of(context).size.height;

        return Scaffold(
            backgroundColor: Colors.white,
            
            body: SafeArea(
                child: Column(
                    children: [
                        // Top Purple Gradient Card
                        Container(
                            width: deviceWidth,

                            padding: EdgeInsets.symmetric(
                                vertical: deviceHeight * 0.08,
                                horizontal: deviceWidth * 0.01,
                            ),
                            
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                        Color(0xFF2D0A57), // very dark purple
                                        Color(0xFF675496), // base purple
                                        Color(0xFF675496), // base purple
                                        Color(0xFFE0A8FF), // bright lavender
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
                                    // Avatar
                                    CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Icon(
                                            Icons.person,
                                            size: deviceWidth*0.12,
                                            color: Color(0xFF675496),
                                        ),
                                    ),
                                    
                                    SizedBox(height: deviceHeight*0.03),

                                    // Name
                                    Text(
                                        'ABDULLAH JOHAR',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: deviceWidth*0.047,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),

                                    SizedBox(height: deviceHeight*0.03),

                                    // Position, Badge and Score
                                    Column(
                                        children: [
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                    // Position
                                                    Text(
                                                        '#75',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: deviceWidth*0.04,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                    ),

                                                    Image.asset('assets/images/badges/amethyst.png', height: deviceWidth*0.07),

                                                    Text(
                                                        '120',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: deviceWidth*0.04,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                    ),
                                                ],
                                            ),
                                            
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                    Text(
                                                        'Position',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: deviceWidth*0.035,
                                                            fontWeight: FontWeight.w400,
                                                        ),
                                                    ),

                                                    Text(
                                                        'Amethyst',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: deviceWidth*0.035,
                                                            fontWeight: FontWeight.w400,
                                                        ),
                                                    ),

                                                    Text(
                                                        'SCORE',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: deviceWidth*0.035,
                                                            fontWeight: FontWeight.w400,
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                        ),

                        SizedBox(height: deviceHeight*0.05),

                        // Lower Profile Section
                        
                    ],
                ),
            ),
        );
    }
}
