import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class FirstGame extends StatefulWidget {
  @override
  _FirstGameState createState() => _FirstGameState();
}

FlutterSoundPlayer player = FlutterSoundPlayer();

class _FirstGameState extends State<FirstGame> {
  Random random = Random();
  int score = 0;
  List<Bubble> bubbles = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      bubbles.add(Bubble(random.nextInt(400), random.nextInt(400)));
      player.openAudioSession();
    }
  }

  void _popBubble(int index) {
    player.startPlayer(fromURI: 'assets/1539613085');
    setState(() {
      bubbles[index] = Bubble(random.nextInt(400), random.nextInt(400));
      // Заменяем лопнувший пузырик новым
      score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пузырики'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Score: $score')),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink[100]!, Colors.blue[100]!],
          ),
        ),
        child: Stack(
          children: bubbles.map((bubble) {
            return Positioned(
              left: bubble.x.toDouble(),
              top: bubble.y.toDouble(),
              child: GestureDetector(
                onTap: () => _popBubble(bubbles.indexOf(bubble)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple,
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Back to Main',
        child: Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Bubble {
  final int x;
  final int y;

  Bubble(this.x, this.y);
}