
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/onboarding_header.png"),
              TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  prefixIcon: ImageIcon(AssetImage("assets/images/ic_search.png"),color: Color(0xFFE2BE7E),),
                  hintStyle: GoogleFonts.elMessiri(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color:Color(0xFFE2BE7E),
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xFFE2BE7E),
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xFFE2BE7E),
                )
                  )
                ),

              )
            ],
          ),
        ));
  }
}
