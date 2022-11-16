class Budget {
  String judul;
  int nominal;
  String jenis;
  DateTime date;
  static final List<Budget> _listBudget = [];

  Budget({required this.judul, required this.nominal, required this.jenis, required this.date});

  static void addBudget(Budget item) {
    _listBudget.add(item);
  }

  static List<Budget> getList() {
    return _listBudget;
  }
}

// Created By: Hayfa Najma