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

                            padding: EdgeInsets.symmetric(
                                vertical: deviceHeight * 0.09,
                                horizontal: deviceWidth * 0.06,
                            ),
                            
                            decoration: BoxDecoration(
                                color: Color(0xFF675496),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                ),
                            ),
                            
                            child: Column(
                                children: [
                                    // Avatar
                                    const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.person, size: 40, color: Color(0xFF675496)),
                                    ),
                                    
                                    const SizedBox(height: 10),

                                    // Name
                                    const Text(
                                        'ABDULLAH JOHAR',
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        ),
                                    ),

                                    const SizedBox(height: 15),

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

                        const SizedBox(height: 30),

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
