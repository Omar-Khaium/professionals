import 'package:flutter/material.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/utils/text_styles.dart';
import 'package:provider/provider.dart';

class QuickMenu extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onTap;

  QuickMenu({@required this.label, @required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width*.2,
        height: MediaQuery.of(context).size.width*.15,
        decoration: BoxDecoration(color: themeProvider.accentColor.withOpacity(.05), borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: themeProvider.accentColor, size: 24),
            SizedBox(height: 6,),
            Text(label,style: TextStyles.caption(context: context, color: themeProvider.accentColor).copyWith(fontSize: 9),),
          ],
        ),
      ),
    );
  }
}
