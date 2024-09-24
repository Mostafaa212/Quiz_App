import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final String name;
  final int score;

  ScoreScreen({required this.name, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz Completed')),
      body: Container(
        color: Color(0xFF848482),
        child: Center(
          child: Container(
            width: 360,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFFBFC1C2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color(0xFF8bca84),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Congratulations!!!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '$name, your score is $score',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text('Finish'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8bca84),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
