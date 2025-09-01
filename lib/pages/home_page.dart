import 'package:flutter/material.dart';
import 'package:islamic_quiz_app/pages/quiz_card_design.dart';
import 'package:islamic_quiz_app/pages/quiz_category_page.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    late double deviceHeight, deviceWidth;

    @override
    Widget build(BuildContext context) {
        deviceWidth = MediaQuery.of(context).size.width;
        deviceHeight = MediaQuery.of(context).size.height;
        
        return Scaffold(
            body: SafeArea(
                child: Column(
                    children: [
                        // Header with profile & points
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.04),
                            
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                                children: [
                                    Row(
                                        children: [
                                            CircleAvatar(
                                                backgroundColor: Color(0xFF675496),
                                                child: Icon(Icons.person, color: Colors.white, size: deviceWidth*0.08),
                                            ),
                                            
                                            SizedBox(width: deviceWidth*0.03),
                                            
                                            const Text(
                                                'Abdullah Johar',
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                        ],
                                    ),

                                    Row(
                                        children: [
                                            Image.asset(
                                                'assets/images/badges/amethyst.png',
                                                height: deviceWidth*0.07,
                                            ),

                                            SizedBox(width: deviceWidth*0.01),
                                            const Text('120', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 114, 35, 163), fontWeight: FontWeight.bold)),
                                        ],
                                    ),
                                ],
                            ),
                        ),

                        // Search Bar
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.04, vertical: deviceWidth*0.05),
                            child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Search Quiz",
                                    prefixIcon: Icon(Icons.search, size: deviceWidth*0.06),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                    ),
                                ),
                            ),
                        ),

                        // Quiz Categories Grid
                        Expanded(
                            child: GridView.builder(
                                padding: EdgeInsets.all(deviceWidth * 0.04),
                                
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: deviceWidth * 0.025,
                                    mainAxisSpacing: deviceWidth * 0.025,
                                ),
                                
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                    final category = categories[index];

                                    return QuizCard(
                                        title: category.name,
                                        imagePath: category.imagePath,
                                        onTap: () {
                                            // navigate to quiz page later
                                        },
                                    );
                                },
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
