import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class OnlineMusic extends StatelessWidget {
  AudioPlayer advancedplayer1 = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Music"),
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
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Play Musik",
            ),
            Image(image: AssetImage("assets/OSOD.gif")),
            ListTile(
              //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Icon(
                      Icons.play_arrow,
                    ),
                    onPressed: () async {
                      //await player.setUrl(
                      //    'http://ia802609.us.archive.org/13/items/quraninindonesia/001AlFaatihah.mp3');
                      //player.play();
                      await advancedplayer1.play(
                          'https://ia802609.us.archive.org/13/items/quraninindonesia/112AlIkhlash.mp3',
                          isLocal: false);
                    },
                  ),
                  ElevatedButton(
                    child: Icon(
                      Icons.pause,
                    ),
                    onPressed: () async {
                      advancedplayer1.pause();
                    },
                  ),
                  ElevatedButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: () async {
                      advancedplayer1.resume();
                    },
                  ),
                  ElevatedButton(
                    child: Icon(
                      Icons.stop,
                    ),
                    onPressed: () async {
                      advancedplayer1.stop();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
