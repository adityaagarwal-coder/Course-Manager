import 'package:course_manager/Home.dart';
import 'package:course_manager/course_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'googleSignIn.dart';
import 'sign_in_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>GoogleSignInProvider(),
      child: MaterialApp(
        home: SignInPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

