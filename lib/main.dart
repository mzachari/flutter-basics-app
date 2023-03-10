import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Cat', 'Dog', 'Rabbit', 'Snake']
      },
      {
        'questionText': 'Who is your favourite instructor?',
        'answers': ['Max', 'Jeevan', 'Luke', 'Rob']
      },
    ];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
            ),
            body: Column(
              children: [
                Question(questions[_questionIndex]['questionText']),
                ...(questions[_questionIndex]['answers'] as List<String>)
                    .map((answer) => Answer(_answerQuestion, answer))
                    .toList()
              ],
            )));
  }
}
