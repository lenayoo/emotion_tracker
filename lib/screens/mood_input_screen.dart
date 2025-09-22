import 'package:flutter/material.dart';
import '../models/mood.dart';
import '../services/firestore_service.dart';
import 'mood_saved_screen.dart';

class EmotionHome extends StatefulWidget {
  const EmotionHome({super.key});

  @override
  State<EmotionHome> createState() => _EmotionHomeState();
}

class _EmotionHomeState extends State<EmotionHome> {
  String? _selectedEmotion;
  final TextEditingController _noteController = TextEditingController();

  void _saveMood() async {
    if (_selectedEmotion == null || _noteController.text.isEmpty) return;

    final mood = Mood(
      date: DateTime.now(),
      emoji: _selectedEmotion!,
      note: _noteController.text,
    );

    await FirestoreService().addMood(mood);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => const MoodSavedScreen(selectedEmoji: '', note: ''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_emotion.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.66, // 화면 2/3 너비
                child: TextField(
                  controller: _noteController,
                  textAlign: TextAlign.center, // 글자 가운데 정렬
                  decoration: const InputDecoration(
                    labelText: "오늘의 한 줄📝",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),

            // 저장 버튼 (위에 패딩 추가)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: _saveMood,
                child: const Text("저장"),
              ),
            ),
            if (_selectedEmotion != null) Text("選択された感情: $_selectedEmotion"),
          ],
        ),
      ),
    );
  }
}
