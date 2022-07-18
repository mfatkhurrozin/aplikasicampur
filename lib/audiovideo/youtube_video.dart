import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatelessWidget {
  static String videoID = 'T6ExZ5DztGQ';

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Video"),
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
            boxShadow: []),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text("Play Video from Youtube"),
            SizedBox(
              height: 30,
            ),
            YoutubePlayer(
              controller: _controller,
              liveUIColor: Colors.amber,
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }
}
