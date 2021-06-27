import 'package:tokoku/produk.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addData extends StatefulWidget {
  @override
  _addDataState createState() => _addDataState();
}

class _addDataState extends State<addData> {
  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerStok = new TextEditingController();

  void simpanData() {
    http.post(Uri.parse("http://192.168.1.2/tokoku/adddata.php"), body: {
      "kodeBarang": controllerKode.text,
      "namaBarang": controllerNama.text,
      "hargaBarang": controllerHarga.text,
      "stokBarang": controllerStok.text,
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
                  controller: controllerKode,
                  decoration: new InputDecoration(
                      hintText: "Kode Barang", labelText: "Kode Barang"),
                ),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Nama Barang", labelText: "Nama Barang"),
                ),
                new TextField(
                  controller: controllerHarga,
                  decoration: new InputDecoration(
                      hintText: "Harga Barang", labelText: "Harga Barang"),
                ),
                new TextField(
                  controller: controllerStok,
                  decoration: new InputDecoration(
                      hintText: "Stok Barang", labelText: "Stok Barang"),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new ElevatedButton(
                    onPressed: () {
                      simpanData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => produk()));
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
