import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'catatan.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController idController;
  TextEditingController judulController;
  TextEditingController detailController;

  void editData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('catatan').doc(idController.text);

    Map<String, dynamic> mhs = ({
      "id": idController.text,
      "judul": judulController.text,
      "detail": detailController.text,
    });

    // update data to Firebase
    documentReference
        .update(mhs)
        .whenComplete(() => print('${idController.text} updated'));
  }

  void deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('catatan').doc(idController.text);

    // delete data from Firebase
    documentReference
        .delete()
        .whenComplete(() => print('${idController.text} deleted'));
  }

  void konfirmasi() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Apakah anda yakin akan menghapus data '${widget.list[widget.index]['judul']}'"),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          child: Text(
            "OK DELETE!",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            deleteData();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Catatan()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: Text("CANCEL", style: TextStyle(color: Colors.black)),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  void initState() {
    idController = TextEditingController(text: widget.list[widget.index]['id']);
    judulController =
        TextEditingController(text: widget.list[widget.index]['judul']);
    detailController =
        TextEditingController(text: widget.list[widget.index]['detail']);
    super.initState();
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
                        enabled: true,
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
                        height: 20,
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: Colors.green,
                heroTag: "btn",
                onPressed: () {
                  editData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Catatan()),
                  );
                },
                child: Icon(Icons.save),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                backgroundColor: Colors.red,
                heroTag: "btn2",
                onPressed: () {
                  konfirmasi();
                },
                child: Icon(Icons.delete),
              )
            ],
          ),
        ));
  }
}
