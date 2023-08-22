import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpoc/common/theme_change_model.dart';
import 'package:webpoc/widgets/common_widget.dart';
import '../../../widgets/common_colors.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChangeModel> (
        builder: (context,ThemeChangeModel themeProvider,child)
        {
      return Theme(
        data: themeProvider.isDark ? ThemeData.dark():ThemeData.light(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextWidget("Menu",fontColor: themeProvider.isDark ? blue100: blackColor),
              const SizedBox(height: 10.0,),buildDivider(blueGrey500),const SizedBox(height: 10.0,),
              buildTextWidget("Discover",fontColor: themeProvider.isDark ? blue100: blackColor),const SizedBox(height: 10.0,),
              buildTextWidget("Contact Us",fontColor: themeProvider.isDark ? blue100: blackColor),const SizedBox(height: 10.0,),
              buildTextWidget("Sign Up",fontColor: themeProvider.isDark ? blue100: blackColor),const SizedBox(height: 10.0,),
              buildTextWidget("Login",fontColor: themeProvider.isDark ? blue100: blackColor),const SizedBox(height: 10.0,),
            ],
          ),
        ),
      );
    });
  }
}
