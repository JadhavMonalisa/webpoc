import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpoc/common/theme_change_model.dart';
import 'package:webpoc/widgets/common_colors.dart';
import 'package:webpoc/widgets/common_widget.dart';
import 'package:webpoc/widgets/responsive_widget.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) =>ThemeChangeModel(),
      child: Consumer<ThemeChangeModel> (
      builder: (context, ThemeChangeModel themeProvider, child)
      {
        return Theme(
          data: themeProvider.isDark
              ? ThemeData.dark()
              : ThemeData.light(),
          child: Stack(
            children: [
              SizedBox(
                height: screenSize.height * 0.45,
                width: screenSize.width,
                child:Image.asset("assets/cover.jpg",fit: BoxFit.cover,),
              ),
              Center(
                heightFactor: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width / 4,
                      right: screenSize.width / 4,
                      top: screenSize.height * 0.40
                  ),
                  child:
                  ResponsiveWidget.isSmallScreen(context)
                      ? Column(
                    children: [
                      buildTopWidgetForSmallScreen(Icons.location_on_sharp,"Destination"),const SizedBox(height: 10.0,),
                      buildTopWidgetForSmallScreen(Icons.calendar_month,"Dates"),const SizedBox(height: 10.0,),
                      buildTopWidgetForSmallScreen(Icons.people,"People"),const SizedBox(height: 10.0,),
                      buildTopWidgetForSmallScreen(Icons.sunny,"Experience"),const SizedBox(height: 10.0,),
                    ],
                  )
                      : SizedBox(
                    width: screenSize.width/2,
                    child: Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left:40.0,right: 40.0,top: 20.0,bottom: 20.0),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildTextWidget("Destination",fontColor: greyColor),VerticalDivider(color: blueGrey500,),
                              buildTextWidget("Dates",fontColor: greyColor),VerticalDivider(color: blueGrey500,),
                              buildTextWidget("People",fontColor: greyColor),VerticalDivider(color: blueGrey500,),
                              buildTextWidget("Experience",fontColor: greyColor),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
