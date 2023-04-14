import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/todo_list.dart';

import 'main.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AnimatedSplashScreen(
      //AnimatedSplashScreen - dependência setada no pubspec
        splash: Icon(Icons.playlist_add_circle_sharp),
        splashIconSize: 450,
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.lightGreen,
        nextScreen: const TodoList()
    );
  }
}





