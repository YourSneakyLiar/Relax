import 'package:flutter/material.dart';
import 'package:relax_library/firstgame.dart';
import 'package:relax_library/secondgame.dart';
import 'package:relax_library/Repairs.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RelaxLibrary',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'RelaxLibrary'),
      routes: {
        // Добавьте здесь другие маршруты
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'RelaxLibrary',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstGame()));
              },
              child: Text('Пузырики'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[100], // background
                onPrimary: Colors.white, // foreground
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondGame()));
              },
              child: Text('Фигурки'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[100], // background
                onPrimary: Colors.white, // foreground
              ),
            ),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('Шушик'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[400], // background
                onPrimary: Colors.white, // foreground
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        },
        tooltip: 'Настройки',
        child: Icon(Icons.settings),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}