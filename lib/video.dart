import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:flutter/material.dart';




class Videoplayer extends StatefulWidget {
final String url;

Videoplayer({this.url});

  @override
  _VideoplayerState createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {

  @override
  Widget build(BuildContext context) {
   
      return Scaffold(
       
        body: Align(
          
            alignment: Alignment.center,
            child: AwsomeVideoPlayer(
          
              
              widget.url,
  
              playOptions: VideoPlayOptions(
                
                seekSeconds: 30,
                aspectRatio: 16 / 9,
                autoplay: true,
                allowScrubbing: true,
                startPosition: Duration(seconds: 0)),
          
              videoStyle: VideoStyle(

           


              videoTopBarStyle: VideoTopBarStyle(

                popIcon: IconButton(iconSize: 25,color: Colors.white,icon: Icon(Icons.arrow_back), onPressed: (){
                  Navigator.pop(context);
                })
              ),
              
                videoControlBarStyle: VideoControlBarStyle(
 

                  progressStyle: VideoProgressStyle(
        playedColor: Colors.red,
        bufferedColor: Colors.grey,
        
        
               
        
                  ),
                
                  playIcon: Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: 25
                  ),
              
                  pauseIcon: Icon(
        Icons.pause,
        color: Colors.red,
        size: 25,
                  ),
               
                  rewindIcon: Icon(
        Icons.replay_30,
        size: 25,
        color: Colors.white,
                  ),
               
                  forwardIcon: Icon(
        Icons.forward_30,
        size: 25,
        color: Colors.white,
                  ),
          
                  fullscreenIcon: Icon(
        Icons.fullscreen,
        size: 25,
        color: Colors.white,
                  ),
                
                  fullscreenExitIcon: Icon(
        Icons.fullscreen_exit,
        size: 25,
        color: Colors.red,
                  ),
                ),
              ),
              // onpop:(v){

              
              // } ,
            ),
          ),
                  );
                
              }
           
}