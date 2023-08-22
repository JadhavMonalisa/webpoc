import 'package:flutter/material.dart';
import 'package:webpoc/widgets/common_colors.dart';

///text
buildTextWidget(String title,{double fontSize = 14.0,Color fontColor = Colors.black,
FontWeight fontWeight = FontWeight.bold,double letterSpacing = 0.0,TextAlign textAlign = TextAlign.left}){
  return Text(title,style: TextStyle(fontSize:fontSize,color:fontColor,fontWeight: fontWeight,
      letterSpacing: letterSpacing,),textAlign: textAlign,);
}
///featured design image and title
buildFeaturedDesignWidget(BuildContext context,String image,String title,Color fontColor){
  var screenSize = MediaQuery.of(context).size;

  return Column(
    children: [
      SizedBox(
        height: screenSize.height / 6,
        width: screenSize.width / 3.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.asset(image,fit: BoxFit.cover,),
        ),
      ),
      const SizedBox(height: 5.0,),
      buildTextWidget(title,fontColor: fontColor),
    ],
  );
}
///bottom bar data
buildBottomBarData(String heading,String subtitle1,String subtitle2,String subtitle3,bool isThemeDark){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildTextWidget(heading,fontColor: isThemeDark ? blue300 :blueGrey300), const SizedBox(height: 20.0,),
      buildTextWidget(subtitle1,fontColor: isThemeDark ? blue100 : blueGrey100),const SizedBox(height: 10.0,),
      buildTextWidget(subtitle2,fontColor: isThemeDark ? blue100 :blueGrey100),const SizedBox(height: 10.0,),
      buildTextWidget(subtitle3,fontColor: isThemeDark ? blue100 :blueGrey100),const SizedBox(height: 10.0,),
    ],
  );
}
///rich text
buildRichTextWidget(String title1,String title2, {FontWeight title1Weight = FontWeight.bold,
  FontWeight title2Weight = FontWeight.normal,Color title1Color = Colors.black, Color title2Color = Colors.black,
  double title1Size = 15.5, double title2Size = 15.5}){
  return RichText(
    text: TextSpan(
      text: title1,
      style: TextStyle(fontWeight: title1Weight,color: title1Color,fontSize: title1Size),
      children: <TextSpan>[
        TextSpan(
            text: title2,
            style: TextStyle(fontWeight: title2Weight,color: title2Color,fontSize: title2Size)),
      ],
    ),
  );
}
///for small screen size
buildTopWidgetForSmallScreen(IconData icon, String title){
  return Card(
    elevation: 2.0,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const SizedBox(width: 10.0,),Icon(icon,color: greyColor,),
          const SizedBox(width: 10.0,),buildTextWidget(title,fontColor: greyColor),
        ],
      ),
    ),
  );
}
///bottom bar personal data part 1
buildBottomBarPersonal1(bool isThemeDark){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Flexible(child: buildBottomBarData("ABOUT","Contact Us","About Us","Careers",isThemeDark),),
      Flexible(
        child: buildBottomBarData("HELP","Payment","Cancellation","FAQ",isThemeDark),
      ),
      Flexible(child: buildBottomBarData("SOCIAL","Twitter","Facebook","YouTube",isThemeDark),),
    ],
  );
}
///bottom bar personal data part 2
buildBottomBarPersonal2(CrossAxisAlignment crossAxisAlignment,bool isThemeDark){
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildRichTextWidget("Email : ", "explore@gmail.com",title1Color: isThemeDark ? blue300 : blueGrey300,
          title2Color: isThemeDark ? blue100 :blueGrey100),
      const SizedBox(height: 10.0,),
      buildRichTextWidget("Address : ", "123, abcd dummy address",title1Color: isThemeDark ? blue300 : blueGrey300,
          title2Color: isThemeDark ? blue100 :blueGrey100)
    ],
  );
}
///bottom bar personal data part 3
buildBottomBarCopyright(bool isThemeDark){
  return buildTextWidget("Copyright © 2023 | EXPLORE",fontColor: isThemeDark ? blue300 : blueGrey300);
}
///divider
buildDivider(Color dividerColor){
  return Divider(color: dividerColor);
}
