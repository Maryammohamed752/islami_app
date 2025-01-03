
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraItemHorizontal extends StatelessWidget {
  SuraModel model;
 SuraItemHorizontal({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(24),
        color: Color(0XFFE2BE7F)
      ),
      child: Row(
        children:[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(model.nameEn, style: GoogleFonts.elMessiri(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
              ),),
             const SizedBox(height: 8,),
              Text(model.nameAr, style: GoogleFonts.elMessiri(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),),
             const SizedBox(height: 8,),
              Text("${model.numOfVerses}Verses", style: GoogleFonts.elMessiri(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),),



            ],
          ),
          Image.asset("assets/images/sura_item.png"),

        ],
      ),
    ) ;
  }
}
