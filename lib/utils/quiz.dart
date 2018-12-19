import './question.dart';

class Quiz {
  List<Question> _questionList;
  int _currentQueIndex = -1;
  int _score = 0;

  Quiz(this._questionList) {
    _questionList.shuffle();
  }

  List<Question> get questions => _questionList;
  int get length => _questionList.length;
  int get questionNumber => _currentQueIndex+1;
  int get score => _score;

  Question get nextQuestion {
    _currentQueIndex++;
    if(_currentQueIndex >= length) return null;
    return _questionList[_currentQueIndex];
  }

  void answer(bool isCorrect) {
    if(isCorrect) _score++;
  }
  
}