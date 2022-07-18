import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart' as path;

import 'imageCamera.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  //inisialisasi variabel
  int _currentIndex = 0;
  String _currentMenu = 'Home';

  //metod ini akan dijalankna saat diklik
  void _changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 0) {
        _pickImageFromCamera();
      } else if (index == 1) {
        _pickVideoFromCamera();
      }
    });
  }

  File _videoCamera;
  File _imageCamera;

  ImagePicker picker = ImagePicker();

  VideoPlayerController _cameraVideoPlayerController;
  XFile pickedFile;
// This funcion will helps you to pick and Image from Camera
  _pickImageFromCamera() async {
    pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    File image = File(pickedFile.path);

    setState(() {
      _imageCamera = image;
    });
    String fileDir = path.dirname(pickedFile.path);
    var dt = DateTime.now();
    var bulan;
    if (dt.month < 10) {
      bulan = '0' + dt.month.toString();
    } else {
      bulan = dt.month;
    }
    var hari;
    if (dt.day < 10) {
      hari = '0' + dt.day.toString();
    } else {
      hari = dt.day;
    }
    var jam;
    if (dt.hour < 10) {
      jam = '0' + dt.hour.toString();
    } else {
      jam = dt.hour;
    }
    var menit;
    if (dt.minute < 10) {
      menit = '0' + dt.minute.toString();
    } else {
      menit = dt.minute;
    }
    var detik;
    if (dt.second < 10) {
      detik = '0' + dt.second.toString();
    } else {
      detik = dt.second;
    }
    String newPath = path.join(
        fileDir, 'img_cmr_${dt.year}$bulan${hari}_$jam$menit$detik.jpg');
    if (pickedFile != null && image.path != null) {
      GallerySaver.saveImage(image.path, albumName: "Media")
          .then((bool success) {});
    }
    const snackBar = SnackBar(
      content: Text('Image saved to Gallery'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // This funcion will helps you to pick a Video File from Camera
  _pickVideoFromCamera() async {
    pickedFile = await picker.pickVideo(source: ImageSource.camera);

    _videoCamera = File(pickedFile.path);

    _cameraVideoPlayerController = VideoPlayerController.file(_videoCamera)
      ..initialize().then((_) {
        setState(() {});
        _cameraVideoPlayerController.play();
      });
    String fileDir = path.dirname(pickedFile.path);
    var dt = DateTime.now();
    var bulan;
    if (dt.month < 10) {
      bulan = '0' + dt.month.toString();
    } else {
      bulan = dt.month;
    }
    var hari;
    if (dt.day < 10) {
      hari = '0' + dt.day.toString();
    } else {
      hari = dt.day;
    }
    var jam;
    if (dt.hour < 10) {
      jam = '0' + dt.hour.toString();
    } else {
      jam = dt.hour;
    }
    var menit;
    if (dt.minute < 10) {
      menit = '0' + dt.minute.toString();
    } else {
      menit = dt.minute;
    }
    var detik;
    if (dt.second < 10) {
      detik = '0' + dt.second.toString();
    } else {
      detik = dt.second;
    }
    String newPath = path.join(
        fileDir, 'vid_cmr_${dt.year}$bulan${hari}_$jam$menit$detik.mp4');
    File image = File(pickedFile.path).renameSync(newPath);
    if (pickedFile != null && image.path != null) {
      GallerySaver.saveVideo(image.path, albumName: "Media")
          .then((bool success) {});
    }
    const snackBar = SnackBar(
      content: Text('Video saved to Gallery'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera"),
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
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Camera',
        child: Icon(Icons.camera),
        backgroundColor: Colors.blue[400],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        //membuat item navigasi
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_outlined), label: 'Camera'),
          BottomNavigationBarItem(
              icon: Icon(Icons.videocam_outlined), label: 'Video'),
        ],

        //currentindex mengikuti baris item bottom navigasi yang diklik
        currentIndex: _currentIndex,

        //warna saat item diklik
        selectedItemColor: Colors.blue,

        //metode yang dijalankan saat ditap
        onTap: _changeSelectedNavBar,

        //agar bottom navigation tidak bergerak saat diklik
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
