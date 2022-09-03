import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './videoplayer.dart';
import 'webview.dart';

Widget fetchVideos(String collectionName) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }

      return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
          itemBuilder: (_, index) {
            DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];

            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        WebView(video: _documentSnapshot['video'])));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                    height: 80,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                        child: Text(_documentSnapshot['Name'],
                            style: TextStyle(fontWeight: FontWeight.bold)))),
              ),
            );
          });
    },
  );
}
