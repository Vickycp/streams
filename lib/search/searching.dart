import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:streams/video.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  final l = Getdata();
  String capital;
  
  var qureylist = [];
  var templist = [];
  initial(val) {
    if (val.length == 0) {
      setState(() {
        qureylist.clear();
        templist.clear();
      });
    }

    if (qureylist.length == 0 && val.length == 1) {
      l.search(val).then((QuerySnapshot doc) {
        for (int i = 0; i < doc.documents.length; i++) {
          qureylist.add(doc.documents[i].data);
          print(qureylist[0]['name']);
        }
      });
    } else {
      templist = [];
      qureylist.forEach((element) {
        if (element['name'].toString().startsWith(val)) {
          setState(() {
            templist.add(element);
          });
        }
      });
    }
  }

  bool istrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            autofocus: true,
            onChanged: (val) {
              initial(val);
            },
            onSubmitted: (val1) {
              print(val1 + "vicky");
              setState(() {
                istrue = false;
              });
            },
            decoration: InputDecoration(hintText: "search.."),
          ),
        ),
        body: istrue == true
            ? ListView(
                children:templist.map((ele) {
                  return Center(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Videoplayer(
                                      url: ele['url'],
                                    )));
                          },
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.search,
                                  color: Color.fromRGBO(191, 190, 186, 1),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ele['name'],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ],
                          )));
                }).toList()
              )
            : ListView(
                children: templist.map((ele) {
                return Container(
                    height: 100,
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Videoplayer(
                                  url: ele['url'],
                                )));
                      },
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              ele['image'],
                              height: 100,
                              width: 150,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 150,
                              child: Stack(children: [
                                Positioned(
                                    top: 0, left: 20, child: Text(ele['name']))
                              ]),
                            ),
                          )
                        ],
                      ),
                    ));
              }).toList()));
  }

  @override
  void dispose() {
  
    super.dispose();
  }
}

class Getdata {
  search(String data) {
    return Firestore.instance
        .collection("movie2")
        .where("search", isEqualTo: data.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}
