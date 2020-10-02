import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score=0;
  var quiz = [
    {
      "title": 'Who Created Dart ?',
      'answers': [
        {"answer": 'FACEBOOK', 'correct': false},
        {'answer': 'GOOGLE', 'correct': true},
        {'answer': 'MICROSOFT', 'correct': false},
      ]
    },
    {
      "title": 'When was the stable version of Flutter released ?',
      'answers': [
        {"answer": 'June 2019', 'correct': false},
        {'answer': 'October 2019', 'correct': false},
        {'answer': 'December 2019', 'correct': true},
      ]
    },
    {
      "title": 'What is pubspec.yaml file ?',
      'answers': [
        {"answer": "It is the project's configuration file", 'correct': true},
        {'answer': "It is the project's main file", 'correct': false},
        {'answer': "It is the project's storage file", 'correct': false},
      ]
    },
    {
      "title": 'Which apps that use Flutter ?',
      'answers': [
        {"answer": "FaceBook", 'correct': false},
        {'answer': "Google Ads", 'correct': true},
        {'answer': "YouTube", 'correct': false},
      ]
    },
    {
      "title": 'How many types of widgets available in flutter ?',
      'answers': [
        {"answer": "1 Type", 'correct': false},
        {'answer': "2 Types", 'correct': true},
        {'answer': "3 Types", 'correct': false},
      ]
    },
    {
      "title": 'List the companies who using Flutter ?',
      'answers': [
        {"answer": "MicroSoft", 'correct': false},
        {'answer': "Google", 'correct': true},
        {'answer': "RockStar", 'correct': false},
      ]
    },
    {
      "title": 'What command using to create a new flutter project ?',
      'answers': [
        {"answer": "flutter add Project_Name", 'correct': false},
        {'answer': "flutter start Project_Name", 'correct': false},
        {'answer': "flutter create Project_Name", 'correct': true},
      ]
    },
    {
      "title": ' What language flutter is based ?',
      'answers': [
        {"answer": "Dart", 'correct': true},
        {'answer': "JavaScript", 'correct': false},
        {'answer': "C#", 'correct': false},
      ]
    },{
      "title": ' Which IDE supported by flutter ?',
      'answers': [
        {"answer": "Visual Studio", 'correct': false},
        {'answer': "android studio", 'correct': true},
        {'answer': "Eclipse", 'correct': false},
      ]
    },{
      "title": 'Is flutter hot reload ?',
      'answers': [
        {"answer": "Yes", 'correct': true},
        {'answer': "No", 'correct': false},
       ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
        ),
        body:
        (this.currentQuestion>=quiz.length)?
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Score:  ${(100*score/quiz.length).round()} %',
                    style: TextStyle(fontSize: 25,color: Colors.blueAccent),
                  ),
                  RaisedButton(
                    onPressed: (){
                      setState(() {
                        this.currentQuestion=0;
                        this.score=0;
                      });
                    },
                    color: Colors.green,
                    child: Text("Restart...",style: TextStyle(fontSize: 22),),
                    textColor: Colors.white,
                  )
                ],
              )
            )

        :ListView(
          children: <Widget>[
            ListTile(
              title: Center(
                  child: Text('Question ${currentQuestion + 1}/${quiz.length}',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold))),
            ),
            ListTile(
              title: Text(
                quiz[currentQuestion]['title'],
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
             ...(quiz[currentQuestion]['answers'] as List<Map<String, Object>>)
                .map((answer) {
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        if(answer['correct']==true) {
                          ++score;
                        }
                         ++currentQuestion;
                      });
                    },
                    child: Text(answer['answer'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900) ),
                  ),
                ),
              );
            })
          ],
        ));
  }
}
