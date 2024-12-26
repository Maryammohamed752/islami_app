
import 'package:flutter/material.dart';

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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFE2BE7F),
          showUnselectedLabels: true,
          currentIndex:currentIndex,
           onTap: (value){
            currentIndex=value;
            setState(() {

            });
           },
           selectedItemColor:Colors.white,
            unselectedItemColor: Color(0xFF202020),
            type: BottomNavigationBarType.fixed,
    items: [BottomNavigationBarItem
      (icon:_buildNavItem("quran", 0),
        label: "Quran"),
    BottomNavigationBarItem(icon:_buildNavItem("ahadeth", 1),label: "Hadith"),
    BottomNavigationBarItem(icon:_buildNavItem("sebha", 2) ,label: "Sebha"),
    BottomNavigationBarItem(icon: _buildNavItem("radio", 3),label: "Radio"),
    BottomNavigationBarItem(icon:_buildNavItem("dates", 4),label: "Time"),


    ]),
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
  Widget _buildNavItem(String imageName,int index){
    return
    currentIndex==index?
      Container(
          padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: Color(0x99202020)),
          child: ImageIcon(AssetImage("assets/images/$imageName.png"),),
           ):ImageIcon(AssetImage("assets/images/$imageName.png"),
    );
  }
}
