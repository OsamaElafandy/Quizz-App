import 'package:quizzapp/question.dart';

class QuizzBrain {
  int questionNumber = 0;

  List<Question> questionBank = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs',
        questionAnswer: false),
    Question(
        questionText: 'Approximately one quarter of human bones are in feet.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green', questionAnswer: true),
    Question(questionText: 'We Will won this time', questionAnswer: false),
    Question(
        questionText: 'Good Game is quarter of human bones are in feet.',
        questionAnswer: true),
    Question(questionText: 'Flutter is the best ever', questionAnswer: true),
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs',
        questionAnswer: false),
    Question(
        questionText: 'Abou Treka is the best player in the world.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green', questionAnswer: true),
  ];

  String getQuestionText() {
    return questionBank[questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return questionBank[questionNumber].questionAnswer;
  }
}
