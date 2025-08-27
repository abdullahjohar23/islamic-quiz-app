import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    late double deviceHeight, deviceWidth;

    @override
    Widget build(BuildContext context) {
        deviceHeight = MediaQuery.of(context).size.height;
        deviceWidth = MediaQuery.of(context).size.width;
        
        return Scaffold(
            body: SafeArea(
                child: Column(
                    children: [
                        // Header with profile & points
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                        children: [
                                            const CircleAvatar(
                                                backgroundColor: Color(0xFFFF8A65),
                                                child: Icon(Icons.person, color: Colors.white),
                                            ),
                                            
                                            const SizedBox(width: 8),
                                            
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
                                                height: 25,
                                            ),

                                            const SizedBox(width: 5),
                                            const Text('120', style: TextStyle(fontSize: 20)),
                                        ],
                                    ),
                                ],
                            ),
                        ),

                        // Search Bar
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            child: TextField(
                            decoration: InputDecoration(
                                hintText: "Search Quiz",
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                ),
                            ),
                            ),
                        ),

                        // Quiz Categories Grid
                        Expanded(
                            child: GridView.builder(
                            padding: const EdgeInsets.all(12),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                            ),
                            itemCount: 12, // Later dynamic
                            itemBuilder: (context, index) {
                                return Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF8A65),
                                    borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                    child: Text(
                                    "Category ${index + 1}",
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                ),
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
