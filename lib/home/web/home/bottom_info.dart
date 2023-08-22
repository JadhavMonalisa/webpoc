import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpoc/common/theme_change_model.dart';
import 'package:webpoc/widgets/common_colors.dart';
import 'package:webpoc/widgets/common_widget.dart';
import 'package:webpoc/widgets/responsive_widget.dart';

class BottomBarInfo extends StatefulWidget {
  const BottomBarInfo({super.key});

  @override
  State<BottomBarInfo> createState() => _BottomBarInfoState();
}

class _BottomBarInfoState extends State<BottomBarInfo> {
  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeChangeModel>(
        builder: (context,ThemeChangeModel themeProvider,child)
        {
      return Container(
        color: Colors.blueGrey.shade900,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            ///about us
            ResponsiveWidget.isSmallScreen(context)
                ? buildBottomBarPersonal1(themeProvider.isDark)
                : IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width/2,
                      child: buildBottomBarPersonal1(themeProvider.isDark)
                  ),
                  VerticalDivider(color: blueGrey500,width: 2.0,),
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/2,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 200.0),
                          child: buildBottomBarPersonal2(CrossAxisAlignment.start,themeProvider.isDark)
                      ),
                    ),
                  ),
                ],
              ),
            ),

            buildDivider(blueGrey500),
            const SizedBox(height: 20.0,),

            ///email & address
            ResponsiveWidget.isSmallScreen(context)
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildBottomBarPersonal2(CrossAxisAlignment.center,themeProvider.isDark),
                const SizedBox(height: 20.0,),
                buildDivider(blueGrey500),
                const SizedBox(height: 20.0,),
              ],
            )
                : const Opacity(opacity: 0.0),

            buildBottomBarCopyright(themeProvider.isDark)
          ],
        ),
      );
    });
  }
}
