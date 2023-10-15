import 'package:driftbottlediary/shared_module/diary_database.dart';
import 'package:json_annotation/json_annotation.dart';
import '../components/mood_picker.dart';

part 'diary_model.g.dart';

@JsonSerializable()
class Diary {
  @JsonKey(name: DiaryFields.id)
  int? id;

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

  @JsonKey(name: DiaryFields.date, toJson:dateTimeToEpoch,fromJson: dateTimeFromEpochOrString)
  final DateTime date;

  @JsonKey(name: DiaryFields.uploaded)
  int uploaded = 0;

  Diary({
    this.id,
    required this.feelingLevel,
    required this.title,
    required this.content,
    required this.date,
    required this.uploaded,
  });

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryToJson(this);

  Diary copyWith({
    int? id,
    Mood? feelingLevel,
    String? title,
    String? content,
    DateTime? date,
    int? uploaded,
  }) {
    return Diary(
      id: id ?? this.id,
      feelingLevel: feelingLevel ?? this.feelingLevel,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      uploaded: uploaded ?? this.uploaded,
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
        uploaded: 0,
      ),
      Diary(
        feelingLevel: Mood.neutral,
        title: 'Second Diary',
        content:
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        date: DateTime.now().add(Duration(days: -1)),
        uploaded: 0,
      ),
      Diary(
        feelingLevel: Mood.happy,
        title: 'First Diary',
        content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        date: DateTime.now(),
        uploaded: 0,
      ),
    ];
    return _diaries;
  }
}

//將日期轉換為時間戳
int dateTimeToEpoch(DateTime dateTime) {
  return dateTime.microsecondsSinceEpoch;
}

//將時間戳或ISO String轉為日期
DateTime dateTimeFromEpochOrString(dynamic dateTime) {
  if (dateTime is int) {
    return DateTime.fromMicrosecondsSinceEpoch(dateTime);
  }
  return DateTime.tryParse(dateTime)!;
}
