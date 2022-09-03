import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_manager/course_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './videoplayer.dart';
import 'Home.dart';
import 'googleSignIn.dart';
import 'webview.dart';

Widget fetchDrawerCourseList() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection("Courses").snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }

      return Expanded(
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.grey])),
                child: Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(user.photoURL!)),
                          SizedBox(width: 10),
                          Text(user.displayName!,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(user.email!,
                              style: TextStyle(color: Colors.white))
                        ],
                      )
                    ],
                  ),
                )),
            ListView.builder(
                shrinkWrap: true,
                itemCount:
                    snapshot.data == null ? 0 : snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  DocumentSnapshot _documentSnapshot =
                      snapshot.data!.docs[index];

                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CoursePage(
                                coursename: _documentSnapshot['CourseName'])));
                      },
                      child: Container(
                        height: 50,
                        child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(padding:EdgeInsets.symmetric(horizontal:20),
                              child: Row(children: [
                                Image.network(_documentSnapshot['Image']),
                                SizedBox(width:50),
                                Text(_documentSnapshot['CourseName'],style:TextStyle(fontSize:20,fontWeight:FontWeight.bold))
                              ]),
                            )),
                      ));
                }),
            ListTile(
                onTap: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                title: Text("LogOut"))
          ],
        ),
      );
    },
  );
}
