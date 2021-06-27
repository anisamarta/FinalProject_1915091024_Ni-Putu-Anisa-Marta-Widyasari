import 'package:tokoku/pelanggan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addDataPelanggan extends StatefulWidget {
  @override
  _addDataPelangganState createState() => _addDataPelangganState();
}

class _addDataPelangganState extends State<addDataPelanggan> {
  TextEditingController controllerNamapelanggan = new TextEditingController();
  TextEditingController controllerNohp = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();

  void simpanData() {
    http.post(Uri.parse("http://192.168.1.2/tokoku/adddatapelanggan.php"),
        body: {
          "namapelanggan": controllerNamapelanggan.text,
          "nohp": controllerNohp.text,
          "alamat": controllerAlamat.text,
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purple[400],
        title: new Text("Menambahkan Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNamapelanggan,
                  decoration: new InputDecoration(
                      hintText: "Nama Pelanggan", labelText: "Nama Pelanggan"),
                ),
                new TextField(
                  controller: controllerNohp,
                  decoration: new InputDecoration(
                      hintText: "No HP", labelText: "No HP"),
                ),
                new TextField(
                  controller: controllerAlamat,
                  decoration: new InputDecoration(
                      hintText: "Alamat", labelText: "Alamat"),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new ElevatedButton(
                    onPressed: () {
                      simpanData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pelanggan()));
                    },
                    child: new Text("Simpan"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
