import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'detailHalamanPelanggan.dart';
import 'addDataPelanggan.dart';
import 'dashboard.dart';

class pelanggan extends StatefulWidget {
  @override
  _pelangganState createState() => _pelangganState();
}

class _pelangganState extends State<pelanggan> {
  Future<List> ambilDatapelanggan() async {
    var data = await http
        .get(Uri.parse("http://192.168.1.2/tokoku/ambildatapelanggan.php"));
    var jsonData = json.decode(data.body);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard())),
        ),
        backgroundColor: Colors.purple[400],
        title: Text("LIST PELANGGAN"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new addDataPelanggan())),
        child: new Icon(Icons.add),
      ),
      body: Container(
        color: Colors.purple[100],
        child: FutureBuilder(
          future: ambilDatapelanggan(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading. . . . ."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new detailHalamanPelanggan(
                                    list: snapshot.data,
                                    index: index,
                                  ))),
                      child: new Card(
                        child: new ListTile(
                          title:
                              new Text(snapshot.data[index]['namapelanggan']),
                          leading: new Icon(
                            Icons.person,
                            size: 45,
                          ),
                          subtitle:
                              new Text("NoHP: " + snapshot.data[index]['nohp']),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
