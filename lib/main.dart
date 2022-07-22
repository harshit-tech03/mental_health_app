import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'How many people do you meet today?',
      'answers': [
        {'text': '1 - 2', 'score': 10},
        {'text': '3 - 4', 'score': 8},
        {'text': '5 - 6', 'score': 5},
        {'text': '7 - 9', 'score': 4},
        {'text': '<=10', 'score': 1},
      ],
    },
    {
      'questionText': 'How happy do you feel today?',
      'answers': [
        {'text': 'Unhappy', 'score':10},
        {'text': 'Sad','score': 8},
        {'text': 'Neither happy nor sad', 'score': 5},
        {'text': 'Happy','score': 3},
        {'text': 'Joyful','score': 1},
      ],
    },
    {
      'questionText': 'How productive do you feel today?',
      'answers': [
        {'text': 'Least', 'score': 10},
        {'text': 'Less', 'score': 8},
        {'text': 'Normal', 'score': 5},
        {'text': 'Very', 'score': 3},
        {'text': 'Extreme', 'score': 1},

      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState((){
      _questionIndex =0;
      _totalScore =0;
    });

  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < _questions.length) {
      //print('We have more questions!');
    }
    //print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Mental Health Quiz'),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
