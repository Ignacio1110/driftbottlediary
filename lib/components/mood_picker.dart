import 'package:driftbottlediary/diary_theme.dart';
import 'package:driftbottlediary/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Mood {
  love,
  happy,
  neutral,
  sad,
  angry;

  IconData getMoodIcon() {
    switch (this) {
      case Mood.love:
        return FontAwesomeIcons.faceGrinHearts;
      case Mood.happy:
        return FontAwesomeIcons.faceLaugh;
      case Mood.neutral:
        return FontAwesomeIcons.faceMeh;
      case Mood.sad:
        return FontAwesomeIcons.faceSadTear;
      case Mood.angry:
        return FontAwesomeIcons.faceAngry;

      default:
        throw Exception('Unknown mood: $this');
    }
  }
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
            _buildMoodButton(Mood.angry),
            _buildMoodButton(Mood.sad),
            _buildMoodButton(Mood.neutral),
            _buildMoodButton(Mood.happy),
            _buildMoodButton(Mood.love),
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
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(4),
          backgroundColor:
              selectedMood == mood ? DiaryTheme.kPrimary : DiaryTheme.kColor3,
        ),
        child: FaIcon(
          mood.getMoodIcon(),
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
