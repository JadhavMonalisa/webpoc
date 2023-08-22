import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpoc/common/theme_change_model.dart';
import 'package:webpoc/home/web/home/home_screen.dart';
import 'package:webpoc/widgets/custom_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChangeModel(),
      child: Consumer<ThemeChangeModel>(
          builder: (context, ThemeChangeModel themeProvider, child)
          {
        return MaterialApp(
        title: 'Flutter Web Demo',
        debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
          theme: themeProvider.isDark
              ? ThemeData.dark()
              : ThemeData.light(),
      home: const HomePage(),
      );
      })
    );
  }
}

