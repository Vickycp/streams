import 'package:flutter/material.dart';
import 'package:streams/homepage.dart';
import 'package:streams/search/searching.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STREAMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController search;
  int _currentindex =0;

   final tabs=[
    Homepage1()
    ,
      Container(
       child: Center(child: Text("profile"),),
     )
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("STREAMS",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          actions: <Widget>[
            
            
            IconButton(icon: Icon(Icons.search), onPressed:(){
                                 
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Searching()));
               
            }),
            IconButton(icon: Icon(Icons.notifications), onPressed:(){})],
          backgroundColor: Color.fromRGBO(24, 179, 214, 1),
          bottom: PreferredSize(
              child: Column(
                children: <Widget>[
                  
                 
                  Container(
                    height: 40,
                    // color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(207, 204, 204, 1),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                                hoverColor: Colors.blue,
                                highlightColor: Colors.white,
                                splashColor: Colors.black,
                                onTap: () {
                                  print("hover");
                                },
                                child: Center(child: Text("All")))),
                        Container(
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(207, 204, 204, 1),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                                hoverColor: Colors.blue,
                                highlightColor: Colors.white,
                                splashColor: Colors.black,
                                onTap: () {
                                  print("hover");
                                },
                                child: Center(child: Text("Actoin")))),
                        Container(
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(207, 204, 204, 1),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                                hoverColor: Colors.blue,
                                highlightColor: Colors.white,
                                splashColor: Colors.black,
                                onTap: () {
                                  print("hover");
                                },
                                child: Center(child: Text("Love")))),
                        Container(
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(207, 204, 204, 1),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                                child: Center(child: Text("Romantic")))),
                        Container(
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(207, 204, 204, 1),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                                hoverColor: Colors.blue,
                                highlightColor: Colors.white,
                                splashColor: Colors.black,
                                onTap: () {
                                  print("hover");
                                },
                                child: Center(child: Text("Horrer")))),
                        Container(
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(207, 204, 204, 1),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                                hoverColor: Colors.blue,
                                highlightColor: Colors.white,
                                splashColor: Colors.black,
                                onTap: () {
                                  print("hover");
                                },
                                child: Center(child: Text("Thrilling")))),

                      ],
                    ),
                  )
                ],
              ),
              preferredSize: Size.fromHeight(40)),
        ),
        body:tabs[_currentindex],
        
       bottomNavigationBar:BottomNavigationBar(
         
         currentIndex: _currentindex,
         onTap: (index){
           setState(() {
             _currentindex=index;
           });
         },
         items: [
                BottomNavigationBarItem(icon:Icon(Icons.home) ,title: Text("home")
                ),
                BottomNavigationBarItem(icon:Icon(Icons.person) ,title: Text("profile")
                ),




       ])
        );
  }
}
