
import 'package:flutter/material.dart';
class BottomNavBar extends StatefulWidget {
  Function onChange;
   BottomNavBar({required this.onChange,super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Color(0xFFE2BE7F),
        showUnselectedLabels: true,
        currentIndex:currentIndex,
        onTap: (value){
          currentIndex=value;
          widget.onChange(currentIndex);
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


        ]);
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
