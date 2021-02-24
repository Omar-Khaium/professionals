import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/utils/text_styles.dart';
import 'package:provider/provider.dart';

class ProjectHistory extends StatelessWidget {
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
              "Projects",
              style: TextStyles.subTitle(context: context, color: themeProvider.accentColor),
            ),
            SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: FlutterLogo(),
              title: Text("Professionals", style: TextStyles.body(context: context, color: themeProvider.textColor)),
              subtitle: Text("Prototyping", style: TextStyles.caption(context: context, color: themeProvider.textColor)),
              trailing: Icon(Icons.fiber_manual_record, color: themeProvider.accentColor),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Icon(MdiIcons.api, color: themeProvider.iconColor, size: 24),
              title: Text("Professionals", style: TextStyles.body(context: context, color: themeProvider.iconColor)),
              subtitle: Text("Pending", style: TextStyles.caption(context: context, color: themeProvider.errorColor)),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: FlutterLogo(),
              title: Text("iEatery BD", style: TextStyles.body(context: context, color: themeProvider.textColor)),
              subtitle: Text("SVN updated", style: TextStyles.caption(context: context, color: themeProvider.textColor)),
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
