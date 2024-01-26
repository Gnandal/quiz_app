import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  var currentScreen = 'start-screen';

  final List<String> selectedAnswer = [];

  void answerQuestion(String answer) {
    selectedAnswer.add(answer);

    if(selectedAnswer.length == questions.length){
      setState(() {
        currentScreen = 'result-screen';
      });
    }
    else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  startQuiz(){
    setState(() {
      currentScreen = 'quiz-screen';
    });
  }

  reStart(){
    setState(() {
      currentScreen = 'home-screen';
      currentQuestionIndex = 0;
      selectedAnswer.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    Widget currentScreenWidget = HomeScreen(startQuiz);

    if(currentScreen == 'quiz-screen') {
      currentScreenWidget = QuestionScreen(currentQuestion, answerQuestion);
    }

    if(currentScreen == 'result-screen') {
      currentScreenWidget = ResultScreen(reStart, selectedAnswer);
    }

    return MaterialApp(
      home: currentScreenWidget,
    );
  }
}
