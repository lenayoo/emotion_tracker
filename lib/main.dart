import 'package:flutter/material.dart';

void main() {
  runApp(const EmotionApp());
}

class EmotionApp extends StatelessWidget {
  const EmotionApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotion Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const EmotionHome(title: '感情トラッカー🌳🪐🤍🎐🫧'),
    );
  }
}

class EmotionHome extends StatefulWidget {
  const EmotionHome({super.key, required this.title});

  final String title;

  @override
  State<EmotionHome> createState() => _EmotionHomeState();
}

class _EmotionHomeState extends State<EmotionHome> {
  String? _selectedEmotion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("今日の感情"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("今日の感情を選択してください！"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                ['😆', '😊', '😐', '😢'].map((emoji) {
                  return IconButton(
                    onPressed: () {
                      setState(() => _selectedEmotion = emoji);
                    },
                    icon: Text(emoji, style: const TextStyle(fontSize: 32)),
                  );
                }).toList(),
          ),
          if (_selectedEmotion != null) Text("選択された感情: $_selectedEmotion"),
        ],
      ),
    );
  }
}
