import 'package:flutter/material.dart';

import 'drawer/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; //Private variable
  String result = 'GENAP';
  bool isShowButton = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if ((_counter - 1) == -1) {
        _counter = 0;
      } else {
        _counter--;
      }
    });
  }

  // Mengecek nilai counter apakah genap atau ganjil
  void _checkCounter() {
    setState(() {
      if ((_counter % 2) == 0) {
        result = 'GENAP';
      } else {
        result = 'GANJIL';
      }
    });
  }

  // Untuk menyembunyikan tombol - apabila counter bernilai 0.
  void _showButton() {
    setState(() {
      if (_counter == 0) {
        isShowButton = false;
      } else {
        isShowButton = true;
      }
    });
  }

  // Untuk memunculkan text sesuai result
  Text showTextIndicator() {
    // Jika hasil sama dengan GANJIL
    if (result == 'GANJIL') {
      return Text(
        result,
        style: const TextStyle(color: Colors.blue),
      );
      // Jika hasil sama dengan GENAP
    } else {
      return Text(
        result,
        style: const TextStyle(color: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDFCF6),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showTextIndicator(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 35, bottom: 20, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
                visible: isShowButton,
                child: FloatingActionButton(
                  onPressed: () {
                    _decrementCounter();
                    _checkCounter();
                    _showButton();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                )),
            Expanded(child: Container()),
            FloatingActionButton(
              onPressed: () {
                _incrementCounter();
                _checkCounter();
                _showButton();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

// Created By: Hayfa Najma
