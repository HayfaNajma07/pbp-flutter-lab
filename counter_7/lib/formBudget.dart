import 'package:flutter/material.dart';
import 'package:counter_7/dataBudget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget.dart';

class FormBudget extends StatefulWidget {
  const FormBudget({super.key});

  @override
  State<FormBudget> createState() => _FormBudgetState();
}

class _FormBudgetState extends State<FormBudget> {
  List<Budget> _budget = [];
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _nominal = "";
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
        backgroundColor: Color(0xffCDFCF6),
        appBar: AppBar(
          title: Text("Form Budget"),
        ),
        drawer: Drawer(
          child: Container(
            margin: const EdgeInsets.only(top: 45.0),
            child: Column(
              children: [
                ListTile(

                  title: const Text("counter_7",
                      style: TextStyle(fontSize: 20)),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder:
                          (context) => MyHomePage(title: 'Program Counter')),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Tambah Budget",
                      style: TextStyle(fontSize: 20)),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder:
                          (context) => const FormBudget()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Data Budget",
                      style: TextStyle(fontSize: 20)),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder:
                            (context) => DataBudget(myBudget: _budget,)));
                  },
                ),
              ],
            ),
          )
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // Membuat elemen input dengan tipe data String berupa judul budget
                      decoration: InputDecoration(
                          labelText: "Judul",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      onChanged: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // Membuat elemen input dengan tipe data int berupa nominal budget
                      decoration: InputDecoration(
                          labelText: "Nominal",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      onChanged: (String? value) {
                        setState(() {
                          _nominal = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _nominal = value!;
                        });
                      },
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
                setState(() {
                  print("Judul: $_judul");
                  print("Nominal: $_nominal");
                  print("Jenis: $_jenis");
                  Budget newBudget = Budget(_judul, _nominal, _jenis, _date!);
                  _budget.add(newBudget);
                  print(_budget.length);
                });
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 15,
                      child: Container(
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
                                  _nominal = "";
                                  _jenis = "Pemasukan";
                                });
                              },
                              child: const Text('Kembali', style: TextStyle(
                                fontSize: 19,
                              )),
                            ),
                          ],
                        ),
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