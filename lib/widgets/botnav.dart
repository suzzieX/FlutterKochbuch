//Alex was here
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kochbuch/main.dart';
import 'package:kochbuch/pages/manage.dart';
import 'package:kochbuch/pages/recipe.dart';
import 'package:kochbuch/pages/snake.dart';

import '../pages/addCat.dart';
import '../pages/mIRC.dart';

class BotNav extends StatefulWidget {
  const BotNav ({ Key? key, required this.Index }): super(key: key);
  final int Index;
  @override
  State<BotNav> createState() => _BotNav(cIndex: Index);
}

 void navi(context, int page){

  switch (page){
    case 0:Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => SnakeGame(),
        transitionDuration: const Duration(seconds: 0),
      )) ; break ;
    case 1:Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const recipe(),
          transitionDuration: const Duration(seconds: 0),
        )) ; break ;
    case 2: Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Manage(),
          transitionDuration: const Duration(seconds: 0),
        )) ; break ;
    case 21: Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const mIRC(type:"categories"),
          transitionDuration: const Duration(seconds: 0),
        )) ; break;
    case 22: Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) =>  addCat(),
          transitionDuration: const Duration(seconds: 0),
        )) ; break ;
    default:
  }
 }
  class _BotNav extends State<BotNav> {

   _BotNav ({ Key? key, required this.cIndex });
  final int cIndex;
  Widget build(BuildContext context){
    void onTabTapped(int index) {
      switch (index){
        case 0:navi(context,0); break ;
        case 1: navi(context,1) ; break ;
        case 2:  navi(context,2) ; break ;


      }
    }
    return (
        BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: cIndex, // this will be set when a new tab is tapped
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Hinzufügen",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: "Rezepte",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Verwalten",
            )
          ],
        )
    );
  }

}
