import 'package:flutter/material.dart';
import 'package:quizzapp/quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz',
      debugShowCheckedModeBanner: false,
      home: QuizzPage(),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Icon> scoreKeeper = [];

  void checkQnswer(bool userPickedAnswer) {
    bool correctanser = quizzBrain.getQuestionAnswer();

    setState(() {
      if (userPickedAnswer == correctanser) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (quizzBrain.questionNumber < quizzBrain.questionBank.length - 1) {
        quizzBrain.questionNumber++;
      } else {
        alertCkeck(context);
        quizzBrain.questionNumber = 0;
        scoreKeeper.clear();
      }
    });
  }

  alertCkeck(BuildContext context) {
    Alert(
      context: context,
      title: "We Finsh It!",
      desc: "Good Luck To Next Questions.",
    ).show();
  }

  QuizzBrain quizzBrain = QuizzBrain();

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      key: _globalKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        quizzBrain.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      checkQnswer(true);
                    },
                    child: Text(
                      'True',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      checkQnswer(false);
                    },
                    child: Text(
                      'False',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
              )),
              Expanded(
                  child: Row(
                children: scoreKeeper,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
