import 'package:flutter/material.dart';

class ContestPage extends StatefulWidget {
    const ContestPage({super.key});

    @override
    State<ContestPage> createState() => _ContestPageState();
}

class _ContestPageState extends State<ContestPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Text(
                    'This is the Contest Page',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                    ),
                ),
            ),
        );
    }
}
