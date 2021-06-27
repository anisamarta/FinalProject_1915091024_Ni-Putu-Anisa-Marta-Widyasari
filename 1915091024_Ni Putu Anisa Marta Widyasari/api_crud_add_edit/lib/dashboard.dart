import 'package:tokoku/pelanggan.dart';
import 'package:flutter/material.dart';
import 'produk.dart';
import 'pelanggan.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.purple[400],
            title: new Text("Dashboard"),
            actions: [new Icon(Icons.search)]),
        body: Container(
          color: Colors.purple[100],
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Image(
                    image: NetworkImage(
                        "https://19q7551ambqw2mmar832vpwd-wpengine.netdna-ssl.com/wp-content/uploads/2020/10/ASUS-2020-PBA-Banner-Power-1-1700x618.jpg"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: 160,
                          height: 70,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    new Icon(Icons.shopping_bag_outlined,
                                        size: 35),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    Text("Produk"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(builder: (context) {
                              return produk();
                            }),
                          );
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: 160,
                          height: 70,
                          //color: Colors.red,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    new Icon(Icons.person, size: 35),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    Text("Pelanggan"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(builder: (context) {
                              return pelanggan();
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
