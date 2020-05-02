import 'package:flutter/cupertino.dart';
import 'package:quizzapp/Questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Questions> _questionBank = [
    Questions(
        questions:
            'The sport saved from extinction by President Theodore Roosevelt was football',
        answers: true),
    Questions(
        questions: 'ubai is home to the tallest man-made structure ever built',
        answers: true),
    Questions(
        questions:
            'In her novel The Fountainhead, Ayn Rand promoted the virtues of communal efforts over individualism.',
        answers: false),
    Questions(
        questions:
            'The bear has caused more human deaths than any other mammal in history.',
        answers: false),
    Questions(
        questions: 'The highest-grossing film series in history is Star Wars.',
        answers: false),
    Questions(
        questions: 'An acute angle is less than 90 degrees', answers: true),
    Questions(
        questions:
            'Oxygen makes up two-thirds of Earth and also two-thirds of the human body.',
        answers: false),
    Questions(
        questions: 'Napoleon Bonaparte was killed at the Battle of Waterloo.',
        answers: false),
    Questions(
        questions:
            'E Pluribus Unum, on the seal of the United States, means one, out of many.',
        answers: true),
    Questions(
        questions:
            'Apartheid was the political system dismantled in South Africa at the end of the 20th century.',
        answers: true),
  ];
  incQno() {
    if (_questionNumber < _questionBank.length - 1) _questionNumber++;
  }

  getQuestion() {
    return _questionBank[_questionNumber].questions;
  }

  getAnswer() {
    return _questionBank[_questionNumber].answers;
  }

  isFinished() {
    if (_questionNumber == _questionBank.length - 1)
      return true;
    else
      return false;
  }

  reset() {
    _questionNumber = 0;
  }
}
