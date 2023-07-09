import 'package:ablecab/Pages/Phone1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ablecab/Variables/colors.dart';
import 'package:ablecab/Variables/sizes.dart';
import 'package:page_transition/page_transition.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('FFFFFF'),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
        ),
        backgroundColor: onboarding,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Container(
            height:  MediaQuery.of(context).size.height*appbarimgh,
            child: Image.asset('assets/Appbar.png'),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(child: Container(
                    width: MediaQuery.of(context).size.width*onboard,
                    child: Image.asset("assets/onboarding.png")),
                top: -350,
                left: -60,),
                
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(

                children: [



                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Disability is not Inability",style: GoogleFonts.dmSans(

                        color: primary,
                        fontSize: MediaQuery.of(context).size.width*txt18,

                      )),
                      SizedBox(height: 20,),
                      Text("Welcome to our inclusive ride-hailing app designed to meet the unique needs of individuals with disabilities. Join us on a transformative journey towards accessible and convenient transportation solutions.",
                        style: GoogleFonts.dmSans(
                          fontSize: MediaQuery.of(context).size.width*(3.15/100),
                          color: black.withOpacity(0.53)
                        ),

                      )
                    ],
                  ),



                  SizedBox(height: 100),



                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                          context,
                          PageTransition(child: Phone1(), type: PageTransitionType.rightToLeft)
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      child: Center(child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Next",
                          style: TextStyle(color: white),
                        ),
                      )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: primary
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}







// Container(
// height: MediaQuery.of(context).size.height*appbarimgh,
// child: Image.asset('assets/Appbar.png'))

