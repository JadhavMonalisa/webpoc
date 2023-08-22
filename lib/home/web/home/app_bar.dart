import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpoc/common/animate_navigation.dart';
import 'package:webpoc/common/theme_change_model.dart';
import 'package:webpoc/home/web/sign_up/sign_up_screen.dart';
import 'package:webpoc/main.dart';
import 'package:webpoc/widgets/common_colors.dart';
import 'package:webpoc/widgets/common_widget.dart';

// ignore: must_be_immutable
class CustomHomeAppBar extends StatefulWidget {
  double? opacity;
  CustomHomeAppBar({super.key,this.opacity});

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  List isHovering = [false,false,false,false];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChangeModel(),
      child: Consumer<ThemeChangeModel>(
          builder: (context, ThemeChangeModel themeProvider,child){
        return Container(
          color: appBarColor.withOpacity(widget.opacity!),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const SizedBox(width: 10.0,),
                buildTextWidget("EXPLORE",fontColor: whiteColor,letterSpacing: 3.0),
                const Spacer(),
                InkWell(
                    onTap: (){},
                    onHover: (value){
                      setState(() {
                        isHovering[0] = value;
                      });
                    },
                    child:
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildTextWidget("Discover",fontColor: isHovering[0] ? appBarTextLightBlueColor : whiteColor ),
                        const SizedBox(height: 5.0,),
                        Visibility(
                          visible: isHovering[0],
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          child: Container(
                            width: 20.0,height: 2,color: whiteColor,
                          ),
                        )
                      ],
                    )
                ),
                const SizedBox(width: 10.0,),
                InkWell(
                    onTap: (){},
                    onHover: (value){
                      setState(() {
                        isHovering[1] = value;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildTextWidget("Contact Us",fontColor: isHovering[1] ? appBarTextLightBlueColor : whiteColor),
                        const SizedBox(height: 5.0,),
                        Visibility(
                          visible: isHovering[1],
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          child: Container(
                            width: 20.0,height: 2,color: whiteColor,
                          ),
                        )
                      ],
                    )
                ),
                const Spacer(),
                buildTextWidget(themeProvider.isDark ? "Dark Mode": "Light Mode",fontColor: whiteColor),
                IconButton(
                    onPressed: (){
                      setState(() {
                        themeProvider.isDark
                            ? themeProvider.isDark = false
                            : themeProvider.isDark = true;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyApp()));
                      });
                    },
                    icon: Icon(themeProvider.isDark?Icons.nightlight_round:Icons.wb_sunny,color: whiteColor,)),
                const SizedBox(width: 10.0,),
                InkWell(
                    onTap: (){
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
                      Navigator.push(context, DownToUpNavigation(widget: const SignUpScreen()));
                    },
                    onHover: (value){
                      setState(() {
                        isHovering[2] = value;
                      });
                    },
                    child: buildTextWidget("Sign Up",fontColor:isHovering[2] ? appBarTextLightBlueColor : whiteColor,)),
                const SizedBox(width: 10.0,),
                InkWell(
                  onTap: (){},
                  onHover: (value){
                    setState(() {
                      isHovering[3] = value;
                    });
                  },
                  child: buildTextWidget("Login",fontColor: isHovering[3] ? appBarTextLightBlueColor : whiteColor,),
                ),
                const SizedBox(width: 10.0,),
              ],
            ),
          ),
        );
      }),
    );
  }
}
