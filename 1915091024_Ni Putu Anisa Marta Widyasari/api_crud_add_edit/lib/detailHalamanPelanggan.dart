import 'package:tokoku/dashboard.dart';
import 'package:tokoku/pelanggan.dart';
import 'package:flutter/material.dart';
import 'editDataPelanggan.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'pelanggan.dart';

class detailHalamanPelanggan extends StatefulWidget {
  List list;
  int index;
  detailHalamanPelanggan({@required this.list, @required this.index});

  @override
  _detailHalamanPelangganState createState() => _detailHalamanPelangganState();
}

class _detailHalamanPelangganState extends State<detailHalamanPelanggan> {
  void hapusData() {
    http.post(Uri.parse("http://192.168.1.2/tokoku/hapusdatapelanggan.php"),
        body: {'id': widget.list[widget.index]['id']});
    ;
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Anda yakin ingin menghapus? '${widget.list[widget.index]['namapelanggan']}'"),
      actions: <Widget>[
        new RaisedButton(
            child: new Text("Ya"),
            onPressed: () {
              hapusData();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pelanggan()));
            }),
        new RaisedButton(
          child: new Text("Tidak"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purple[400],
        title: new Text(widget.list[widget.index]['namapelanggan']),
      ),
      body: new Container(
        child: new Card(
          child: new Center(
            child: Column(
              children: <Widget>[
                new Padding(
                    padding: const EdgeInsets.only(
                  top: 15.0,
                )),
                new Icon(Icons.person, size: 45),
                new Padding(
                    padding: const EdgeInsets.only(
                  bottom: 15.0,
                )),
                new Text(widget.list[widget.index]['namapelanggan']),
                new Text("No HP: " + widget.list[widget.index]['nohp']),
                new Text("Alamat: " + widget.list[widget.index]['alamat']),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new editDataPelanggan(
                                      list: widget.list,
                                      index: widget.index,
                                    ))),
                        child: new Text("Edit")),
                    new Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                    ),
                    new ElevatedButton(
                        onPressed: () => confirm(), child: new Text("Hapus")),
                  ],
                )
              ],
            ),
          ),
        ),
      ), //
    );
  }
}
