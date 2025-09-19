import 'package:flutter/material.dart';

class QuranPage extends StatefulWidget {
    const QuranPage({super.key});

    @override
    State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            
            body: Center(
                child: Text(
                    'This is the Quran Page',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                    ),
                ),
            ),
        );
    }
}
