import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/mood.dart';

class FirestoreService {
  final CollectionReference moods = FirebaseFirestore.instance.collection(
    'moods',
  );

  Future<void> addMood(Mood mood) async {
    await moods
        .doc(mood.date.toIso8601String().substring(0, 10))
        .set(mood.toMap());
  }

  Future<Mood?> getMood(DateTime date) async {
    final doc = await moods.doc(date.toIso8601String().substring(0, 10)).get();
    if (doc.exists) {
      return Mood.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}
