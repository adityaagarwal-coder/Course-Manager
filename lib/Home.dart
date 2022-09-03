import 'package:course_manager/course_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'courselistfetch.dart';
import 'drawercourselistetch.dart';
import 'googleSignIn.dart';

final user = FirebaseAuth.instance.currentUser!;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: fetchDrawerCourseList(),
        ),
        body: Stack(children: [
          Container(
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.grey, Colors.black]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)))),
          Positioned(
              left: 75,
              top: 30,
              child: Text("Courses",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold))),
          Positioned(
              left: 10,
              top: 50,
              child: InkWell(
                onTap: () {
                  setState(() {
                    scaffoldKey.currentState!.openDrawer();
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(child: Icon(Icons.menu))),
              )),
          fetchCourses()
        ]));
  }
}
