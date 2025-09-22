class Mood {
  final DateTime date;
  final String emoji;
  final String note;

  Mood({required this.date, required this.emoji, required this.note});

  Map<String, dynamic> toMap() {
    return {"date": date.toIso8601String(), "emoji": emoji, "note": note};
  }

  factory Mood.fromMap(Map<String, dynamic> map) {
    return Mood(
      date: DateTime.parse(map["date"]),
      emoji: map["emoji"],
      note: map["note"],
    );
  }
}
