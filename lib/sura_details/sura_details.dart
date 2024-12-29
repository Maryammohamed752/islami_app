
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/sura_model.dart';

import '../models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName="SuraDetails";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String>verses=[];

  @override
  Widget build(BuildContext context) {
    var suraModel=ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty){
      loadSuraFile(suraModel.index);
    }
    loadSuraFile(suraModel.index);
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff202020),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xffE2BE7F),
        ),
        title: Text(suraModel.nameEn,style: GoogleFonts.aBeeZee(
          color: Color(0xffE2BE7F),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/details_bg.png",width: double.infinity,fit: BoxFit.fill,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top:12),
                child: Text(SuraModel.nameAr,style: GoogleFonts.aBeeZee(
                color: Color(0xffE2BE7F),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),

              ),
    SizedBox(height: 48,),
    Expanded(
        child: ListView.separated(
          separatorBuilder: (context,index)=>SizedBox(height:12,),
          itemBuilder:(context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE2BE7F)),
            borderRadius: BorderRadius.circular(16)
          ),
          child:Directionality(
            textDirection: TextDirection.rtl,
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
              TextSpan(text:verses[index]
               ,style: GoogleFonts.elMessiri(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
              ),
                TextSpan(text: "(${index+1})",
                  style: GoogleFonts.elMessiri(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                )
            ],
            ),
            ),
          ),
        );
        },
                itemCount:verses.length ,),
      ),

        ],

      ),

   ],), );
  }

 void loadSuraFile(int index) async{
   String textFile= await rootBundle.loadString("assets/files/${index+1}.txt");
   List<String>lines=textFile.split("\n");
   print(lines);
   verses=lines;
  }
}
