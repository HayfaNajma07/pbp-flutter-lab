import 'package:flutter/material.dart';
import 'package:counter_7/model/budget.dart';

import 'drawer.dart';

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
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: MyDrawer(
        theBudget: widget.myBudget,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
              title: Text(Budget.getList()[index].judul,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text(Budget.getList()[index].nominal.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Column(
                children: [
                  Text(Budget.getList()[index].jenis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(Budget.getList()[index].date.toString()),
                ],
              )

            ),
          );
        },
        itemCount: Budget.getList().length,
      ),
    );
  }
}

// Created By: Hayfa Najma