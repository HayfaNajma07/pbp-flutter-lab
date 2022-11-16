import 'package:flutter/material.dart';
import 'package:counter_7/budget.dart';

import 'drawer.dart';

class FormBudget extends StatefulWidget {
  const FormBudget({super.key});

  @override
  State<FormBudget> createState() => _FormBudgetState();
}

class _FormBudgetState extends State<FormBudget> {
  final List<Budget> _budget = [];
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String _jenis = "Pemasukan";
  List<String> listJenis = ["Pemasukan", "Pengeluaran"];

  // create variable for date from date picker
  DateTime? _date;

  String getText(){
    if (_date == null){
      return 'Pilih Tanggal';
    } else{
      return '${_date?.month}/${_date?.day}/${_date?.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffCDFCF6),
        appBar: AppBar(
          title: const Text("Form Budget"),
        ),
        drawer: MyDrawer(
          theBudget: _budget,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(

            child: Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30.0),
                        child: const Text('Welcome! 😃',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      )
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // Membuat elemen input dengan tipe data String berupa judul budget
                      decoration: InputDecoration(
                          labelText: "Judul",
                          // Menambahkan circular border agar lebih rapih
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        // Untuk menghandle jika value input yang diisi kosong
                        if (value == null || value.isEmpty) {
                          return "Judul tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // Membuat elemen input dengan tipe data int berupa nominal budget
                      decoration: InputDecoration(
                          labelText: "Nominal",
                          // Menambahkan circular border agar lebih rapih
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          _nominal = int.parse(value!);
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _nominal = int.parse(value!);
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        // Untuk menghandle jika value input yang diisi kosong
                        if (value == null || value.isEmpty) {
                          return "Nominal tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    // Membuat elemen dropdown yang berisi tipe budget dengan pilihan pemasukan dan pengeluaran
                    title: const Text("Pilih Jenis"),
                    trailing: DropdownButton(
                      value: _jenis,
                      items: listJenis.map((String jenisNow) {
                        return DropdownMenuItem(
                          value: jenisNow,
                          child: Text(jenisNow),
                        );
                      }).toList(),
                      onChanged: (String? newJenis) {
                        setState(() {
                          _jenis = newJenis!;
                        });
                      },
                    ),
                  ),
                  // Membuat date picker di dalam list tile
                  Center(
                      child: Container(
                        margin: const EdgeInsets.all(30.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),

                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(12.0),
                            ),
                          ),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025),
                            ).then((value) {
                              setState(() {
                                _date = value;
                              });
                            });
                          },
                          child: Text(getText(), style: const TextStyle(fontSize: 19)),
                        ),
                      )

                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(left: 30.0),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(11.0),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Budget.addBudget(Budget(judul: _judul, nominal: _nominal, jenis: _jenis, date: _date!));
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 15,
                      child: ListView(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        shrinkWrap: true,
                        children: <Widget>[
                          Center(
                              child: Column(
                                children: [
                                  const Text(
                                    "Data berhasil disimpan!",
                                    style: TextStyle(
                                      fontSize: 20,
                                      height: 3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("Judul: $_judul", style: const TextStyle(
                                      fontSize: 15, height: 2
                                  ),),
                                  Text("Nominal: $_nominal", style: const TextStyle(
                                      fontSize: 15, height: 2
                                  ),),
                                  Text("Jenis: $_jenis", style: const TextStyle(
                                      fontSize: 15, height: 2
                                  )),
                                ],
                              )),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                _judul = "";
                                _nominal = 0;
                                _jenis = "Pemasukan";
                              });
                            },
                            child: const Text('Kembali', style: TextStyle(
                              fontSize: 19,
                            )),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
            child: const Text(
              "Simpan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
              ),
            ),
          ),
        ));
  }
}

// Created By: Hayfa Najma