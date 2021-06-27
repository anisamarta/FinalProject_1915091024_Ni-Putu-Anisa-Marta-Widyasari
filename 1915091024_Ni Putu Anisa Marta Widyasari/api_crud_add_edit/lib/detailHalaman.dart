import 'package:tokoku/dashboard.dart';
import 'package:tokoku/produk.dart';
import 'package:flutter/material.dart';
import 'editData.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class detailHalaman extends StatefulWidget {
  List list;
  int index;
  detailHalaman({@required this.list, @required this.index});

  @override
  _detailHalamanState createState() => _detailHalamanState();
}

class _detailHalamanState extends State<detailHalaman> {
  void hapusData() {
    http.post(Uri.parse("http://192.168.1.2/tokoku/hapusdata.php"),
        body: {'id': widget.list[widget.index]['id']});
    ;
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Anda yakin ingin menghapus? '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new RaisedButton(
            child: new Text("Ya"),
            onPressed: () {
              hapusData();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => produk()));
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
        title: new Text(widget.list[widget.index]['nama']),
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
                new Icon(
                  Icons.widgets,
                  size: 45,
                ),
                new Padding(
                    padding: const EdgeInsets.only(
                  top: 15.0,
                )),
                new Text(widget.list[widget.index]['nama']),
                new Text("Kode: " + widget.list[widget.index]['kode']),
                new Text("Harga: " + widget.list[widget.index]['harga']),
                new Text("Stok: " + widget.list[widget.index]['stok']),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new editData(
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
      ),
    );
  }
}
