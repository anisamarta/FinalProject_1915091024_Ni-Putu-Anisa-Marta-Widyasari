import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pelanggan.dart';

class editDataPelanggan extends StatefulWidget {
  List list;
  int index;
  editDataPelanggan({@required this.list, @required this.index});

  @override
  _editDataPelangganState createState() => _editDataPelangganState();
}

class _editDataPelangganState extends State<editDataPelanggan> {
  TextEditingController controllerNamapelanggan = new TextEditingController();
  TextEditingController controllerNohp = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  @override
  void initState() {
    controllerNamapelanggan.text = widget.list[widget.index]['namapelanggan'];
    controllerNohp.text = widget.list[widget.index]['nohp'];
    controllerAlamat.text = widget.list[widget.index]['alamat'];
    super.initState();
  }

  void editData() {
    http.post(Uri.parse("http://192.168.1.2/tokoku/editdatapelanggan.php"),
        body: {
          "namapelanggan": controllerNamapelanggan.text,
          "nohp": controllerNohp.text,
          "alamat": controllerAlamat.text,
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
                  controller: controllerNamapelanggan,
                  decoration: new InputDecoration(
                      hintText: "Nama Pelanggan", labelText: "Nama Pelanggan"),
                ),
                new TextField(
                  controller: controllerNohp,
                  decoration: new InputDecoration(
                      hintText: "No Hp", labelText: "No Hp"),
                ),
                new TextField(
                  controller: controllerAlamat,
                  decoration: new InputDecoration(
                      hintText: "Alamat", labelText: "Alamat"),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new ElevatedButton(
                    onPressed: () {
                      editData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pelanggan()));
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
