import 'package:flutter/material.dart';
import 'package:counter_7/page/formBudget.dart';
import 'package:counter_7/page/dataBudget.dart';
import 'package:counter_7/main.dart';

import '../page/page_mywatchlist.dart';

class MyDrawer extends StatefulWidget {
  var theBudget;
  MyDrawer({super.key, this.theBudget});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // Agar bagian atas tampilan layar ada jaraknya
        child: SafeArea( 
          child: Column(
            children: [
              // Bagian drawer counter_7
              ListTile(
                title: const Text("counter_7", style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
              ),
              // Bagian drawer tambah budget
              ListTile(
                title:
                    const Text("Tambah Budget", style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const FormBudget()),
                  );
                },
              ),
              // Bagian drawer data budget
              ListTile(
                title: const Text("Data Budget", style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DataBudget(myBudget: widget.theBudget)),
                  );
                },
              ),
              // Bagian drawer my watchlist
              ListTile(
                title: 
                  const Text("My Watch List", style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Created By: Hayfa Najma
