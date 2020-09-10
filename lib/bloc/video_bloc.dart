import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  @override
  VideoState get initialState => VideounInitial();

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if(event is Engmovies){
    
      yield VideoEnglish(query: Firestore.instance
                    .collection("movie2").where('type',isEqualTo: "english")
                    .snapshots());
          }else if(event is Kanmovies){

      yield VideoKannada(query:  Firestore.instance
                    .collection("movie2").where('type',isEqualTo: "kannada")
                    .snapshots());

          }else if(event is Hinmovies){

      yield VideoHindi(query: Firestore.instance
                    .collection("movie2").where('type',isEqualTo: "kannada")
                    .snapshots());

          }else if(event is Etcmovies){

      yield Videoetc(query:  Firestore.instance
                    .collection("movie2").where('type',isEqualTo: "english")
                    .snapshots());
          }
  }
      
      
}
