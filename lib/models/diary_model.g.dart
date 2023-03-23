// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diary _$DiaryFromJson(Map<String, dynamic> json) => Diary(
      id: json['_id'] as int?,
      feelingLevel: $enumDecode(_$MoodEnumMap, json['feeling_level']),
      title: json['title'] as String,
      content: json['content'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DiaryToJson(Diary instance) => <String, dynamic>{
      '_id': instance.id,
      'feeling_level': _$MoodEnumMap[instance.feelingLevel]!,
      'title': instance.title,
      'content': instance.content,
      'date': instance.date.toIso8601String(),
    };

const _$MoodEnumMap = {
  Mood.love: 'love',
  Mood.happy: 'happy',
  Mood.neutral: 'neutral',
  Mood.sad: 'sad',
  Mood.angry: 'angry',
};
