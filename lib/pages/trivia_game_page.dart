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
    int timeLeft = 7;
    bool showAnswer = false; // flip state
    bool answerRevealed = false; // was answer revealed?
    bool gameStarted = false;
    bool playWithTimer = true;
    bool canFlip = false; // prevents early flipping in timer mode

    Timer? timer;
    int currentIndex = 0;
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

        animation = Tween<double>(begin: 0, end: 1).animate(controller)..addListener(() {
            setState(() {});
        });

        shuffledQuestions = List.from(questionAnswer);
        shuffledQuestions.shuffle();
    }

    void _startTimer() {
        timeLeft = 7;
        showAnswer = false;
        answerRevealed = false;
        canFlip = false;

        timer?.cancel();
        setState(() {});

        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            if (timeLeft > 1) {
                setState(() {
                    timeLeft--;
                });
            } else {
                setState(() {
                    timeLeft = 0;
                    canFlip = true;
                    answerRevealed = true;
                });

                _flipCard(auto: true);
                timer.cancel();
            }
        });
    }

    void _flipCard({bool auto = false}) {
        if (playWithTimer && !auto && !canFlip) return;

        if (controller.status == AnimationStatus.completed) {
            controller.reverse();
        } else {
            controller.forward();
        }

        // Update state after animation completes
        if (!auto) {
            Future.delayed(const Duration(milliseconds: 250), () {
                setState(() {
                    showAnswer = !showAnswer;
                    if (showAnswer) answerRevealed = true;
                });
            });
        }
    }

    void _nextQuestion() {
        controller.reset(); // Ensure animation is reset
        timer?.cancel();

        setState(() {
            currentIndex = (currentIndex + 1) % shuffledQuestions.length;
            showAnswer = false; // Always start with question
            answerRevealed = false;
            timeLeft = 7;
            canFlip = playWithTimer ? false : true;
        });

        if (playWithTimer) {
            _startTimer();
        }
    }

    void _startGame(bool withTimer) {
        setState(() {
            playWithTimer = withTimer;
            gameStarted = true;
            currentIndex = 0;
            shuffledQuestions.shuffle();
            canFlip = withTimer ? false : true;
            showAnswer = false; // Reset to show question first
            answerRevealed = false; // Reset answer revealed state
        });

        // Reset animation to question side
        controller.reset();

        if (withTimer) _startTimer();
    }

    void _finishGame() {
        setState(() {
            gameStarted = false;
            timer?.cancel();
            showAnswer = false; // Reset to question for next game
            answerRevealed = false; // Reset answer revealed state
        });
        
        // Reset animation to question side
        controller.reset();
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
            backgroundColor: Colors.white,
            
            appBar: AppBar(
                backgroundColor: const Color(0xFF675496),
                foregroundColor: Colors.white,
                
                title: Text(
                    'Play Trivia Game',
                    style: TextStyle(
                        fontSize: deviceWidth * 0.065,
                        fontWeight: FontWeight.w500,
                    ),
                ),
            ),
            
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
                child: Center(
                    child: !gameStarted
                    // Selection screen
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            _buildModeCard(
                                deviceWidth,
                                deviceHeight,
                                'Play with Timer',
                                'assets/images/timers/timer.png',
                                () => _startGame(true),
                            ),

                            SizedBox(height: deviceHeight * 0.04),
                            
                            _buildModeCard(
                                deviceWidth,
                                deviceHeight,
                                'Play without Timer',
                                'assets/images/timers/notimer.png',
                                () => _startGame(false),
                            ),
                        ],
                    )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            if (playWithTimer)
                            Text(
                                '⏳$timeLeft',
                                style: TextStyle(
                                    color: const Color(0xFF675496),
                                    fontSize: deviceWidth * 0.12,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            
                            SizedBox(height: deviceHeight * 0.05),
                            
                            GestureDetector(
                                onTap: () => _flipCard(),
                                child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001) // Perspective
                                    ..rotateY(animation.value * pi),
                                    
                                    child: Container(
                                        width: deviceWidth * 0.83,
                                        height: deviceHeight * 0.27,
                                        child: animation.value < 0.5
                                        // Front of card (question)
                                        ? Card(
                                            elevation: 5,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                            
                                            child: Center(
                                                child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.08),
                                                    
                                                    child: Text(
                                                        currentQA[0],
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: deviceWidth * 0.05,
                                                            fontWeight: FontWeight.w600,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        )
                                        // Back of card (answer)
                                        : Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.identity()..rotateY(pi),
                                            
                                            child: Card(
                                                elevation: 6,
                                                color: Colors.green[100],
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                                
                                                child: Center(
                                                    child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.08),
                                                        child: Text(
                                                            '✅ ${currentQA[1]}',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors.green[900],
                                                                fontSize: deviceWidth * 0.05,
                                                                fontWeight: FontWeight.w600,
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ),
                                ),
                            ),
                            
                            SizedBox(height: deviceHeight * 0.055),

                            if ((playWithTimer && answerRevealed) || (!playWithTimer))
                            ElevatedButton(
                                onPressed: _nextQuestion,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF675496),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),

                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: deviceWidth * 0.03,
                                        vertical: deviceHeight * 0.01,
                                    ),
                                    
                                    child: Text(
                                        'Next Question',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: deviceWidth * 0.05,
                                        ),
                                    ),
                                ),
                            ),
                            
                            SizedBox(height: deviceHeight * 0.03),
                            
                            ElevatedButton.icon(
                                onPressed: _finishGame,

                                icon: Icon(
                                    Icons.exit_to_app,
                                    size: deviceWidth * 0.05,
                                    color: Colors.white,
                                ),
                                
                                label: Text(
                                    'Finish Game',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth * 0.05,
                                    ),
                                ),
                                
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: deviceWidth * 0.07,
                                        vertical: deviceHeight * 0.012,
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }

    // Mode selection card widget
    Widget _buildModeCard(
        double deviceWidth,
        double deviceHeight,
        String text,
        String imagePath,
        VoidCallback onTap,
    ) {
        return GestureDetector(
            onTap: onTap,
            child: Card(
                color: Color(0xFFE5DFF5),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.antiAlias,
                
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                        Image.asset(
                            imagePath,
                            width: deviceWidth * 0.5,
                            height: deviceHeight * 0.25,
                            fit: BoxFit.cover,
                        ),
                        
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(deviceWidth*0.027),
                            decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                    Color(0xFF2D0A57),
                                    Color(0xFF675496),
                                    Color(0xFF675496),
                                    Color(0xFF916AA6),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                            ),
                            
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                            ),
                        ),
                            
                            child: Text(
                                text,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: deviceWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
