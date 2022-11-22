import 'package:counter_7/page/detail_mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/drawer/drawer.dart';

import '../dataSource/mywatchlist_remote_dataSource.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({Key? key}) : super(key: key);

  @override
  _MyWatchListPageState createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  late Future<List<MyWatchList>> myWatchList;

  @override
  void initState() {
    super.initState();
    myWatchList = fetchMyWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffCDFCF6),
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        // Drawer navbar
        drawer: MyDrawer(),
        body: FutureBuilder(
            future: myWatchList,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada MyWatchList :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          // Navigasi dari setiap judul watch list ke halaman detail
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyWatchDetail(
                                    myWatch: snapshot.data![index])),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          // Menambahkan warna untuk outline pada setiap mywatchlist pada halaman mywatchlist berdasarkan status ditonton
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.5,
                              color: ((snapshot.data![index].fields.watched)
                                  ? Colors.deepPurple
                                  : Colors.red)
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey, blurRadius: 0.5)
                              ]),
                        child:
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                // Menambahkan checkbox pada setiap watchlist pada halaman mywatchlist.
                                child: CheckboxListTile(
                                    value : snapshot.data![index].fields.watched,
                                    onChanged: (bool?value) {
                                      setState(() {
                                        snapshot.data![index].fields
                                            .watched =
                                        !snapshot.data![index].fields
                                            .watched;
                                      });
                                    }),
                              )
                            ],
                          ),
                        ),
                      ));
                }
              }
            }));
  }
}