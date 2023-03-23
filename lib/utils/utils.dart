import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

String getTimeAgoString(DateTime time) {
  return timeago.format(
    time,
    locale: Get.locale?.toLanguageTag(),
  );
}

/// English Messages
class ZHMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '前';
  @override
  String suffixFromNow() => '現在';
  @override
  String lessThanOneMinute(int seconds) => '幾秒';
  @override
  String aboutAMinute(int minutes) => '大約一分鐘';
  @override
  String minutes(int minutes) => '$minutes 分鐘';
  @override
  String aboutAnHour(int minutes) => '大約一小時';
  @override
  String hours(int hours) => '$hours 小時';
  @override
  String aDay(int hours) => '一天';
  @override
  String days(int days) => '$days 天';
  @override
  String aboutAMonth(int days) => '大約一個月';
  @override
  String months(int months) => '$months 月';
  @override
  String aboutAYear(int year) => '大約一年';
  @override
  String years(int years) => '$years 年';
  @override
  String wordSeparator() => '';
}
