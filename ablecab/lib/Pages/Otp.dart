
import 'package:ablecab/Pages/Form.dart';
import 'package:ablecab/Pages/Phone1.dart';
import 'package:ablecab/Pages/support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ablecab/Variables/colors.dart';
import 'package:ablecab/Variables/sizes.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';



class Otp extends StatefulWidget {
  final String verificationID;

  Otp({required this.verificationID});
  @override
  _OTPState createState() => _OTPState();
}
class _OTPState extends State<Otp>{
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  Widget build(BuildContext context) {
    void handleClick(int item) {
      switch (item) {
        case 0:
          Navigator.push(context,MaterialPageRoute(builder: (context) => Support()),);
          break;
      }
    }
    return Scaffold(
      backgroundColor: onboarding,
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert, color: Colors.black),
            color: white,
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Container(
                  width: 120,
                  height: 18,
                  child: Text(
                    'Support ?',
                    style: GoogleFonts.dmSans(
                      color: primary,
                      fontSize: MediaQuery.of(context).size.width * txt14,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
        leading: GestureDetector(child: Icon(Icons.arrow_back,color: primary,size: 20), onTap:(){
          Navigator.pushReplacement(context, PageTransition(child: Phone1(), type: PageTransitionType.leftToRight));
        } ,),

        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        ),

        backgroundColor: onboarding,
        elevation: 0,
        centerTitle: true,

      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 40),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Please enter the OTP which is sent to your Pnone number",style: GoogleFonts.dmSans(

                  color: primary,
                  fontSize: MediaQuery.of(context).size.width*txt18,

                )),
                SizedBox(height: 40,),

                Container(
                  width: 170,
                  child: TextField(
                    controller: otpController,
                    decoration: InputDecoration(

                    ),
                  ),
                )


              ],
            ),


            GestureDetector(
              onTap: (){
                verifyOTP();
              },
              child: Container(
                width: double.infinity,
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Verify",
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

    );
  }
  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      setState(() {
        user = FirebaseAuth.instance.currentUser;
      });
    }).whenComplete(() {
      if (user != null) {
        Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(),
          ),
        );
      } else{
        Fluttertoast.showToast(
          msg: "Your login has failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    },
    );
  }
}



