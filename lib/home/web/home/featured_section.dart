import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpoc/common/theme_change_model.dart';
import 'package:webpoc/widgets/common_colors.dart';
import 'package:webpoc/widgets/common_widget.dart';
import 'package:webpoc/widgets/responsive_widget.dart';

class FeaturedSection extends StatefulWidget {
  const FeaturedSection({super.key});

  @override
  State<FeaturedSection> createState() => _FeaturedSectionState();
}

class _FeaturedSectionState extends State<FeaturedSection> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>ThemeChangeModel(),
      child: Consumer<ThemeChangeModel> (
          builder: (context, ThemeChangeModel themeProvider,child)
          {
            return Theme(
                data: themeProvider.isDark ? ThemeData.dark() : ThemeData.light(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20.0, right: 20.0,top:10.0,bottom: 10.0),
                      child:
                      ResponsiveWidget.isSmallScreen(context)
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextWidget("Featured",fontColor:
                          themeProvider.isDark ? whiteColor : blackColor, fontWeight: FontWeight.bold,fontSize: 20.0),
                          const SizedBox(height: 10.0,),
                          buildTextWidget("Unique wildlife tours & destinations",fontSize: 14.0,fontColor: greyColor),
                        ],
                      )
                          : Row(
                        children: [
                          buildTextWidget("Featured",fontColor: themeProvider.isDark ? whiteColor : blackColor,fontWeight: FontWeight.bold,fontSize: 20.0),
                          const Spacer(),
                          buildTextWidget("Unique wildlife tours & destinations",fontSize: 14.0,fontColor: greyColor),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left:20,right: 20.0,top:10.0,bottom: 10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildFeaturedDesignWidget(context,"assets/trekking.jpg","Trekking",themeProvider.isDark ? whiteColor : blackColor),const SizedBox(width: 10.0,),
                              buildFeaturedDesignWidget(context,"assets/animals.jpg","Animals",themeProvider.isDark ? whiteColor : blackColor),const SizedBox(width: 10.0,),
                              buildFeaturedDesignWidget(context,"assets/photography.jpeg","Photography",themeProvider.isDark ? whiteColor : blackColor),const SizedBox(width: 10.0,),
                              buildFeaturedDesignWidget(context,"assets/cover.jpg","Other",themeProvider.isDark ? whiteColor : blackColor),const SizedBox(width: 10.0,),
                            ],
                          ),
                        )
                    )
                  ],
                ));
          }),
    );
  }
}
