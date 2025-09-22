import 'package:flutter/material.dart';

class MoodSavedScreen extends StatelessWidget {
  final String selectedEmoji;
  final String note;

  const MoodSavedScreen({
    super.key,
    required this.selectedEmoji,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("저장 완료")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("오늘의 기분을 입력했습니다"),
            Text("이모지: $selectedEmoji", style: const TextStyle(fontSize: 40)),
            Text("메모: $note"),
            ElevatedButton(
              onPressed: () {
                // 달력 화면으로 이동할 수 있음
              },
              child: const Text("달력 보기"),
            ),
          ],
        ),
      ),
    );
  }
}
