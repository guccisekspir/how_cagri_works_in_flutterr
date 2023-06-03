import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

extension DateTimeExt on DateTime {
  /// Returns time from DateTime in 12H format (19:35 =>  07:35 PM)
  String get formatted12HourString {
    final time = TimeOfDay.fromDateTime(this);
    final buffer = StringBuffer();
    final hours12hFormat = time.hour - time.periodOffset;
    final hoursStr =
        hours12hFormat < 10 ? '0$hours12hFormat' : hours12hFormat.toString();
    final minutesStr =
        time.minute < 10 ? '0${time.minute}' : time.minute.toString();
    final periodStr = describeEnum(time.period.toString().toUpperCase());
    buffer.writeAll([
      hoursStr,
      ':',
      minutesStr,
      ' ',
      periodStr,
    ]);

    return buffer.toString();
  }

  Duration get time => Duration(hours: hour, minutes: minute);

  String yMd() => DateFormat.yMd(Intl.systemLocale).format(this);

  String yMMMd() => DateFormat.yMMMd(Intl.systemLocale).format(this);

  String mMMMEEEEd() => DateFormat.MMMMEEEEd(Intl.systemLocale).format(this);

  String yMMMMd() => DateFormat.yMMMMd(Intl.systemLocale).format(this);

  String yMMMMEEEEd() => DateFormat.yMMMMEEEEd(Intl.systemLocale).format(this);

  String format(String pattern) =>
      DateFormat(pattern, Intl.systemLocale).format(this);

  String formatTime() => DateFormat.jm(Intl.systemLocale).format(this);

  /// on 13:00 return 1pm
  ///
  /// on 13:30 return 1:30pm
  String formatTimeCompact() => DateFormat(
        minute == 0 ? 'ha' : 'h:mma',
        Intl.systemLocale,
      ).format(this).toLowerCase();

  String formatTime24() => DateFormat.Hm(Intl.systemLocale).format(this);

  String yMMMEEEEdd() => DateFormat(
        'd MMM EEEE y',
        Intl.systemLocale,
      ).format(this);

  bool isSameDay(DateTime date) =>
      year == date.year && month == date.month && day == date.day;

  bool isCurrantDay() {
    final current = DateTime.now();

    return current.year == year && current.month == month && current.day == day;
  }

  String toUtcInIso8601String() => toUtc().toIso8601String();

  static DateTime? parseStringToLocal(String date) =>
      DateTime.tryParse(date)?.toLocal();

  String dMMMYYYY() => DateFormat(
        'd MMM y',
        Intl.systemLocale,
      ).format(this);

  String d() => DateFormat(
        'dd',
        Intl.systemLocale,
      ).format(this);

  String eEE() => DateFormat(
        'EEE',
        Intl.systemLocale,
      ).format(this);

  String ee() => eEE().substring(0, 2);

  String dMMMEEEE() => DateFormat(
        'd MMM, EEEE',
        Intl.systemLocale,
      ).format(this);

  String mMMdo() => Jiffy.now().format(pattern: 'MMM do');

  String mMMMdo() => Jiffy.now().format(pattern: 'MMMM do');

  String mMMd() => Jiffy.now().format(pattern: 'MMM d');

  String eEEEMMMdo() => Jiffy.now().format(pattern: 'EEEE, MMM do');

  String mMMMdoY() => Jiffy.now().format(pattern: 'MMMM do, y');

  String mMMM() => Jiffy.now().MMMM;

  String mMMMy() => Jiffy.now().format(pattern: 'MMMM, y');

  String MMMM() => Jiffy.now().format(pattern: 'MMMM');

  String y() => Jiffy.now().format(pattern: 'y');

  // ignore: prefer-trailing-comma
  DateTime copyDateInUtc() => DateTime.utc(year, month, day);
}

extension JiffyExt on Jiffy {
  /// Fixed version of [endOf] for [Units.WEEK]
  ///
  /// Fix daylight saving offset
  Jiffy _endOfWeek() {
    final end = Jiffy.now().endOf(Unit.week);
    final diff = end.year == year
        ? end.dayOfYear - dayOfYear
        : end.date + daysInMonth - date;
    final delta = DateTime.daysPerWeek - 1 - diff;

    return end.add(days: delta);
  }

  Jiffy lastDayOf(Unit units) {
    if (units == Unit.week) {
      return _endOfWeek();
    }

    return endOf(units);
  }
}
