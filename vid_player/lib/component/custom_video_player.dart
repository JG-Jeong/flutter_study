import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;

  const CustomVideoPlayer({required this.video, Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeController();
  }

  initializeController() async {
    videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController!.initialize();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return CircularProgressIndicator();
    }

    return AspectRatio(
      aspectRatio: videoController!.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            videoController!,
          ),
          _Controls(
            onForwardPressed: onForwardPressed,
            onPlayPressed: onPlayPressed,
            onReversePressed: onReversePressed,
            isPlaying: videoController!.value.isPlaying,
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {},
              color: Colors.white,
              iconSize: 30.0,
              icon: Icon(
                Icons.photo_camera_back,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onReversePressed() {
    //1 현재의 위치를 아는법? videoControlloer!.value.position
    final currentPosition = videoController!.value.position;
    
    videoController!.seekTo()
  }

  void onForwardPressed() {

  }

  void onPlayPressed() {
    setState(() {
      if(videoController!.value.isPlaying){
        videoController!.pause();
      }else{
        videoController!.play();
      }
    });
  }
}

class _Controls extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _Controls(
      {required this.onPlayPressed,
      required this.onReversePressed,
      required this.onForwardPressed,
      required this.isPlaying,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          renderIconButton(
              onPressed: onReversePressed, IconData: Icons.rotate_left),
          renderIconButton(
              onPressed: onPlayPressed,
              IconData: isPlaying ? Icons.pause : Icons.play_arrow),
          renderIconButton(
              onPressed: onForwardPressed, IconData: Icons.rotate_right),
        ],
      ),
    );
  }

  Widget renderIconButton({
    required VoidCallback onPressed,
    required IconData IconData,
  }) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 30.0,
      color: Colors.white,
      icon: Icon(
        IconData,
      ),
    );
  }
}
