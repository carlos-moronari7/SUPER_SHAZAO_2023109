import 'package:flutter/material.dart';
import 'explanation_pages.dart';

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
      'header': 'Welcome! ',
      'body':
          'Welcome to SuperShazão! We\'re excited to have you here. Get ready to dive into a unique musical experience!'
    },
    {
      'header': 'What is Super Shazão? ',
      'body':
          'In Super Shazão, with the touch of a button, you can identify songs and discover new artists.'
    },
    {
      'header': 'Let\'s Start! ',
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
            return ExplanationPage(
              header: _explanations[index]['header']!,
              body: _explanations[index]['body']!,
              currentPage: _currentPage,
              pageIndex: index,
              explanations: _explanations,
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
