import 'package:flutter/material.dart';
import 'package:counter_7/formBudget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget.dart';

class DataBudget extends StatefulWidget {
  var myBudget;
  DataBudget({super.key, this.myBudget});

  @override
  State<DataBudget> createState() => _DataBudgetState();
}

class _DataBudgetState extends State<DataBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCDFCF6),
      appBar: AppBar(
        title: Text("Data Budget"),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DataBudget()));
                },
              )
            ],
          ),
        )
      ),

      body:
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(left: 10, right: 10),

        child: Column(
          children: [
            if (widget.myBudget == null)
              const Center(
                child: Text("Data Kosong",
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold, height: 5)),
              )
            else if (widget.myBudget.length == 0)
              const Center(
                child: Text("Data Kosong",
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold, height: 5)),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: widget.myBudget.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        padding: const EdgeInsets.only(left: 7),
                        child: ListTile(
                            title: Text(widget.myBudget[index].judul,
                              style: const TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(widget.myBudget[index].nominal),
                            trailing: Column(
                              children: [
                                Text(widget.myBudget[index].jenis,
                                    style: const TextStyle(height: 2,
                                        fontWeight: FontWeight.bold)),
                                Text(widget.myBudget[index].date.toString()),
                              ],
                            )),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}