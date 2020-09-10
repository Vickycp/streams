import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streams/bloc/video_bloc.dart';
import 'package:streams/video.dart';

class Viewmore1 extends StatefulWidget {
  final event;
  Viewmore1({this.event});

  @override
  _Viewmore1State createState() => _Viewmore1State();
}

class _Viewmore1State extends State<Viewmore1> {
  final bloc1 = VideoBloc();

  @override
  void initState() {
    super.initState();
    bloc1.add(widget.event);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc1,
        builder: (context, state) {
          if (state is VideoEnglish) {
            return buildScaffold(state);
          } 
          else if (state is VideoKannada) {
            return buildScaffold(state);
          } 
           else if (state is VideoHindi) {
            return buildScaffold(state);
          } 
           else if (state is Videoetc) {
            return buildScaffold(state);
          } 
          else {
            return LinearProgressIndicator();
          }
        });
  }

  Scaffold buildScaffold(state) {
    return Scaffold(
            appBar: AppBar(),
            body: StreamBuilder<QuerySnapshot>(
                stream: state.query,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var doc = snapshot.data.documents;
                    return ListView.builder(
                      itemCount: doc.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                                                        child: Stack(children: [
                              Container(
                                height: 150,
                                width: 200,

                                child: Image.network(
                                  doc[index]['image'],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 230,
                                child: Text(doc[index]['name'],style: TextStyle(fontWeight: FontWeight.bold),)),
                            ]),
                            onTap: (){

                              Navigator.push(context,MaterialPageRoute(builder: (context)=>Videoplayer(url: doc[index]['url'],)));
                            },
                          ),
                        
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          );
  }

  @override
  void dispose() {
    bloc1.close();
    super.dispose();
  }
}
