import 'questions_bank.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Questions> _questionBank = [
    Questions(
        q: 'The normal body weight of a human is between 18.5 to 25', a: true),
    Questions(q: 'Ibadan is the largest city in africa', a: true),
    Questions(q: 'Qing Dynasty Warriors are from Japanese empire', a: false),
    Questions(q: 'Korea war started in 1945', a: true),
    Questions(
        q: 'Third mainland bridge is the longest in west africa', a: true),
    Questions(
        q: 'If it take\'s 1 egg to boiled for 3 minute, then 10 eggs with takes 30 minutes',
        a: false),
    Questions(q: 'The coldest country is Australian', a: false),
    Questions(q: 'World Bank is located in Switzerland', a: true),
    Questions(
        q: 'Ghanian  1 cedi is now equal to Nigeria 61.22 naira.', a: true),
    Questions(
        q: 'Togo, Chad, Cameroon, Ninja, Mali are close to Nigeria Border, except Ghana',
        a: true),
    Questions(q: 'Mandela is one of the best Africa Presidents', a: true),
    Questions(q: 'You can lead a Cow down stair but not up', a: true),
    Questions(q: 'USSR was dismantled during the WW1', a: false),
    Questions(
        q: 'The name of the atomic bomb that was dispose in Hiroshima and Nagasaki was called Baby Boy',
        a: true),
    Questions(
        q: 'Aldof Hitler salutation was banned and cancel in Football Games',
        a: true),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].quizQuestion;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].quizAnswer;
  }

  void getQuestionNumber() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
