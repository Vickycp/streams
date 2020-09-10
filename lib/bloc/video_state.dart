part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();
   @override
  List<Object> get props => [];
}

class VideounInitial extends VideoState {
 
}

class VideoEnglish extends VideoState{
final query;
  VideoEnglish({this.query});
}

class VideoKannada extends VideoState{
final query;
  VideoKannada({this.query});
}


class VideoHindi extends VideoState{
final query;
  VideoHindi ({this.query});
}

class Videoetc extends VideoState{
final query;
  Videoetc ({this.query});
}

