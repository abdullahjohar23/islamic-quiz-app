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
        'assets/images/badges/1_bronzite.png',
        'assets/images/badges/2_amber.png',
        'assets/images/badges/3_amethyst.png',
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
                        //* Top Purple Gradient Card
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
                                        userName.toUpperCase(),
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

                                                    Image.asset('assets/images/badges/1_bronzite.png', height: deviceWidth*0.07),

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

                        //* Lower Profile Section

                        // Edit Name Field
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),

                            child: Row(
                                children: [
                                    Expanded(
                                        child: TextField(
                                            controller: _nameController,
                                            style: TextStyle(
                                                fontSize: deviceWidth*0.05,
                                                color: Colors.grey,
                                            ),
                                            
                                            decoration: InputDecoration(
                                                labelText: 'Name',
                                                labelStyle: TextStyle(
                                                    color: Color(0xFF2D0A57),
                                                    fontSize: deviceWidth*0.06,
                                                ),

                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                ),
                                            ),
                                        ),
                                    ),

                                    SizedBox(width: deviceWidth*0.02), // gap between Name TextField and the Save Button

                                    ElevatedButton(
                                        onPressed: () {
                                            setState(() {
                                                userName = _nameController.text;
                                            });
                                        },

                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF675496), // Background color
                                            foregroundColor: Colors.white, // Text color
                                            padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.07, vertical: deviceHeight*0.02),
                                            
                                            textStyle: TextStyle(
                                                fontSize: deviceWidth*0.05,
                                                fontWeight: FontWeight.w600,
                                            ),
                                            
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                                side: BorderSide(
                                                    color: Color(0xFF675496), // Border color
                                                    width: 2.0, // Border width
                                                ),
                                            ),
                                            elevation: 8, // Shadow depth
                                            shadowColor: Color(0xFF675496).withAlpha(76), // Colors.blue.withOpacity(0.3) -> 0.3 opacity ≈ 76 alpha (255 * 0.3),
                                        ),
                                        
                                        child: Text(
                                            'Save',
                                            style: TextStyle(
                                                fontSize: deviceWidth*0.05,
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ),

                        SizedBox(height: deviceHeight*0.03),

                        // Total Quizzes Attempted
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),

                            child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF675496),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFF2D0A57),
                                            blurRadius: 5,
                                            offset: Offset(0, 3) // Offset(dx, dy)
                                        ),
                                    ],
                                ),

                                child: Row(
                                    children: [
                                        Icon(
                                            Icons.assignment,
                                            color: Colors.white,
                                            size: deviceWidth*0.065,
                                        ),

                                        SizedBox(width: 10),

                                        Text(
                                            'Total Quizzes Attempted: $totalQuizPlayed',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: deviceWidth*0.046,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ),

                        // Badges Earned
                    ],
                ),
            ),
        );
    }
}
