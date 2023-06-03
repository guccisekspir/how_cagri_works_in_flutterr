// ignore_for_file: prefer-trailing-comma

import 'package:flutter_test/flutter_test.dart';
import 'package:how_cagri_work_on_flutter/extensions/date_time_extension.dart';

void main() {
  final dateTime = DateTime(2000, 10, 10, 19, 35);

  group('formatted12HourString', () {
    test('$dateTime', () {
      expect(dateTime.formatted12HourString, '07:35 PM');
    });
  });

  group('yMd', () {
    test('$dateTime', () {
      expect(dateTime.yMd(), '10/10/2000');
    });
  });

  group('yMMMd', () {
    test('$dateTime', () {
      expect(dateTime.yMMMd(), 'Oct 10, 2000');
    });
  });

  group('yMMMMd', () {
    test('$dateTime', () {
      expect(dateTime.yMMMMd(), 'October 10, 2000');
    });
  });

  group('dMMMYYYY', () {
    test('$dateTime', () {
      expect(dateTime.dMMMYYYY(), '10 Oct 2000');
    });
  });

  group('dMMMEEEE', () {
    test('$dateTime', () {
      expect(dateTime.dMMMEEEE(), '10 Oct, Tuesday');
    });
  });

  group('mMMMEEEEd', () {
    test('$dateTime', () {
      expect(dateTime.mMMMEEEEd(), 'Tuesday, October 10');
    });
  });

  group('yMMMEEEEdd', () {
    test('$dateTime', () {
      expect(dateTime.yMMMEEEEdd(), '10 Oct Tuesday 2000');
    });
  });

  group('yMMMMEEEEd', () {
    test('$dateTime', () {
      expect(dateTime.yMMMMEEEEd(), 'Tuesday, October 10, 2000');
    });
  });

  group('eEE', () {
    test('$dateTime', () {
      expect(dateTime.eEE(), 'Tue');
    });
  });

  group('formatTime', () {
    test('$dateTime', () {
      expect(dateTime.formatTime(), '7:35 PM');
    });
  });

  group('isSameDay', () {
    test('$dateTime', () {
      expect(
        dateTime.isSameDay(
          DateTime(dateTime.year, dateTime.month, dateTime.day),
        ),
        true,
      );
      expect(
        dateTime.isSameDay(
          DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 10),
        ),
        true,
      );
      expect(
        dateTime.isSameDay(
          DateTime(dateTime.year, dateTime.month, dateTime.day + 1),
        ),
        false,
      );
    });
  });

  group('isCurrantDay', () {
    test('$dateTime', () {
      expect(dateTime.isCurrantDay(), false);
      expect(DateTime.now().isCurrantDay(), true);
    });
  });

  group('parseStringToLocal', () {
    test('${dateTime.toUtc()}', () {
      expect(
        DateTimeExt.parseStringToLocal(dateTime.toUtc().toString()),
        dateTime,
      );
    });
  });
}
