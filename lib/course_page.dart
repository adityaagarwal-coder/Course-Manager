import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'videofetch.dart';

class CoursePage extends StatefulWidget {
  // const CoursePage({Key? key}) : super(key: key);
  String coursename;
  CoursePage({required this.coursename});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.grey,Colors.black]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)))),
        Positioned(
          left: 75,
          top: 30,
          child: Text("Modules",
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
                  Navigator.pop(context);
                });
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(child: Icon(Icons.arrow_back))),
            )),
        Container(
            padding: EdgeInsets.only(top: 150),
            child: fetchVideos(widget.coursename))
      ]),
    );
  }
}
