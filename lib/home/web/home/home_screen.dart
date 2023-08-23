import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpoc/common/theme_change_model.dart';
import 'package:webpoc/home/app/home/drawer.dart';
import 'package:webpoc/home/web/home/app_bar.dart';
import 'package:webpoc/home/web/home/bottom_info.dart';
import 'package:webpoc/home/web/home/destination.dart';
import 'package:webpoc/home/web/home/featured_section.dart';
import 'package:webpoc/home/web/home/top_section.dart';
import 'package:webpoc/main.dart';
import 'package:webpoc/widgets/common_colors.dart';
import 'package:webpoc/widgets/common_widget.dart';
import 'package:webpoc/widgets/responsive_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0;
  double opacity = 0;

  _scrollListener() {
    setState(() {
      scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    opacity = scrollPosition < screenSize.height * 0.40
        ? scrollPosition / (screenSize.height * 0.40)
        : 1;

    return ChangeNotifierProvider(
      create: (_) => ThemeChangeModel(),
      child: Consumer<ThemeChangeModel> (
            builder: (context,ThemeChangeModel themeProvider, child)
          {
             return Theme(
               data: themeProvider.isDark ? ThemeData.dark(): ThemeData.light(),
               child: Scaffold(
                 extendBodyBehindAppBar: true,
                 appBar: ResponsiveWidget.isSmallScreen(context)
                     ? AppBar(
                   title: buildTextWidget("EXPLORE",fontColor: whiteColor,letterSpacing: 3.0),
                   centerTitle: true,
                   elevation: 0,
                   actions: [
                     Padding(
                       padding: const EdgeInsets.only(top: 20.0),
                       child: buildTextWidget(themeProvider.isDark ? "Dark Mode": "Light Mode",fontColor: whiteColor),
                     ),
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
                   ],
                   backgroundColor: blueGrey900.withOpacity(opacity),)
                     : PreferredSize(
                   preferredSize: Size(screenSize.width,1000),
                   child: CustomHomeAppBar(opacity: opacity,),
                 ),
                 drawer: ResponsiveWidget.isSmallScreen(context)? const Drawer(child: AppDrawer(),) : null,
                 body: SingleChildScrollView(
                   controller: _scrollController,
                   physics: const ClampingScrollPhysics(),
                   child: const Column(
                     children: [
                       TopSection(),
                       FeaturedSection(),
                       Destinations(),
                       BottomBarInfo(),
                     ],
                   ),
                 ),
               ),
             );
          }),
    );
  }
}