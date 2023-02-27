import 'package:driftbottlediary/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Mood {
  happy,
  sad,
  angry,
  neutral,
}

class MoodPicker extends StatelessWidget {
  const MoodPicker({super.key, required this.selectedMood, this.onChange});

  final Mood selectedMood;
  final void Function(Mood)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DiaryTranslations.mood_question.tr,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMoodButton(Mood.happy),
            _buildMoodButton(Mood.sad),
            _buildMoodButton(Mood.angry),
            _buildMoodButton(Mood.neutral),
          ],
        ),
      ],
    );
  }

  Widget _buildMoodButton(Mood mood) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (onChange != null) {
            onChange!(mood);
          }
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(4),
          backgroundColor: selectedMood == mood ? Colors.blue : Colors.grey,
        ),
        child: Icon(
          _getMoodIcon(mood),
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  IconData _getMoodIcon(Mood mood) {
    switch (mood) {
      case Mood.happy:
        return Icons.mood;
      case Mood.sad:
        return Icons.mood_bad;
      case Mood.angry:
        return Icons.sentiment_very_dissatisfied;
      case Mood.neutral:
        return Icons.sentiment_satisfied;
      default:
        throw Exception('Unknown mood: $mood');
    }
  }
}
