
import 'package:flutter/material.dart';
import 'package:islami_app/home/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/${getBackgroundImageName()}.png"),
        fit: BoxFit.cover),
      ),
      child: Scaffold(
    backgroundColor:Colors.transparent ,
        bottomNavigationBar: BottomNavBar(onChange:(index){
          currentIndex=index;
          setState(() {

          });
        }),
        body: Container(),
      ),
    );
  }
 String getBackgroundImageName(){
    switch(currentIndex){
      case 0:
        return "home_bg";
      case 1:
      return "ahadeth_bg";
      case 2:
      return "sebha_bg";
      case 3:
      return "radio_bg";
      default:
        return "home_bg";

 }
}

}
