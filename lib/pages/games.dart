import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
    const GamesPage({super.key});

    @override
    State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Text(
                    'This is the Game Page',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                    ),
                ),
            ),
        );
    }
}
