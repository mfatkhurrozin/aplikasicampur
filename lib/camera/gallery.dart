import 'package:flutter/material.dart';
import 'imageGallery.dart';
import 'videoGallery.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  //inisialisasi variabel
  int _currentIndex = 0;
  String _currentMenu = 'Home';

  //metod ini akan dijalankna saat diklik
  void _changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 0) {
        _currentMenu = 'Home';
      } else if (index == 1) {
        _currentMenu = 'Order';
      } else if (index == 2) {
        _currentMenu = 'Inbox';
      } else if (index == 3) {
        _currentMenu = 'Account';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Gallery"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.photo),
                  text: "Gambar",
                ),
                Tab(
                  icon: Icon(Icons.video_library),
                  text: "Video",
                ),
              ],
              indicatorColor: Colors.amber,
            ),
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
            child: TabBarView(
              children: [
                ImageGallery(),
                VideoGallery(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
