import 'package:driftbottlediary/shared_module/diary_database.dart';
import 'package:json_annotation/json_annotation.dart';
import '../components/mood_picker.dart';

part 'diary_model.g.dart';

@JsonSerializable()
class Diary {
  @JsonKey(name: DiaryFields.id)
  final int? id;

  ///1: Very unhappy
  ///2: Somewhat unhappy
  ///3: Neutral
  ///4: Somewhat happy
  ///5: Very happy
  @JsonKey(name: DiaryFields.feelingLevel)
  final Mood feelingLevel;

  ///max length 30 or 50
  @JsonKey(name: DiaryFields.title)
  final String title;

  ///show only to poster or some friend
  @JsonKey(name: DiaryFields.content)
  final String content;

  @JsonKey(name: DiaryFields.date)
  final DateTime date;

  Diary(
      {this.id,
      required this.feelingLevel,
      required this.title,
      required this.content,
      required this.date});

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);
  Map<String, dynamic> toJson() => _$DiaryToJson(this);

  Diary copyWith({
    int? id,
    Mood? feelingLevel,
    String? title,
    String? content,
    DateTime? date,
  }) {
    return Diary(
      id: id ?? this.id,
      feelingLevel: feelingLevel ?? this.feelingLevel,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  static List<Diary> getSampleData() {
    List<Diary> _diaries = [
      Diary(
        feelingLevel: Mood.happy,
        title: 'Third Diary',
        content:
            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
        date: DateTime.now().add(Duration(days: -2)),
      ),
      Diary(
        feelingLevel: Mood.neutral,
        title: 'Second Diary',
        content:
            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        date: DateTime.now().add(Duration(days: -1)),
      ),
      Diary(
        feelingLevel: Mood.happy,
        title: 'First Diary',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        date: DateTime.now(),
      ),
    ];
    return _diaries;
  }
}
