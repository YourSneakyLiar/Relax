import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100], // Нежно-зеленый фон
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: TextStyle(fontWeight: FontWeight.bold), // Жирный текст
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Настройки звука',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Планируется исправить в будущем. '
                  'На данный момент Flutter не поддерживает полноценную работу со звуком',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: 0.5, // Значение по умолчанию
              onChanged: (double value) {
                // Здесь вы можете обновить значение громкости
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Вернуться на главный экран'),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[100], // Нежно-желтая кнопка
              ),
            ),
            IconButton(
              icon: Icon(Icons.link),
              onPressed: () async {
                const url = 'https://vk.com/thisisjustalongaddress';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Не удалось открыть $url'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}