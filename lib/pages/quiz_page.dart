import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/true_false.dart';
import '../ui/questions.dart';
import '../ui/result_overlay.dart';
import './result_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("There are 8 main characters in Friends",false),
    new Question("Joey's stuffed penguin's name is Hugsy",true),
    new Question("Phoebe carried 3 babies for her brother?", true),
    new Question("Ross and Rachel gets married and have baby", true),
    new Question("Joey has 6 sister?", false)

  ]);
  String currentQue;
  int questionNum;
  bool isCorrectFlag;
  bool screenOverlay = false;
  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    currentQue = currentQuestion.question;
    questionNum = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrectFlag = (currentQuestion.answer == answer);
    quiz.answer(isCorrectFlag);
    this.setState(() {
      screenOverlay = true; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand ,
      children: <Widget>[
        new Column( //this is our main page
          children: <Widget>[
            new TrueFalseAnswer(true, () => handleAnswer(true)),
            new Questions(currentQue, questionNum),
            new TrueFalseAnswer(false,() => handleAnswer(false)),
          ],
        ),
        screenOverlay == true ? new ResultOverlay(
          isCorrectFlag,
          () {
            if (quiz.length == questionNum) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ResultPage(quiz.score, quiz.length)), (Route route)=>route==null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              screenOverlay = false;
              currentQue  = currentQuestion.question ;
              questionNum = quiz.questionNumber;
            });
          }
          ) : new Container()
      ],
    );
  }

}