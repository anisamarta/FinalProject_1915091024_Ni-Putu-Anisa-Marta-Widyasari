import 'package:tokoku/produk.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class editData extends StatefulWidget {
  List list;
  int index;
  editData({@required this.list, @required this.index});

  @override
  _editDataState createState() => _editDataState();
}

class _editDataState extends State<editData> {
  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerStok = new TextEditingController();

  @override
  void initState() {
    controllerKode.text = widget.list[widget.index]['kode'];
    controllerNama.text = widget.list[widget.index]['nama'];
    controllerHarga.text = widget.list[widget.index]['harga'];
    controllerStok.text = widget.list[widget.index]['stok'];
    super.initState();
  }

  void editData() {
    http.post(Uri.parse("http://192.168.1.2/tokoku/editdata.php"), body: {
      "kodeBarang": controllerKode.text,
      "namaBarang": controllerNama.text,
      "hargaBarang": controllerHarga.text,
      "stokBarang": controllerStok.text,
      "id": widget.list[widget.index]['id'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purple[400],
        title: new Text("Edit Data"),
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
                      editData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => produk()));
                    },
                    child: new Text("Edit"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
