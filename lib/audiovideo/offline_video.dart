import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OfflineVideo extends StatefulWidget {
  OfflineVideo({Key key}) : super(key: key);

  @override
  _OfflineVideoState createState() => _OfflineVideoState();
}

class _OfflineVideoState extends State<OfflineVideo> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/nopal.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Offline Video"),
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              //jumlah stop berbanding lurus dengan jumlah warna
              stops: [0.3, 0.6, 0.9],
              colors: [
                Color.fromRGBO(12, 235, 235, 1),
                Color.fromRGBO(32, 227, 178, 1),
                Color.fromRGBO(41, 255, 198, 1),
              ],
            ),
            boxShadow: [],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text("Play Video"),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 200,
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  child: Icon(_controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow)),
            ],
          ),
        ));
  }
}
