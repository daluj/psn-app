// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';

class AttendanceCalendar extends StatefulWidget {
  const AttendanceCalendar({
    super.key,
    this.width,
    this.height,
    required this.queryResults, // updated type
    required this.presentColor,
    required this.showWeekly,
  });

  final double? width;
  final double? height;
  final List<GetPersonAttendanceRow> queryResults; // your typed query result
  final Color presentColor;
  final bool showWeekly;

  @override
  State<AttendanceCalendar> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  late final List<DateTime> _presentDates;

  @override
  void initState() {
    super.initState();
    _calendarFormat =
        widget.showWeekly ? CalendarFormat.week : CalendarFormat.month;

    // Extract and parse date strings from the typed results
    _presentDates = widget.queryResults.map((row) {
      return DateTime.parse(row.date); // assuming `row.date` is a String
    }).toList();
  }

  bool _isPresent(DateTime day) {
    return _presentDates.any(
      (d) => d.year == day.year && d.month == day.month && d.day == day.day,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) => false, // Nothing is ever selected
      onDaySelected: null, // Disables selection
      startingDayOfWeek: StartingDayOfWeek.monday, // Start week on Monday
      calendarStyle: CalendarStyle(
        todayDecoration: const BoxDecoration(), // Remove highlight from today
        todayTextStyle: const TextStyle(
            color: Colors.black), // Make today's text same as others
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          final bool isPresent = _isPresent(day);
          return Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: isPresent ? widget.presentColor : null,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: isPresent ? Colors.white : Colors.black,
              ),
            ),
          );
        },
        todayBuilder: (context, day, focusedDay) {
          final bool isPresent = _isPresent(day);
          return Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: isPresent ? widget.presentColor : null,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: isPresent ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
