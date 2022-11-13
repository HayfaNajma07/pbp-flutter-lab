import 'package:flutter/material.dart';
import 'package:counter_7/formBudget.dart';
import 'package:counter_7/dataBudget.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String result = 'GENAP';
  bool isShowButton = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
  void _showButton(){
    setState((){
      if(_counter == 0){
        isShowButton = false;
      } else{
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xffCDFCF6),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(top: 45.0),
          child: Column(
            children: [
              ListTile(
                title: const Text("counter_7", style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: 'Program Counter')),
                  );
                },
              ),
              ListTile(

                title: const Text("Tambah Budget", style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const FormBudget()),
                  );
                },
              ),
              ListTile(
                title: const Text("Data Budget", style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DataBudget()));
                },
              )
            ],
          ),
        )
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
                child: FloatingActionButton(onPressed: (){
                  _decrementCounter();
                  _checkCounter();
                  _showButton();
                },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                )),
            Expanded(child: Container()),
            FloatingActionButton(onPressed: (){
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