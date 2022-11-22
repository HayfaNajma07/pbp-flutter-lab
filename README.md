# 👩🏻‍💻 PBP FLUTTER LAB 👩🏻‍💻
# Tugas 7
**Nama   : Hayfa Najma**

**Kelas  : PBP - F**

**NPM    : 2106653754**

### 💡 Jelaskan apa yang dimaksud dengan _stateless widget_ dan _stateful widget_ dan jelaskan perbedaan dari keduanya.
🪄 **_Stateless widget_** -> merupakan sebuah widget yang bersifat statis atau tidak dapat dirubah. Selama aplikasi berjalan, _stateless widget_ tidak akan berubah. Hal yang dimaksud tidak berubah adalah perubahan dalam variabel, _icon_, tombol atau pengambilan data tidak akan mengubah _state_ dari aplikasi. Sehingga widget ini cocok untuk digunakan pada tampilan aplikasi yang bersifat statis.

🪄 **_Stateful widget_** -> merupakan sebuah widget yang bersifat dinamis atau dapat berubah. Berbeda dengan stateless widget, _stateful widget_ mampu merubah tampilan aplikasi, variabel, warna, tombol, dll. Selama aplikasi berjalan, _stateful widget_ akan secara dinamis merubah hal-hal tertentu pada aplikasi sesuai dengan kebutuhan _developer_. Salah satu method yang hanya bisa digunakan pada _stateful widget_ adalah `setState()`.

🪄 **Perbedaan pada kedua widget ini terletak pada sifatnya:**

   ✨ **_Stateless widget_**
   
   - Bersifat statis yang memiliki arti bahwa widget ini tidak akan merubah tampilan UI setelah program dijalankan dan selama program dijalankan.
     
   - Lebih cocok digunakan pada tampilan aplikasi yang sifatnya statis atau yang tidak memerlukan terjadinya perubahan tampilan.
  
   ✨ **_Stateful widget_**
   
   - Bersifat dinamis karena tampilan maupun hal lainnya dapat dijadikan sebuah hal untuk memicu terjadinya perubahan pada UI aplikasi.
      
   - Cocok digunakan untuk tampilan aplikasi yang bersifat dinamis atau tampilan aplikasi yang memerlukan adanya perubahan.
      
   - Penggunaan `setState()` hanya dapat diaplikasikan pada _stateful widget_.

### 💡 Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Widget yang saya pakai pada proyek `counter_7` kali ini adalah :

🪄 `Container` : Widget ini berfungsi sebagai pembungkus widget lain

🪄 `FloatingActionButton`: Widget ini berfungsi untuk membuat sebuah tombol

🪄 `Scaffold` : Widget ini memiliki peran untuk mengatur struktur _visual layout_ dengan mengimplementasikan material design

🪄 `Text` : Widget ini berfungsi untuk menampilkan text pada aplikasi

🪄 `Row` : Widget ini berfungsi untuk mengatur tata letak widget secara horizontal

🪄 `Column` : Widget ini berfungsi untuk mengatur tata letak widget secara vertikal

🪄 `MaterialApp` : adalah sebuah _parent_ dimana yang diapitnya akan menerapkan style _material design_

🪄 `TextStyle` : Widget ini berfungsi untuk memberikan _styling_ pada text misalnya warna

🪄 `Center` : Widget ini berfungsi untuk meletakkan widget didalamnya ke bagian tengah

🪄 `Expanded` : Widget ini berfungsi untuk memperluas anak dari Row, Column atau flex sehingga mengisi ruang yang tersedia


### 💡 Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` merupakan sebuah fungsi yang berguna untuk memberitahu widget bahwa ada objek yang berubah pada State sehingga aplikasi akan memuat ulang widget tersebut sesuai dengan nilai yang sudah diubah. Variabel yang dapat terdampak pada fungsi tersebut adalah variabel yang sifanya mutable dan terdeklarasi secara global di sebuah class.

### 💡 Jelaskan perbedaan antara `const` dengan `final`.
Perbedaan antara `final` dan `const` yaitu:

✨ **Inisialisasi**
  - `const` -> dapat diinisialisasi hanya dengan nilai yang immutable pada saat waktu kompilasi.
   - final` -> dapat diinisialisasi dengan nilai yang immutable / mutable  / dihitung pada saat waktu kompilasi.
   
✨ **Nilai**
  - `const` -> objek yang berbeda dari tipe yang sama tidak dapat memiliki nilai const yang berbeda dalam variabel yang sama (anggota const harus statis).
   - final` -> objek yang berbeda dari tipe yang sama dapat memiliki nilai final yang berbeda dalam variabel anggota yang sama.

✨ **Inisialisasi nilai dari variabelnya**
  - `const` mengharuskan variabel harus di inisialisasi pada saat kompilasi dan nilainya harus bersifat konstan dan secara eksplisit sehingga pada saat kompilasi variabel `const` sudah memiliki nilai.
   - final` tidak mengharuskan variabel memiliki nilai secara eksplisit pada saat kompilasi.

### 💡 Jelaskan bagaimana cara kamu mengimplementasikan _checklist_ di atas.

1. Membuka Terminal atau Command Prompt.

2. Membuat direktori baru pada file dan membuka `cmd` pada direktori tersebut.

3. Menjalankan `flutter create counter_7` pada `cmd`.

4. Membuka proyek tersebut pada `Android Studio`.

5. Membuat variabel `counter` pada class `_MyHomePageState` untuk penampilan angka pada aplikasi dengan inisiasi awal 0.

6. Membuat variabel `result` pada class `_MyHomePageState` untuk menampilkan output genap atau ganjil dengan inisiasi awal yaitu genap.

7. Membuat method `_decrementCounter()`, method ini akan mengurangi nilai pada `counter`. Ketika `counter` akan dikurangi dan menghasilkan -1 maka `counter` akan diset menjadi 0 (0 merupakan nilai maksimal decrement `counter`). Proses decrement variabel dilakukan dalam fungsi `setState()`.

8. Membuat method `_checkCounter()` untuk mengecek apakah nilai pada `counter` adalah ganjil atau genap. Jika ganjil, maka variabel `result` akan ditetapkan menjadi ganjil dan sebaliknya untuk genap. Proses pengecekan `counter` dan penetapan `result` dilakukan dalam fungsi `setState()`.

9. Membuat method `showText()`, method ini akan menampilkan text `result` dan menyesuaikan warna yang akan ditampilkan.

10. Menambah widget `FloatingActionButton` untuk tombol increment dan decrement dengan menyesuaikan fungsi `_decrementCounter()` dan `_incrementCounter()` ketika diklik.

11. Menjalankan proyek program Flutter dengan `flutter run` pada `cmd`.

12. Melakukan `add-commit-push` proyek ke repositori `pbp-flutter-lab`.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 👩🏻‍💻 PBP FLUTTER LAB 👩🏻‍💻
# Tugas 8

### 💡 Perbedaan `Navigator.push` dan `Navigator.pushReplacement`

-   `Navigator.push`: sebuah navigator routing yang berfungsi untuk menambahkan route baru ke stack navigasi
-   `Navigator.pushReplacement`: sebuah navigator routing yang berfungsi untuk mengganti route yang ada di stack navigasi dengan route baru

### 💡 Widget yang dipakai pada proyek dan fungsinya

-   Container: widget yang berfungsi sebagai _container_ untuk menampung widget lainnya
-   Form: widget yang berfungsi untuk membuat form
-   Column: widget yang berfungsi untuk menampung widget lainnya secara vertikal
-   ListTile: row yang menampung teks sebagai leading dan trailing
-   Drawer: widget yang berfungsi untuk membuat _drawer_ di sisi kiri layar (untuk navigasi)
-   SizedBox : Widget ini berfungsi untuk membuat box, dimana box ini bisa digunakan untuk menambah jarak
-   Column : Widget ini berfungsi untuk mengatur tata letak widget
-   Scaffold : Widget ini memiliki peran untuk mengatur struktur visual layout dengan mengimplementasikan material design

### 💡 Jenis event pada Flutter

-   onTap: event yang terjadi ketika widget di tap
-   onPressed: event yang terjadi ketika widget di tekan
-   onChanged: event yang terjadi ketika widget diubah
-   onSaved: event yang terjadi ketika widget disimpan

### 💡 Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Pada dasarnya Navigator dalam aplikasi Flutter memiliki mekanisme pergantian halaman dengan menggunakan prinsip stack. Navigator mengatur stack of route dan menyediakan dua cara untuk mengatur stack of route, yaitu declarative dan imperative. Declarative menggunakan `Navigator.pages`, sedangkan imperative `Navigator.push` dan `Navigator.pop`. Halaman yang akan dimuat akan di-push pada top of stack, sedangkan jika ingin berpindah ke halaman sebelumnya, Navigator akan melakukan pop pada stack, sehingga page yang saat ini dilihat akan dihapus dari stack dan tampilan pengguna akan berganti ke halaman sebelumnya.

### 💡 Implementasi checklist
1. Membuat class drawer.dart dimana class ini akan menjadi Navbar untuk seluruh page
2. Membuat tiga tombol navigasi pada drawer
2. Membuat halaman form
3. Membuat halaman data budget

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 👩🏻‍💻 PBP FLUTTER LAB 👩🏻‍💻
# Tugas 9

### 💡 Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Kita dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Secara behavioral, JSON sendiri merupakan suatu object dalam notasi Javascirpt di mana pada bahasa Dart, hal tersebut ekuivalen dengan Map di mana object yang terdiri dari key dengan value pair. Namun, pengambilan data JSON tanpa melakukan konversi ke dalam suatu model bukan merupakan best practice dalam pengimplementasiannya. Konversi data JSON ke dalam suatu model bertujuan untuk meminimalisir kesalahan pengambilan atau pengiriman data melalui http request yang akan ditampilkan pada sisi UI aplikasi.

### 💡 Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
-   Container: widget yang berfungsi sebagai _container_ untuk menampung widget lainnya
-   Form: widget yang berfungsi untuk membuat form
-   Column: widget yang berfungsi untuk menampung widget lainnya secara vertikal
-   ListTile: row yang menampung teks sebagai leading dan trailing
-   Drawer: widget yang berfungsi untuk membuat _drawer_ di sisi kiri layar (untuk navigasi)
-   Scaffold : Widget ini memiliki peran untuk mengatur struktur visual layout dengan mengimplementasikan material design
-   FutureBuilder, widget untuk menggenerate array of widget berdasarkan suatu snapshot dengan memperhatikan teraksi snapshot terbaru
-   Padding : berufngsi untuk memebrikan jarak pada widget

### 💡 Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
-   Membuat sebuah function http request dengan method `GET` secara async untuk mengambil data ke pihak eksternal
-   Pada function tersebut lakukan parsing dengan `jsonDecode()` untuk mengubah response String menjadi JSON
-   Konversi object JSON ke dalam suatu Model object
-   Gunakan widget `FutureBuilder` untuk menampilkan widget-widget dengan snapshot data terbaru yang telah dikonversi menjadi sebuah object

### 💡  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Menambahkan tombol navigasi pada drawer untuk ke halaman mywatchlist di drawer.dart.
2. Membuat mywatchlist.dart yang berisi model mywatchlist.
3. Membuat page_mywatchlist.dart untuk bagian halaman mywatchlist yang berisi semua watch list yang ada pada endpoint JSON di Django Tugas 3 sebelumnya.
4. Membuat navigasi dari setiap judul watch list ke halaman detail
5. Membuat detail_mywatchlist.dart untuk bagian halaman detail untuk setiap mywatchlist yang ada pada daftar tersebut. Halaman ini menampilkan judul, release date, rating, review, dan status (sudah ditonton/belum).
6. Membuat tombol `back` untuk kembali ke daftar mywatchlist
Membuat halaman form
7. Menambahkan checkbox pada setiap watchlist pada halaman mywatchlist. Dimana checkbox akan tercentang jika status ditonton bernilai true dan tidak jika bernilai false. Jika checkbox ditekan, maka status ditonton akan berubah. (Menggunakan CheckboxListTile)
8. Menambahkan warna untuk outline pada setiap mywatchlist pada halaman mywatchlist berdasarkan status ditonton. (Menggunakan color di BoxDecoration)