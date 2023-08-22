import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpoc/common/theme_change_model.dart';
import 'package:webpoc/widgets/common_colors.dart';
import 'package:webpoc/widgets/common_widget.dart';
import 'package:webpoc/widgets/responsive_widget.dart';
import 'package:webpoc/widgets/strings.dart';

class Destinations extends StatefulWidget {
  const Destinations({super.key});

  @override
  State<Destinations> createState() => _DestinationsState();
}

class _DestinationsState extends State<Destinations> {

  List isHovering = [false,false,false,false,false,false];
  List isSelected = [true,false,false,false,false,false];
  final CarouselController _controller = CarouselController();
  int currentSliderPage = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Consumer<ThemeChangeModel> (
    builder: (context,ThemeChangeModel themeProvider,child)
    {
      return Column(
        children: [
          const SizedBox(height: 50.0,),
          buildTextWidget("Destination Diversity",fontColor: themeProvider.isDark ? whiteColor : blackColor,fontWeight: FontWeight.bold,fontSize: 20.0),
          const SizedBox(height: 20.0,),
          Stack(
            alignment: Alignment.center,
            children: [
              ///destination slider
              CarouselSlider.builder(
                carouselController: _controller,
                itemCount: Strings.destinationSliderImages.length,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(Strings.destinationSliderImages[itemIndex],fit: BoxFit.cover,),
                    ),
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                    aspectRatio: 20 / 8,
                    onPageChanged: (sliderIndex,reason){
                      setState(() {
                        currentSliderPage = sliderIndex;
                        for (int i = 0; i < Strings.destinationSliderImages.length; i++) {
                          if (i == sliderIndex) {
                            isSelected[i] = true;
                          } else {
                            isSelected[i] = false;
                          }
                        }
                      });
                    }
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: buildTextWidget(Strings.destinationSliderTitle[currentSliderPage],fontSize: 30.0,
                    fontColor: whiteColor,letterSpacing: 5),
              ),
              ///destination title
              ResponsiveWidget.isSmallScreen(context)
                  ? AspectRatio(
                aspectRatio: 16/7,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:  Padding(
                    padding: EdgeInsets.only(
                        top: screenSize.width / 3,
                        left: screenSize.width / 6,
                        right: screenSize.width / 6),
                    child: Card(
                        elevation: 5,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                for (int i = 0; i < Strings.destinationSliderTitle.length; i++)
                                  Column(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onHover: (value) {
                                          setState(() {
                                            value
                                                ? isHovering[i] = true
                                                : isHovering[i] = false;
                                          });
                                        },
                                        onTap: () {
                                          _controller.animateToPage(i);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.0,right: 5.0,
                                              top: screenSize.height / 80,
                                              bottom: screenSize.height / 90),
                                          child: buildTextWidget(Strings.destinationSliderTitle[i],
                                              fontColor: themeProvider.isDark
                                                  ? isHovering[i] ? Colors.lightBlue[200]! : Colors.lightBlue
                                                  : isHovering[i] ? Colors.blueGrey[900]! : Colors.blueGrey),
                                        ),
                                      ),
                                      Visibility(
                                        maintainSize: true,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        visible: isSelected[i],
                                        child: AnimatedOpacity(
                                          duration: const Duration(milliseconds: 400),
                                          opacity: isSelected[i] ? 1 : 0,
                                          child: Container(
                                            height: 5,
                                            decoration: BoxDecoration(
                                              color: themeProvider.isDark
                                                  ? Colors.lightBlue
                                                  : Colors.blueGrey,
                                              borderRadius: const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            width: screenSize.width / 10,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ],
                            )
                        )
                    ),
                  ),
                ),
              )
                  : AspectRatio(
                aspectRatio: 16/7,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenSize.width / 6,
                        right: screenSize.width / 6),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height / 50,
                          bottom: screenSize.height / 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < Strings.destinationSliderTitle.length; i++)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onHover: (value) {
                                      setState(() {
                                        value
                                            ? isHovering[i] = true
                                            : isHovering[i] = false;
                                      });
                                    },
                                    onTap: () {
                                      _controller.animateToPage(i);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenSize.height / 80,
                                          bottom: screenSize.height / 90),
                                      child: buildTextWidget(Strings.destinationSliderTitle[i],
                                          fontColor:
                                            themeProvider.isDark
                                            ? isHovering[i] ? Colors.lightBlue[200]! : Colors.lightBlue
                                            : isHovering[i] ? Colors.blueGrey[900]! : Colors.blueGrey
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    maintainSize: true,
                                    maintainAnimation: true,
                                    maintainState: true,
                                    visible: isSelected[i],
                                    child: AnimatedOpacity(
                                      duration: const Duration(milliseconds: 400),
                                      opacity: isSelected[i] ? 1 : 0,
                                      child: Container(
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: themeProvider.isDark
                                          ? Colors.lightBlue
                                          : Colors.blueGrey,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        width: screenSize.width / 10,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 50.0,),
        ],
      );
    });
  }
}