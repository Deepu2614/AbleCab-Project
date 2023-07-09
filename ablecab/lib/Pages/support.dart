import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ablecab/Variables/colors.dart';
import 'package:page_transition/page_transition.dart';
import '../Variables/sizes.dart';
import 'Otp.dart';
class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onboarding,
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back,color: primary,size: 25), onTap:(){
          Navigator.pushReplacement(context, PageTransition(child: Otp(verificationID: '',), type: PageTransitionType.leftToRight));
        } ,),

        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        ),
        backgroundColor: onboarding,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            height:  MediaQuery.of(context).size.height*appbarimgh,
            child: Text("Support" ,style: GoogleFonts.dmSans(
              color: primary,
              fontSize: MediaQuery.of(context).size.width*txt18,
            ),),
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(
            color: primary.withOpacity(0.25),
            thickness: .5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
            child: Row(
              children: [
                Text("Account related" ,style: GoogleFonts.dmSans(
                  color: primary.withOpacity(0.65),
                  fontSize: MediaQuery.of(context).size.width*txt18,)),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: primary.withOpacity(0.65),size: 14)
              ],
            ),
          ),Divider(
            color: primary.withOpacity(0.25),
            thickness: .5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
            child: Row(
              children: [
                Text("Account related" ,style: GoogleFonts.dmSans(
                  color: primary.withOpacity(0.65),
                  fontSize: MediaQuery.of(context).size.width*txt18,)),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: primary.withOpacity(0.65),size: 14)
              ],
            ),
          ),Divider(
            color: primary.withOpacity(0.25),
            thickness: .5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
            child: Row(
              children: [
                Text("ChatBot" ,style: GoogleFonts.dmSans(
                  color: primary.withOpacity(0.65),
                  fontSize: MediaQuery.of(context).size.width*txt18,)),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: primary.withOpacity(0.65),size: 14)
              ],
            ),
          ),
          Divider(
            color: primary.withOpacity(0.25),
            thickness: .5,
          ),



        ],
      )

    );
  }
}
