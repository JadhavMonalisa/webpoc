import 'package:flutter/material.dart';

class DownToUpNavigation extends PageRouteBuilder {
  final Widget widget;

  DownToUpNavigation({required this.widget})
      : super(
          transitionDuration:const Duration(seconds: 1),
          transitionsBuilder: (BuildContext context, Animation<double> animation,Animation<double> secAnimation,
              Widget child){
                animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
                return SlideTransition(position: Tween<Offset> (begin: const Offset(0,1),
                    end: Offset.zero).animate(animation),
                transformHitTests: true,
                child: child,
            );
          },
          pageBuilder: ((BuildContext context, Animation<double> animation,Animation<double> secAnimation){
            return widget;
          }
      ));

      @override
      void dispose() {
        super.dispose();
      }
}