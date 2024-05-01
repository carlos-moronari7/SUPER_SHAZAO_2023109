import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Map<String, String>> _explanations = [
    {
      'header': 'Hello',
      'body':
          'Welcome to SuperShazão! We\'re excited to have you here. Get ready to dive into a unique musical experience!'
    },
    {
      'header': 'What is SuperShazão',
      'body':
          'In SuperShazão, you\'ll find a powerful tool to explore the musical universe. With the touch of a button, you can identify songs, discover new artists, and immerse yourself in a world of melodies and rhythms.'
    },
    {
      'header': 'Let\'s Start!',
      'body':
          'Now, without further ado, let\'s begin exploring the vast world of sounds that SuperShazão has to offer.'
    },
  ];

  int _currentPage = 0;

  void nextPage() {
    setState(() {
      if (_currentPage < _explanations.length - 1) {
        _currentPage++;
      }
    });
  }

  void previousPage() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
          itemCount: _explanations.length,
          itemBuilder: (context, index) {
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
                        mainAxisAlignment: MainAxisAlignment.start, // Align to the top
                        children: [
                          Container(
                            height: 100, // Fixed height for both header and body
                            alignment: Alignment.center,
                            child: Text(
                              _explanations[index]['header']!,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu', // Use Ubuntu font
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 8),
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
                          const SizedBox(height: 16), // Increase bottom padding here
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20), // Padding on sides
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                _explanations[index]['body']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22,
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
                      _explanations.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? const Color(0xFFFFAA00) : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}
