import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
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
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "DIBUAT OLEH :",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blue.withOpacity(1.0),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Muhammad Fatkhurrozin /20.240.0004',
                  style: TextStyle(fontSize: 17.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Menik Wijayanti /20.240.0138',
                  style: TextStyle(fontSize: 17.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rohmatun Nisa /20.240.0139',
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
