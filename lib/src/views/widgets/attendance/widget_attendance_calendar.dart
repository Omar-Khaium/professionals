import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/utils/helper.dart';
import 'package:professionals/src/utils/text_styles.dart';
import 'package:provider/provider.dart';

class AttendanceCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child:
                    Text("Mon", style: TextStyles.caption(context: context, color: themeProvider.textColor).copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                flex: 1),
            Expanded(
                child:
                    Text("Tue", style: TextStyles.caption(context: context, color: themeProvider.textColor).copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                flex: 1),
            Expanded(
                child:
                    Text("Wed", style: TextStyles.caption(context: context, color: themeProvider.textColor).copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                flex: 1),
            Expanded(
                child:
                    Text("Thu", style: TextStyles.caption(context: context, color: themeProvider.textColor).copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                flex: 1),
            Expanded(
                child:
                    Text("Fri", style: TextStyles.caption(context: context, color: themeProvider.textColor).copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                flex: 1),
            Expanded(
                child: Text("Sat", style: TextStyles.caption(context: context, color: Colors.red).copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center), flex: 1),
            Expanded(
                child: Text("Sun", style: TextStyles.caption(context: context, color: Colors.red).copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center), flex: 1),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.54,
          child: GridView.count(
            crossAxisCount: 7,
            mainAxisSpacing: 0,
            childAspectRatio: 1.33,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(0),
            physics: ScrollPhysics(),
            children: Helper.getCurrentMonth().map(
              (date) {
                Random random = Random();
                int hour = random.nextInt(12) + 1;
                return Center(
                  child: CircleAvatar(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat("d").format(date),
                          style: TextStyles.body(
                                  context: context,
                                  color: date.isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))
                                      ? themeProvider.backgroundColor
                                      : DateFormat("E").format(date).toLowerCase() == "sat" || DateFormat("E").format(date).toLowerCase() == "sun"
                                          ? Colors.red.withOpacity(Helper.isNextMonth(date) || Helper.isPreviousMonth(date) ? .25 : 1)
                                          : themeProvider.textColor.withOpacity(Helper.isNextMonth(date) || Helper.isPreviousMonth(date) ? .25 : 1))
                              .copyWith(fontWeight: FontWeight.w100),
                        ),
                        Visibility(
                          visible: !date.isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)) &&
                              !(DateFormat("E").format(date).toLowerCase() == "sat" || DateFormat("E").format(date).toLowerCase() == "sun") && date.isBefore(DateTime.now()),
                          child: Icon(
                            hour >= 9 ? Icons.star : Icons.fiber_manual_record,
                            color: date.isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))
                                ? themeProvider.backgroundColor
                                : hour >= 9 ? Colors.yellow.shade700  : themeProvider.accentColor.withOpacity(hour / 9),
                            size: hour >= 9 ? 10 : 8,
                          ),
                        )
                      ],
                    ),
                    backgroundColor: date.isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))
                        ? DateFormat("E").format(date).toLowerCase() == "sat" || DateFormat("E").format(date).toLowerCase() == "sun"
                            ? Colors.red
                            : themeProvider.accentColor
                        : Colors.transparent,
                    radius: 18,
                  ),
                );
              },
            ).toList(),
          ),
        )
      ],
    );
  }
}
