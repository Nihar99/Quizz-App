import 'package:flutter/material.dart';
import 'package:quizzapp/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(quizapp());

class quizapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var alertStyle1 = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(color: Colors.green),
  );
  var alertStyle2 = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(color: Colors.red),
  );
  int score_count = 0;
  alertBox() {
    if (score_count >= 6) {
      return Alert(
        context: context,
        style: alertStyle1,
        type: AlertType.success,
        title: "YOU PASSED",
        desc: "The Quiz Has Ended.",
        buttons: [
          DialogButton(
            child: Text(
              "RESET",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                quizBrain.reset();
                scores.clear();
                score_count = 0;
                Navigator.pop(context);
              });
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      return Alert(
        style: alertStyle2,
        context: context,
        type: AlertType.error,
        title: "YOU FAILED",
        desc: "The Quiz Has Ended.",
        buttons: [
          DialogButton(
            child: Text(
              "RESET",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                quizBrain.reset();
                scores.clear();
                score_count = 0;
                Navigator.pop(context);
              });
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  QuizBrain quizBrain = new QuizBrain();
  List<Container> scores = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  if (quizBrain.isFinished()) {
                    alertBox();
                  }
                });

                if (quizBrain.getAnswer() == true) {
                  scores.add(
                    Container(
                      child: Icon(
                        Icons.done,
                        color: Colors.green,
                      ),
                    ),
                  );

                  setState(() {
                    score_count++;
                  });

                  print(score_count);
                } else
                  scores.add(
                    Container(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  );
                setState(() {
                  quizBrain.incQno();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  if (quizBrain.isFinished()) {
                    alertBox();
                  }
                });

                if (quizBrain.getAnswer() == false) {
                  scores.add(
                    Container(
                      child: Icon(
                        Icons.done,
                        color: Colors.green,
                      ),
                    ),
                  );

                  setState(() {
                    score_count++;
                  });

                  print(score_count);
                } else
                  scores.add(
                    Container(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  );
                setState(() {
                  quizBrain.incQno();
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scores,
        )
      ],
    );
  }
}
