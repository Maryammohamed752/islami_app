
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/quran%20Tab/sura_item_horizontal.dart';
import 'package:islami_app/home/tabs/quran%20Tab/sura_name_item.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/sura_details/sura_details.dart';

class QuranTab extends StatefulWidget {
   QuranTab({super.key});
  //Quran tab finishes.
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  var searchController=TextEditingController();
  @override
  void initState(){
    super.initState();
    searchController.addListener(onSearch);
  }
  onSearch(){
String text=searchController.text;
if(text.isNotEmpty) {
  for (String data in SuraModel.suraNamesEn) {
    if (data.toLowerCase().contains(text.toLowerCase())) {
      SuraModel.searchResult.add(data);
    }
  }
}
setState(() {

  });

  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.stretch ,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/onboarding_header.png"),
              _SearchItem(),
             if(!( SuraModel.searchResult.isNotEmpty||searchController.text.isNotEmpty))...[
               _SuraNamesHorzientalList()],
               _SuraNamesVerticalList(),
             ],

          ),

        )
    );
  }
  Widget _SuraNamesHorzientalList(){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Most Recently",style: GoogleFonts.elMessiri(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white),),
          SuraModel.searchResult.isNotEmpty?
          SizedBox():
          SizedBox(height: 8,),
          Container(height: 150,
      
            child: ListView.separated(
              separatorBuilder: (context,index)=>SizedBox(width: 16,),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return SuraItemHorizontal(model: SuraModel.getSuraModel(index),);
              },itemCount: SuraModel.listCounts,),),
          SizedBox(height: 8,),
        ],
      ),
    );
  }
  Widget _SuraNamesVerticalList(){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Suras List",style: GoogleFonts.elMessiri(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white),),
          SizedBox(height: 8,),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index)=>Divider(
                endIndent: 40,
                indent: 40,
              ),
              padding:EdgeInsets.zero,
              itemBuilder: (context,index)
              {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,SuraDetailsScreen.routeName,
                    arguments: SuraModel.getSuraModel(index));
                  },
                  child: SuraNameItem(

                    model: SuraModel.searchResult.isNotEmpty?
                    SuraModel.getSelectedSuraModel(index)
                        :SuraModel.getSuraModel(index),
                  ),
                )
                ;
              },
      
              itemCount: SuraModel.searchResult.isNotEmpty?
              SuraModel.searchResult.length:SuraModel.listCounts,),
          )
        ],
      ),
    );
  }
  Widget _SearchItem(){
   return Column(
     children: [
       TextField(
         style:GoogleFonts.elMessiri(
   color: Colors.white,
       fontSize: 20,
       fontWeight: FontWeight.bold
   ),
          controller: searchController,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              hintText: "Sura Name",
              prefixIcon: ImageIcon(AssetImage("assets/images/ic_search.png"),color: Color(0xFFE2BE7E)),
              hintStyle: GoogleFonts.elMessiri(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color:Color(0xFFE2BE7E),width: 3
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color(0xFFE2BE7E),width: 3
                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color(0xFFE2BE7E),width: 3
                  )
              )
          ),

        ),
       SizedBox( height: 20,),
     ],

   );
  }
}
