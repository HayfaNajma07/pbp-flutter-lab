import 'package:counter_7/drawer/drawer.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/page_mywatchlist.dart';

class MyWatchDetail extends StatefulWidget {
  const MyWatchDetail({super.key, required this.myWatch});

  final MyWatchList myWatch;

  @override
  State<MyWatchDetail> createState() => _MyWatchDetailState();
}

class _MyWatchDetailState extends State<MyWatchDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDFCF6),
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: MyDrawer(),
      body: Container(
          padding: const EdgeInsets.all(20),
          height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.myWatch.fields.title,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          // Release Date
                          const TextSpan(
                              text: '\nRelease Date: ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '${widget.myWatch.fields.release_date}\n',
                              style: const TextStyle(
                                  fontSize: 20)),
                          // Rating
                          const TextSpan(
                              text: '\nRating: ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '${widget.myWatch.fields.rating}/5\n',
                              style: const TextStyle(
                                fontSize: 20)),
                          // Watched
                          const TextSpan(
                              text: '\nStatus: ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          TextSpan(
                              style: TextStyle(fontSize: 20),
                              text: (widget.myWatch.fields.watched == "Yes")
                                  ? "watched\n"
                                  : "unwatched\n"),
                          // Review
                          const TextSpan(
                              text: '\nReview: \n',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '${widget.myWatch.fields.review}\n',
                              style: const TextStyle(
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  // Button Back
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyWatchListPage()),
                        );
                      },
                      child: const SizedBox(
                          height: 30,
                          width: 900,
                          child: Center(
                            child: Text(
                              "Back",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ))),
                ),
              ]),
            ],
          ),
      ),
    );
  }
}
