import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:streams/bloc/video_bloc.dart';
import 'package:streams/video.dart';
import 'package:streams/viewmore.dart';



class Homepage1 extends StatefulWidget {
  @override
  _Homepage1State createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  Firestore firestore = Firestore.instance;
final blocc=VideoBloc();


  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
        body:buildListView()
        );
  }

  ListView buildListView() {
    return ListView(
    scrollDirection: Axis.vertical,
    children: <Widget>[
      buildContainer(
          query: Firestore.instance
                    .collection("movie2").where('type',isEqualTo: "english")
                    .snapshots(),
          language: "English",
          event: Engmovies(),
          
          ),

      SizedBox(
        height: 5,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0),
            colors: [Colors.white, Colors.black],
          )),
        ),
      ),
      buildContainer(
          query:  Firestore.instance
                    .collection("movie2").where('type',isEqualTo: "kannada")
                    .snapshots(),
          language: "Kannada",
          event: Kanmovies()
          ),
      SizedBox(
        height: 5,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0),
            colors: [Colors.white, Colors.black],
          )),
        ),
      ),
      buildContainer(
          query: Firestore.instance
                    .collection("movie2").where('type',isEqualTo: "kannada")
                    .snapshots(),
          language: "Hindi",
          event: Hinmovies()
          ),
      SizedBox(
        height: 5,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0),
            colors: [Colors.white, Colors.black],
          )),
        ),
      ),
      buildContainer(
          query:  Firestore.instance
                    .collection("movie2").where('type',isEqualTo: "english")
                    .snapshots(),
          language: "etc",
        event: Etcmovies()
          ),
    ],
  );
  }

  Container buildContainer({var query, String language ,event}) {


 
    return Container(
      width: double.infinity,
      color: Colors.grey,
      height: 180,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    language,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () {
                          
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewmore1(event: event,)));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.blue, width: 2)),
                            child: Text(
                              "View more",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )))),
              ),
            ],
          ),
          Container(child: Movies(query: query)),
        ],
      ),
    );
  }
  @override
  void dispose() {
    blocc.close();
    super.dispose();
  }
  
}

class Movies extends StatefulWidget {
  Stream<QuerySnapshot> query;

  Movies({this.query});
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: widget.query,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return Container(
                width: double.infinity,
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.documents.map((doc) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              doc['image'],
                              fit: BoxFit.contain,
                              height: 100,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: Text(
                              doc['name'],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Videoplayer(
                                    url: doc['url'],
                                  )));
                        },
                      ),
                    );
                  }).toList(),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
