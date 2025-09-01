import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
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
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(imagePath),
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
                                        title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Archivo_Black',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 3
                                            ..color = Colors.white,
                                        ),
                                    ),
                                    
                                    // White fill text
                                    Text(
                                        title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Archivo_Black',
                                            fontSize: 15,
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
