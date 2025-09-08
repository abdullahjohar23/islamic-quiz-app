import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
    const LeaderboardPage({super.key});

    @override
    State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Text(
                    'This is the Leaderboard Page',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                    ),
                ),
            ),
        );
    }
}
