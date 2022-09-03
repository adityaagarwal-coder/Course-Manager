import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './videoplayer.dart';
import 'course_page.dart';

Widget fetchCourses() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection("Courses").snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }

      return Container(
          padding: EdgeInsets.only(top: 100),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10),
              itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CoursePage(
                            coursename: _documentSnapshot['CourseName'])));
                  },
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            _documentSnapshot['Image'],
                            width: 100,
                            height: 100,
                          ),
                          Text(_documentSnapshot['CourseName'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                );
              }));
    },
  );
}
