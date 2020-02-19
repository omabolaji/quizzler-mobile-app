import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
import 'package:flutter/services.dart';

Future main() async {
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    Quizzler(),
  );
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0x2ff2323),
        primaryColor: Colors.blueGrey.shade900,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('QUIZZLER')),
        ),
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
  List<Widget> scoreKepper = [];

  void getUserAnswers(bool userAnswers) {
    bool answers = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: 'Finished!',
          desc: "Thanks for taking this Quiz with Quizzler App.",
          buttons: [
            DialogButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            )
          ],
        ).show();

        quizBrain.reset();

        scoreKepper = [];
      } else {
        if (answers == userAnswers) {
          scoreKepper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKepper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.getQuestionNumber();
      }
    });
  }

  QuizBrain quizBrain = QuizBrain();

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
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
//                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        AnswerButton(
          colour: Colors.green,
          label: Text('True'),
          onPressed: () {
            getUserAnswers(true);
          },
        ),
        AnswerButton(
          colour: Colors.red,
          label: Text('False'),
          onPressed: () {
            getUserAnswers(false);
          },
        ),
        Row(
          children: scoreKepper,
        )
      ],
    );
  }
}

class AnswerButton extends StatelessWidget {
  AnswerButton({
    @required this.colour,
    @required this.label,
    @required this.onPressed,
  });

  final Color colour;
  final Widget label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
//          flex: 2,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          color: colour,
          onPressed: onPressed,
          child: label,
        ),
      ),
    );
  }
}
