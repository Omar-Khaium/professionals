import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:professionals/src/providers/provider_theme.dart';
import 'package:professionals/src/utils/constants.dart';
import 'package:professionals/src/utils/form_validator.dart';
import 'package:professionals/src/utils/text_styles.dart';
import 'package:provider/provider.dart';

class ForgetPasswordForm extends StatefulWidget {
  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  TextEditingController usernameController = TextEditingController();

  FormValidator usernameValidator = FormValidator();

  @override
  void initState() {
    usernameValidator.initialize(controller: usernameController, type: FormType.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: usernameController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyles.body(context: context, color: usernameValidator.isValid ? themeProvider.textColor : themeProvider.errorColor),
            cursorColor: usernameValidator.isValid ? themeProvider.accentColor : themeProvider.errorColor,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              if (!usernameValidator.isValid) {
                setState(() {
                  usernameValidator.validate();
                });
              }
            },
            decoration: InputDecoration(
              fillColor: themeProvider.secondaryColor,
              filled: true,
              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(4)),
              prefixIcon: Icon(Icons.person, color: usernameValidator.isValid ? themeProvider.iconColor : themeProvider.errorColor),
              contentPadding: EdgeInsets.all(16),
              hintText: "username",
              hintStyle: TextStyles.body(context: context, color: usernameValidator.isValid ? themeProvider.shadowColor : themeProvider.errorColor.withOpacity(.25)),
              helperText: usernameValidator.validationMessage,
              helperStyle: TextStyles.caption(context: context, color: themeProvider.errorColor),
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 48,
            child: RaisedButton(
              color: themeProvider.accentColor,
              onPressed: () {
                setState(() {
                  usernameValidator.validate();
                });
                if(usernameValidator.isValid) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              child: Text(
                "Recover password".toUpperCase(),
                style: TextStyles.title(context: context, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
