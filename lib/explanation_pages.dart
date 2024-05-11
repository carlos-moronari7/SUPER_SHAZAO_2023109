import 'package:flutter/material.dart';

class ExplanationPage extends StatelessWidget {
  final String header;
  final String body;
  final int currentPage;
  final int pageIndex;
  final List<Map<String, String>> explanations;

  const ExplanationPage({
    required this.header,
    required this.body,
    required this.currentPage,
    required this.pageIndex,
    required this.explanations,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFF7B00), // Darkest color at the top
                Color(0xFFFF8800),
                Color(0xFFFF9500), // Lightest color at the bottom
              ],
            ),
          ),
          child: Center(
            child: Container(
              height: 600,
              width: 350, // Set desired width
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Transparency
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 150, // Fixed height for both header and body
                      alignment: Alignment.center,
                      child: Text(
                        header,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu', // Use Ubuntu font
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Center(
                    child: Container(
                      width: 100, // Adjust the width here
                      height: 1.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100), // Adjust the radius for roundness
                      ),
                    ),
                  ),
                  const SizedBox(height: 18), // Increase bottom padding here
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20), // Padding on sides
                    child: Container(
                      height: 200, // Fixed height for body text
                      alignment: Alignment.center,
                      child: Text(
                        body,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'Ubuntu', // Use Ubuntu font
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 200,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              explanations.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index ? const Color(0xFFFFAA00) : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
