import 'package:ablecab/Pages/Otp.dart';
import 'package:ablecab/Pages/Phone1.dart';
import 'package:ablecab/Pages/homepage.dart';
import 'package:ablecab/Pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ablecab/Pages/support.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}

