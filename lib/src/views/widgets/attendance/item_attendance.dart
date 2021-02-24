import 'package:flutter/material.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/utils/text_styles.dart';
import 'package:provider/provider.dart';

class AttendanceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72,
      decoration: BoxDecoration(
          color: themeProvider.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: themeProvider.secondaryColor, spreadRadius: 2, blurRadius: 2, offset: Offset(0, 2))]),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 8,
              height: 72,
              decoration: BoxDecoration(color: themeProvider.accentColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
            ),
            left: 0,
          ),
          Positioned(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: themeProvider.accentColor.withOpacity(.1)),
                  width: 72,
                  height: 72,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("17", style: TextStyles.title(context: context, color: themeProvider.accentColor)),
                      Text("Feb", style: TextStyles.body(context: context, color: themeProvider.accentColor)),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("09:57am to 07:12pm", style: TextStyles.subTitle(context: context, color: themeProvider.textColor)),
                    Text("09 hours 15 minutes", style: TextStyles.caption(context: context, color: themeProvider.hintColor)),
                  ],
                )
              ],
            ),
            top: 0,
            bottom: 0,
            left: 8,
            right: 42,
          ),
          Positioned(
            child: Center(child: Icon(Icons.arrow_forward_ios_rounded, color: themeProvider.hintColor,)),
            top: 0,
            bottom: 0,
            right: 16,
          ),
        ],
      ),
    );
  }
}
