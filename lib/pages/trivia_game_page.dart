
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamic_quiz_app/games_related/trivia_game_questions.dart';

class TriviaGamePage extends StatefulWidget {
    const TriviaGamePage({super.key});

    @override
    State<TriviaGamePage> createState() => _TriviaGamePageState();
}

class _TriviaGamePageState extends State<TriviaGamePage> with SingleTickerProviderStateMixin {
    int timeLeft = 5;
    bool showAnswer = false;
    bool gameStarted = false;
    Timer? timer;

    int currentIndex = 0; // which question we are on
    late List<List<String>> shuffledQuestions;
    late AnimationController controller;
    late Animation<double> animation;

    @override
    void initState() {
        super.initState();

        controller = AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 500),
        );

        animation = Tween<double>(begin: 0, end: 1).animate(controller);

        // Shuffle questions at the start
        shuffledQuestions = List.from(questionAnswer);
        shuffledQuestions.shuffle();
    }

    // Start Time Function
    void _startTimer() {
        timeLeft = 7;
        showAnswer = false;
        gameStarted = true;

        timer?.cancel();
        setState(() {}); // show question immediately

        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            if (timeLeft > 1) {
                setState(() {
                    timeLeft--;
                });
            } else {
                setState(() {
                    timeLeft = 0;
                    _flipCard();
                });
                
                timer.cancel();
            }
        });
    }

    // Flip Card to show the Answer Function
    void _flipCard() {
        controller.forward(from: 0).then((_) {
            setState(() {
                showAnswer = true;
            });
        });
    }

    // Go to Next Question Function
    void _nextQuestion() {
        controller.value = 0; // reset flip animation
        
        setState(() {
            currentIndex = (currentIndex + 1) % shuffledQuestions.length;
            showAnswer = false;
        });
        
        _startTimer();
    }

    @override
    void dispose() {
        timer?.cancel();
        controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        double deviceWidth = MediaQuery.of(context).size.width;
        double deviceHeight = MediaQuery.of(context).size.height;

        final currentQA = shuffledQuestions[currentIndex];

        return Scaffold(
            appBar: AppBar(
                backgroundColor: Color(0xFF675496),
                foregroundColor: Colors.white,
                
                title: Text(
                    'Play Trivia Game',
                    style: TextStyle(
                        fontSize: deviceWidth*0.067,
                        fontWeight: FontWeight.w500,
                    ),
                ),
            ),

            body: Padding(
                padding: const EdgeInsets.all(16),
                
                child: Center(
                    child: !gameStarted
                    // Start button first
                    ? ElevatedButton(
                        onPressed: _startTimer,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF675496),
                            padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.1, vertical: deviceHeight*0.015),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        
                        child: Text(
                            'Start Game',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth*0.055,
                            ),
                        ),
                    )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            // ⏳Countdown
                            Text(
                                '⏳$timeLeft',
                                style: TextStyle(
                                    fontSize: deviceWidth * 0.12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF675496),
                                ),
                            ),
                        
                            SizedBox(height: deviceHeight*0.05),

                            // Flip Card
                            AnimatedBuilder(
                                animation: animation,
                                builder: (context, child) {
                                    final angle = animation.value * pi;
                                    final isBack = angle > pi / 2;

                                    return Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(angle),
                                        
                                        child: Transform(
                                            alignment: Alignment.center,
                                            transform: isBack ? Matrix4.rotationY(pi) : Matrix4.identity(), // Fix mirrored text
                                            
                                            child: Card(
                                                elevation: 6,
                                                color: isBack ? Colors.green[100] : Colors.white, // card background color                                                
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    
                                                child: SizedBox(
                                                    width: deviceWidth * 0.83,
                                                    height: deviceHeight * 0.27,
                                                    child: Center(    
                                                        child: Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.08),
                                                            child: Text(
                                                                isBack ? '✅ ${currentQA[1]}' : currentQA[0],
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    fontSize: deviceWidth * 0.05,
                                                                    fontWeight: FontWeight.w600,
                                                                    color: isBack ? Colors.green[900] : Colors.black87,
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    );
                                },
                            ),

                            SizedBox(height: deviceHeight*0.055),

                            if (showAnswer)
                            ElevatedButton(
                                onPressed: _nextQuestion,
                                
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF675496),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                
                                child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.03, vertical: deviceHeight*0.01),
                                    child: Text(
                                        'Next Question',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: deviceWidth*0.05,
                                        ),
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
