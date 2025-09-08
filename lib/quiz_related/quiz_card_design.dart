import 'package:flutter/material.dart';

class QuizCard extends StatefulWidget {
    final String title;
    final String imagePath;
    final VoidCallback onTap;

    const QuizCard({
        super.key,
        required this.title,
        required this.imagePath,
        required this.onTap,
    });

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
    late double deviceHeight, deviceWidth;

    @override
    Widget build(BuildContext context) {
        deviceWidth = MediaQuery.of(context).size.width;
        deviceHeight = MediaQuery.of(context).size.height;

        return GestureDetector(
            onTap: widget.onTap,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover,
                    ),
                ),

                child: Container( // overlay to make text readable
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(89, 0, 0, 0),
                    ),

                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Stack(
                                children: [
                                    // Border text
                                    Text(
                                        widget.title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Archivo_Black',
                                            fontSize: deviceWidth*0.035,
                                            fontWeight: FontWeight.w600,
                                            foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 3
                                            ..color = Colors.white,
                                        ),
                                    ),
                                    
                                    // White fill text
                                    Text(
                                        widget.title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Archivo_Black',
                                            fontSize: deviceWidth*0.035,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ),
                ),
            ),
        );
    }
}
