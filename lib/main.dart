import 'package:flutter/material.dart';
import 'quiz_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  void _navigateToQuiz(BuildContext context) {
    String name = _nameController.text;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuizScreen(name: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF848482),
      appBar: AppBar(title: Text('Quiz App')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'QUIZ',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 15),
                Image.asset('images/quiz.png', height: 150),
                SizedBox(height: 20),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFBFC1C2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 40),
                          Text(
                            'Please enter your name',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Your Name',
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () => _navigateToQuiz(context),
                              child: Text('Submit'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF8bca84),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Color(0xFF8bca84),
                        child: Text(
                          'Welcome',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
