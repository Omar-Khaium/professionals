import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/utils/text_styles.dart';
import 'package:provider/provider.dart';

class NoticeHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return PhysicalModel(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notices",
              style: TextStyles.subTitle(context: context, color: themeProvider.accentColor),
            ),
            SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.group_outlined, color: themeProvider.accentColor, size: 24),
              title: Text("iEatery client meeting", style: TextStyles.body(context: context, color: themeProvider.accentColor)),
              subtitle: Text("Tomorrow at 09:57am", style: TextStyles.caption(context: context, color: themeProvider.accentColor)),
              trailing: Icon(
                Icons.fiber_new,
                color: themeProvider.accentColor,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.layers_outlined, color: themeProvider.iconColor, size: 24),
              title: Text("Project submission is due in 2 days", style: TextStyles.body(context: context, color: themeProvider.iconColor)),
              subtitle: Text("6 days ago", style: TextStyles.caption(context: context, color: themeProvider.textColor)),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Icon(MdiIcons.bullhornOutline, color: themeProvider.iconColor, size: 24),
              title: Text("Independence day's holiday on 26th March", style: TextStyles.body(context: context, color: themeProvider.textColor)),
              subtitle: Text("8 days ago", style: TextStyles.caption(context: context, color: themeProvider.textColor)),
            ),
          ],
        ),
      ),
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: themeProvider.backgroundColor,
      shadowColor: themeProvider.accentColor.withOpacity(.25),
      elevation: 2,
      shape: BoxShape.rectangle,
    );
  }
}
