import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'catatan.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController judulController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController idController = TextEditingController();

  addData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('catatan').doc(idController.text);

    // create Map to send data in key:value pair form
    Map<String, dynamic> ctt = ({
      "id": idController.text,
      "judul": judulController.text,
      "detail": detailController.text
    });

    // send data to Firebase
    documentReference
        .set(ctt)
        .whenComplete(() => print('${idController.text} created'));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catatan"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(
            16.0,
          ),
          child: Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: null,
                      autofocus: true,
                      controller: idController,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration.collapsed(
                        hintText: "No Catatan",
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      maxLines: null,
                      autofocus: true,
                      controller: judulController,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration.collapsed(
                        hintText: "Title",
                      ),
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: detailController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration.collapsed(
                        hintText: "Type something...",
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addData();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return Catatan();
            }),
            (Route<dynamic> route) => false,
          );
        },
        label: Text("Save"),
        icon: Icon(Icons.save),
      ),
    );
  }
}
