import 'package:flutter/material.dart';

class AlarmProvider with ChangeNotifier {
  List<Days> daysList = [
    Days("Sunday", false),
    Days("Monday", false),
    Days("Tuesday", false),
    Days("Wednesday", false),
    Days("Thursday", false),
    Days("Friday", false),
    Days("Saturday", false),
  ];
  List<Alarm> alarmList = [
    Alarm(
        "7:30",
        "Hello",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "8:30",
        "Wake up",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "6:30",
        "Good Morning",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "7:00",
        "hii",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "8:00",
        "tea time",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "5:30",
        "message",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
    Alarm(
        "6:00",
        "early morning",
        [
          Days("su", false),
          Days("mo", false),
          Days("tu", false),
          Days("we", false),
          Days("th", false),
          Days("fr", false),
          Days("sa", false),
        ],
        false),
  ];
}

class Alarm {
  final String? time;
  final String? text;
  bool? isChecked;
  final List<Days> dayList;

  Alarm(this.time, this.text, this.dayList, this.isChecked);
}

class Days {
  final String? day;
  bool? isClick;

  Days(this.day, this.isClick);
}
