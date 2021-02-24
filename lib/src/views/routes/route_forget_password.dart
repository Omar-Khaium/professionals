import 'package:flutter/material.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/utils/text_styles.dart';
import 'package:professionals/src/views/widgets/forget_password/form_forget_password.dart';
import 'package:provider/provider.dart';

class ForgetPasswordRoute extends StatelessWidget {
  final String route = "/forget_password";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      appBar: AppBar(
        backgroundColor: themeProvider.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: themeProvider.iconColor),

      ),
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lock,
                size: 72,
                color: themeProvider.accentColor,
              ),
              SizedBox(
                height: 12,
              ),
              Text("Forget Password", style: TextStyles.title(context: context, color: themeProvider.accentColor), textAlign: TextAlign.center),
              SizedBox(
                height: 12,
              ),
              ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
