import 'package:ablecab/Pages/Otp.dart';
import 'package:ablecab/Pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ablecab/Variables/colors.dart';
import 'package:ablecab/Variables/sizes.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Phone1 extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<Phone1>{
  TextEditingController phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: onboarding,
        appBar: AppBar(
          leading: GestureDetector(child: Icon(Icons.arrow_back,color: primary,size: 20), onTap:(){
            Navigator.pushReplacement(context, PageTransition(child: MyHomePage(), type: PageTransitionType.leftToRight));
          } ,),

          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent
          ),
          backgroundColor: onboarding,
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Container(
              height:  MediaQuery.of(context).size.height*appbarimgh,
              child: Image.asset('assets/Appbar.png'),
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 40),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter your Phone Number for verification",style: GoogleFonts.dmSans(

                    color: primary,
                    fontSize: MediaQuery.of(context).size.width*txt18,

                  )),
                  SizedBox(height: 20,),
                  Text("This Phone number will be used for all ride-related and other communication. You shall receive an SMS with a code for verification.",
                    style: GoogleFonts.dmSans(
                        fontSize: MediaQuery.of(context).size.width*(3.15/100),
                        color: black.withOpacity(0.53)
                    ),


                  ),


                  SizedBox(height: 40,),

                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.flag_rounded),
                        label: Text("Your Phone number", style: TextStyle(color: subtitle),)
                    ),
                  )


                ],
              ),


              GestureDetector(
                onTap: (){
                  if(otpVisibility){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Otp(verificationID:verificationID)
                        )
                    );
                  }else{
                    loginWithPhone();
                  }
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
    );
  }
  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
