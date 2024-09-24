import 'package:flutter/material.dart';
import 'score_screen.dart';

class QuizScreen extends StatefulWidget {
  final String name;

  QuizScreen({required this.name});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is 5 + 7?',
      'choices': ['10', '11', '12', '13'],
      'answer': '12',
    },
    {
      'question': 'What is 15 - 9?',
      'choices': ['4', '5', '6', '7'],
      'answer': '6',
    },
    {
      'question': 'What is the largest country in the world?',
      'choices': ['Canada', 'Russia', 'China', 'USA'],
      'answer': 'Russia',
    },
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= _questions.length) {

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ScoreScreen(name: widget.name, score: _score),
        ),
      );
    }
  }

  void _selectAnswer(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }

  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= _questions.length) {
      return Container();
    }

    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              alignment: Alignment.center,
              color: Color(0xFF848482),
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                'QUIZ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),

            Image.asset('images/quiz.png', height: 150),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color(0xFF8bca84),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text(
                          '${_currentQuestionIndex + 1}/${_questions.length}',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      question['question'],
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    ...question['choices'].map((choice) {
                      return GestureDetector(
                        onTap: () => _selectAnswer(choice),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF8bca84), width: 2),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            choice,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _nextQuestion();
                        },
                        child: Text('Next'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF757575),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
