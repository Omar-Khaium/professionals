import 'package:flutter/material.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/utils/text_styles.dart';
import 'package:professionals/src/views/widgets/attendance/item_attendance.dart';
import 'package:professionals/src/views/widgets/attendance/widget_attendance_calendar.dart';
import 'package:provider/provider.dart';

class AttendanceRoute extends StatelessWidget {
  final String route = "/attendance";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      appBar: AppBar(
        backgroundColor: themeProvider.backgroundColor,
        centerTitle: false,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          "Attendance",
          style: TextStyles.title(context: context, color: themeProvider.accentColor),
        ),
        actions: [
          IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AttendanceCalendar(),
          SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => AttendanceItem(),
              separatorBuilder: (context, index)=>SizedBox(height: 16),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
