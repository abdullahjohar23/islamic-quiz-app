import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
    const ProfilePage({super.key});

    @override
    Widget build(BuildContext context) {
        double deviceWidth = MediaQuery.of(context).size.width;
        double deviceHeight = MediaQuery.of(context).size.height;

        return Scaffold(
            backgroundColor: Colors.white,
            
            body: SafeArea(
                child: Column(
                    children: [
                        // Top Purple Card
                        Container(
                            width: deviceWidth,
                            height: deviceHeight*0.4,

                            padding: EdgeInsets.symmetric(
                                vertical: deviceHeight * 0.09,
                                horizontal: deviceWidth * 0.01,
                            ),
                            
                            decoration: BoxDecoration(
                                // color: Color(0xFF675496),
                                gradient: LinearGradient(
                                    colors: [
                                        Color(0xFF2D0A57), // very dark purple
                                        Color(0xFF675496), // base purple
                                        Color(0xFFE0A8FF), // bright lavender
                                    ], 

                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                ),
                                borderRadius: const BorderRadius.only(
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
                                    const Text(
                                        'ABDULLAH JOHAR',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
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
                                                    Text(
                                                        '#75',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                    ),

                                                    Image.asset('assets/images/badges/amethyst.png',height: deviceWidth*0.07),

                                                    Text(
                                                        '120',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
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
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                        ),
                                                    ),

                                                    Text(
                                                        'Amethyst',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                        ),
                                                    ),

                                                    Text(
                                                        'SCORE',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
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

                        // Info Boxes
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.08),
                            child: Column(
                                children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                        margin: const EdgeInsets.only(bottom: 15),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black54),
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Text(
                                            "Name: ABDULLAH Johar",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ),
                                        ),
                                    ),
                                    
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black54),
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Text(
                                            "Age: 26",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
