import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/utils/text_styles.dart';
import 'package:professionals/src/views/list_items/item_quick_menu.dart';
import 'package:professionals/src/views/routes/route_attendance.dart';
import 'package:professionals/src/views/widgets/home/widget_attendance.dart';
import 'package:professionals/src/views/widgets/home/widget_notice.dart';
import 'package:professionals/src/views/widgets/home/widget_project.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatelessWidget {
  final String route = "/home";

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
        leading: Padding(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: themeProvider.secondaryColor,
                borderRadius: BorderRadius.circular(28),
              ),
              child: CachedNetworkImage(
                imageUrl: "https://haas.berkeley.edu/wp-content/uploads/romero-hernandez_omar-1.jpg",
                placeholder: (context, url) => Center(
                  child: CupertinoActivityIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.person, color: themeProvider.accentColor),
              ),
            ),
          ),
        ),
        title: Text(
          "John Doe",
          style: TextStyles.title(context: context, color: themeProvider.accentColor),
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none_rounded, color: themeProvider.accentColor), onPressed: () {}),
          IconButton(icon: Icon(Icons.logout, color: themeProvider.accentColor), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuickMenu(label: "Attendance", icon: Icons.access_time_outlined, onTap: () {
                    Navigator.of(context).pushNamed(AttendanceRoute().route);
                  }),
                  QuickMenu(label: "Project", icon: Icons.layers_outlined, onTap: () {}),
                  QuickMenu(label: "Notice", icon: MdiIcons.bullhornOutline, onTap: () {}),
                  QuickMenu(label: "Menu", icon: Icons.grid_view, onTap: () {}),
                ],
              ),
            ),
          ),
          SizedBox(height: 16,),
          AttendanceHistory(),
          SizedBox(height: 16,),
          ProjectHistory(),
          SizedBox(height: 16,),
          NoticeHistory(),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}
