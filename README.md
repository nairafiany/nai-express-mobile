
# Jawaban Pertanyaan Tugas 7
<details>
  <summary>Jawaban</summary>

## Pertanyaan 1

_Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya._

Jawaban :

**Stateless Widget** adalah widget yang tidak mengalami perubahan selama penggunaannya. Tampilan dan sifatnya tetap konstan, tidak bergantung pada perubahan data atau interaksi pengguna. Contoh dari stateless widget adalah `Icon`, `IconButton`, dan `Text`. Stateless widget hanya memiliki metode `build()` untuk menggambarkan tampilan.

**Stateful Widget** adalah widget yang dapat berubah saat aplikasi berjalan. Widget ini bersifat dinamis dan dapat diperbarui berdasarkan respons terhadap interaksi pengguna atau perubahan data. Contoh dari stateful widget termasuk `Checkbox`, `RadioButton`, `Slider`, `InkWell`, `Form`, dan `TextField`. Stateful widget memiliki metode `createState()` untuk mengelola perubahan status internalnya.

**Perbedaan antara Stateless dan Stateful Widget:**

- Stateless widget:
  - Bersifat statis.
  - Tidak bereaksi terhadap perubahan data atau perilaku.
  - Tidak memiliki "state", sehingga hanya dirender sekali dan tidak diperbarui setelahnya.
  - Contoh: `Icon`, `Text`, dll.

- Stateful widget:
  - Bersifat dinamis.
  - Dapat diperbarui selama runtime berdasarkan tindakan pengguna atau perubahan data.
  - Memiliki "state" internal yang memungkinkan pembaruan tampilan sesuai perubahan input data.
  - Contoh: `Checkbox`, `TextField`, dll.

Referensi:
https://www.geeksforgeeks.org/difference-between-stateless-and-stateful-widget-in-flutter/


## Pertanyaan 2

_Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya._


Jawaban :

Berikut adalah widget-widget yang digunakan dalam proyek ini beserta penjelasan fungsinya:

1. **MaterialApp**  
   Widget ini merupakan root dari aplikasi Flutter dan berfungsi untuk mengatur tema, title, dan widget yang akan ditampilkan pertama kali saat aplikasi berjalan. Pada proyek ini, `MaterialApp` juga mengatur skema warna aplikasi dan menentukan `MyHomePage` sebagai halaman utama.

2. **Scaffold**  
   `Scaffold` menyediakan struktur dasar untuk halaman aplikasi, seperti AppBar, body, dan lainnya. Dalam proyek ini, `Scaffold` digunakan untuk menampilkan AppBar di bagian atas dan konten halaman di bagian body.

3. **AppBar**  
   `AppBar` adalah widget yang berfungsi sebagai bar di bagian atas halaman (toolbar). Pada proyek ini, AppBar menampilkan judul aplikasi "Nai Express" dengan teks putih dan background berwarna sesuai tema.

4. **Padding**  
   `Padding` menambahkan jarak di sekitar widget. Dalam proyek ini, `Padding` digunakan di body `Scaffold` untuk memberikan jarak di sekitar `Column`, serta pada teks selamat datang untuk menambah ruang di atas teks.

5. **Column**  
   `Column` menyusun widget secara vertikal. Di proyek ini, `Column` digunakan untuk menyusun `InfoCard` dan `GridView` di body halaman.

6. **Row**  
   `Row` menyusun widget secara horizontal. Dalam proyek ini, `Row` digunakan untuk menampilkan tiga `InfoCard` secara berdampingan.

7. **SizedBox**  
   `SizedBox` menyediakan jarak vertikal atau horizontal di antara widget. Dalam proyek ini, `SizedBox` dengan tinggi 16 unit digunakan untuk memberi jarak vertikal antara `Row` yang menampilkan `InfoCard` dan `Column` berikutnya.

8. **Text**  
   `Text` digunakan untuk menampilkan teks. Dalam proyek ini, `Text` digunakan di berbagai tempat seperti judul `AppBar`, konten `InfoCard`, dan pesan selamat datang.

9. **Card**  
   `Card` adalah widget yang memberikan tampilan dengan bayangan untuk membungkus konten. Pada proyek ini, `Card` digunakan di dalam `InfoCard` untuk membungkus informasi seperti NPM, nama, dan kelas.

10. **GridView**  
    `GridView` adalah widget untuk menampilkan kumpulan item dalam bentuk grid. Di proyek ini, `GridView.count` digunakan untuk menampilkan `ItemCard` dalam bentuk grid dengan 3 kolom.

11. **Material**  
    `Material` digunakan untuk memberikan efek material (seperti warna, bentuk, dan bayangan) pada widget. Di proyek ini, `Material` digunakan di dalam `ItemCard` untuk mengatur warna latar belakang setiap item sesuai dengan warna yang telah ditentukan di `ItemHomepage`.

12. **InkWell**  
    `InkWell` adalah widget yang menambahkan efek klik (ripple effect) pada widget anakannya. Dalam proyek ini, `InkWell` digunakan di dalam `ItemCard` untuk menambahkan aksi ketika kartu ditekan dan menampilkan pesan SnackBar.

13. **SnackBar**  
    `SnackBar` adalah widget untuk menampilkan pesan singkat di bagian bawah layar. Pada proyek ini, SnackBar digunakan untuk memberikan umpan balik kepada pengguna saat mereka menekan salah satu `ItemCard`.

14. **Icon**  
    `Icon` digunakan untuk menampilkan ikon. Di proyek ini, `Icon` digunakan dalam `ItemCard` untuk menampilkan ikon sesuai dengan jenis item, seperti ikon list, add, dan logout.

15. **Center**  
    `Center` digunakan untuk memposisikan widget di tengah. Pada proyek ini, `Center` membungkus `Column` yang menampilkan teks sambutan dan `GridView`.

16. **Container**  
    `Container` adalah widget yang serbaguna untuk mengatur layout, memberikan padding, margin, warna, dan ukuran. Pada proyek ini, `Container` digunakan di dalam `Card` dan `ItemCard` untuk memberikan padding dan menampung layout `Column` yang menyusun teks dan ikon.




## Pertanyaan 3

_Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut._

Jawaban :

Fungsi setState() di Flutter digunakan untuk memberi tahu framework bahwa ada perubahan data pada objek state. Dengan memanggil setState(), Flutter akan melakukan rebuild pada widget terkait, sehingga tampilan UI dapat diperbarui sesuai perubahan data yang terjadi. Proses ini dilakukan secara sinkron dengan memanggil fungsi di dalam callback setState, namun callback tersebut tidak boleh bersifat async.

Penggunaan setState() penting dalam StatefulWidget karena memungkinkan aplikasi untuk memperbarui tampilan berdasarkan perubahan data internal. Jika perubahan data dilakukan tanpa setState(), maka UI mungkin tidak akan diperbarui. Oleh karena itu, setState() digunakan setiap kali ada perubahan data yang berdampak pada tampilan di subtree widget.

Referensi : 

https://api.flutter.dev/flutter/widgets/State/setState.html


## Pertanyaan 4

_Jelaskan perbedaan antara const dengan final_

Jawaban : 

Dalam Dart, `final` dan `const` digunakan untuk membuat variabel yang bersifat tidak dapat diubah (immutable), tetapi keduanya memiliki perbedaan dalam hal kapan dan bagaimana nilai mereka ditetapkan.

`final` digunakan untuk variabel yang nilainya ditetapkan satu kali dan ditentukan pada waktu *runtime*. Misalnya, `final currentDate = DateTime.now();` menetapkan nilai tanggal saat program berjalan. `final` juga bisa digunakan untuk referensi list atau objek di mana elemennya masih bisa diubah setelah inisialisasi, misalnya `final List<int> numbers = [1, 2, 3];`, di mana Anda dapat menambahkan elemen ke list setelahnya.

Sebaliknya, `const` digunakan untuk nilai yang harus sudah pasti pada waktu *compile-time*, artinya nilai tersebut tidak berubah sepanjang waktu dan immutable. Sebagai contoh, `const pi = 3.14159;` menetapkan nilai `pi` yang tetap dan tidak akan berubah. Jika `const` diterapkan pada koleksi seperti list, misalnya `const List<int> numbers = [1, 2, 3];`, maka baik list maupun elemen-elemennya tidak dapat diubah.

**Perbedaan Utama:**
- `final` mengizinkan objek untuk diinisialisasi pada *runtime*, namun referensinya tidak dapat diubah setelahnya, meskipun isinya dapat dimodifikasi jika objek tidak bersifat `const`.
- `const` mengharuskan semua nilai sudah diketahui saat *compile-time* dan bersifat sepenuhnya immutable, baik untuk objek maupun elemennya.

**Contoh:**
```dart
final currentDate = DateTime.now(); // Nilai ditetapkan saat runtime
const pi = 3.14159; // Nilai tetap dan immutable

final List<int> numbers = [1, 2, 3]; // List final, elemen bisa diubah
numbers.add(4); // Berhasil

const List<int> immutableNumbers = [1, 2, 3]; // List const, elemen tidak bisa diubah
// immutableNumbers.add(4); // Error
```

Dengan menggunakan `final` untuk nilai yang ditentukan pada runtime dan `const` untuk nilai tetap pada waktu kompilasi, Anda dapat memastikan variabel hanya berubah sesuai kebutuhan aplikasi.



Berikut adalah jawaban untuk Pertanyaan 5 yang disesuaikan dengan kode Anda:

---

## Pertanyaan 5

_Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas._

Jawaban:

1. **Membuat Proyek Flutter Baru**  
   Saya memulai dengan membuat proyek Flutter baru bernama `nai_express_mobile` menggunakan perintah `flutter create nai_express_mobile`. Setelah itu, saya membuka proyek ini di editor kode.

2. **Membuat File `menu.dart` untuk Halaman Utama**  
   Saya membuat file baru bernama `menu.dart` di dalam direktori `lib` dan memindahkan `MyHomePage` dari `main.dart` ke `menu.dart`. Hal ini dilakukan untuk memisahkan widget halaman utama dari konfigurasi aplikasi di `main.dart`.

3. **Mengatur Tema Aplikasi**  
   Pada `main.dart`, saya menggunakan widget `MaterialApp` untuk mengatur tema aplikasi dengan skema warna biru tua. Warna utama (`primary`) diatur ke `Colors.blue[900]` dan warna sekunder (`secondary`) diatur ke `Colors.blue[800]`.

4. **Mengimplementasikan `MyHomePage` sebagai StatelessWidget**  
   `MyHomePage` diimplementasikan sebagai `StatelessWidget` karena konten yang ditampilkan di halaman ini bersifat statis dan tidak memerlukan perubahan state selama aplikasi berjalan.

5. **Membuat Tombol dengan Ikon dan Warna Berbeda**  
   Di dalam `MyHomePage`, saya membuat daftar `ItemHomepage` yang masing-masing memiliki nama, ikon, dan warna berbeda. Warna tombol disesuaikan dengan variasi warna biru yang berbeda untuk menjaga konsistensi tampilan.

6. **Menambahkan Kelas `ItemHomepage` dan `ItemCard`**  
   - **Kelas `ItemHomepage`**: Saya mendefinisikan kelas ini dengan tiga atribut: `name` (nama item), `icon` (ikon item), dan `color` (warna item). Kelas ini digunakan untuk menyimpan data item di halaman utama.
   - **Kelas `ItemCard`**: `ItemCard` adalah widget yang menampilkan kartu dengan ikon, nama, dan warna berdasarkan data dari `ItemHomepage`. Widget ini juga menggunakan `InkWell` untuk menampilkan `SnackBar` saat item ditekan.

7. **Menampilkan Item dalam Grid**  
   Di dalam `MyHomePage`, saya menggunakan widget `GridView.count` untuk menampilkan item-item `ItemCard` dalam bentuk grid dengan 3 kolom. Setiap item memiliki warna dan ikon sesuai dengan data di `ItemHomepage`.

8. **Menerapkan Aksi `SnackBar` pada Klik Item**  
   Setiap `ItemCard` dilengkapi dengan `InkWell` yang menampilkan `SnackBar` ketika item ditekan. `SnackBar` menampilkan pesan sesuai dengan nama item yang ditekan, dengan latar belakang warna abu-abu (`Colors.blueGrey`).

9. **Menggunakan Kelas `InfoCard` untuk Menampilkan Informasi Pengguna**  
   Kelas `InfoCard` digunakan untuk menampilkan informasi seperti NPM, Nama, dan Kelas di bagian atas halaman dalam bentuk kartu yang ditampilkan menggunakan widget `Row`.

</details>



# Jawaban Pertanyaan Tugas 8
<details>
  <summary>Jawaban</summary>

## Pertanyaan 1

_Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?_

Jawaban :

Kegunaan `const` di Flutter adalah untuk mendefinisikan objek atau nilai yang tetap dan tidak berubah saat runtime, dikenal sebagai konstanta waktu kompilasi. Menggunakan `const` memberikan beberapa keuntungan:

1. **Optimasi Performa:** Widget `const` di Flutter dikenali sebagai objek tetap yang bisa digunakan kembali, sehingga mengurangi beban alokasi objek baru dan mempercepat rendering UI.

2. **Manajemen Widget yang Efisien:** `const` membantu meminimalkan rebuild widget tree, membuat UI lebih responsif.

3. **Keterbacaan dan Pemeliharaan Kode:** `const` menjamin objek tidak berubah, sehingga kode lebih mudah dipahami dan risiko perubahan yang tidak diinginkan berkurang.

4. **Mengikuti Prinsip Immutability:** Menggunakan `const` mendukung prinsip pemrograman fungsional di Flutter, membuat kode lebih mudah diuji.

Kapan Menggunakan `const`
- Untuk objek data statis yang tidak akan berubah, seperti warna atau gaya teks.
- Untuk nilai pradefinisi, seperti API endpoint atau data konfigurasi yang tetap sepanjang aplikasi.
- Untuk widget yang sering digunakan dan tidak berubah, seperti ikon atau teks statis, untuk meningkatkan efisiensi widget tree.

Kapan Tidak Menggunakan `const`
- Untuk data yang dapat berubah selama runtime, seperti input pengguna.
- Untuk data yang diambil dari sumber eksternal atau jaringan, seperti API, yang nilainya bisa berubah.
- Untuk objek yang memerlukan perubahan nilai setelah dibuat, misalnya data yang diproses berdasarkan interaksi pengguna.


Referensi : 

https://blog.bytescrum.com/defining-constants-in-flutter-best-practices

https://www.dhiwise.com/post/why-flutter-prefer-const-with-constant-constructor

## Pertanyaan 2

_Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!_

Jawaban :

Column dan Row adalah dua widget utama dalam Flutter yang digunakan untuk menyusun tampilan secara vertikal (atas ke bawah) dan horizontal (kiri ke kanan) secara berurutan. Keduanya memiliki properti alignment yang serupa, seperti mainAxisAlignment dan crossAxisAlignment, yang mengontrol bagaimana anak-anak (widget) di dalamnya diselaraskan.

Column: Menyusun widget secara vertikal dari atas ke bawah. Sangat cocok untuk membuat tata letak yang membutuhkan elemen-elemen ditumpuk secara vertikal.

Row: Menyusun widget secara horizontal dari kiri ke kanan. Biasanya digunakan saat elemen-elemen perlu ditampilkan berdampingan secara horizontal.

Contoh Implementasi Column pada kode di projek flutter ini terdapat pada `addproduct_form.dart`

Referensi :

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
      ...
  ],
)
```
Contoh Implementasi Row pada kode di projek flutter ini terdapat pada `menu.dart`
```dart
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...
              ],
            ),])
```
Referensi :

https://www.geeksforgeeks.org/row-and-column-widgets-in-flutter-with-example/

## Pertanyaan 3

_Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!_


Jawaban :

Pada halaman form ini, terdapat beberapa elemen input yang digunakan:

1. **TextFormField** untuk memasukkan data:
   - **Name**: Memasukkan nama produk.
   - **Amount**: Memasukkan jumlah produk, dengan validasi agar hanya menerima angka.
   - **Description**: Memasukkan deskripsi produk.
   - **Price**: Memasukkan harga produk, dengan validasi agar hanya menerima angka.
   - **Discount**: Memasukkan diskon produk, dengan validasi agar hanya menerima angka.

2. **ElevatedButton** sebagai tombol **Save** untuk menyimpan data setelah semua input divalidasi.

Selain elemen-elemen input di atas, terdapat beberapa elemen input di Flutter yang tidak digunakan dalam tugas ini, seperti:
   - **DropdownButton**: Untuk menampilkan daftar pilihan dalam bentuk dropdown.
   - **Checkbox**: Untuk opsi pilihan ganda.
   - **Radio**: Untuk pilihan tunggal dalam satu grup.
   - **Slider**: Untuk memilih nilai dalam rentang tertentu, seperti jumlah atau harga.
   - **Switch**: Untuk pilihan hidup/mati (on/off).

Elemen-elemen ini bisa digunakan untuk menambahkan variasi input yang lebih kompleks sesuai kebutuhan form.

## Pertanyaan 4

_Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?_

Jawaban :

Dalam aplikasi Flutter, tema (theme) dapat diatur dengan menggunakan `ThemeData` pada `MaterialApp`, seperti yang ditunjukkan pada kode di atas. Pengaturan ini memastikan konsistensi tampilan dan nuansa (look and feel) di seluruh aplikasi, sehingga elemen-elemen UI, seperti warna latar belakang, warna teks, dan komponen lainnya, tetap seragam.

Langkah-langkah untuk mengatur tema pada aplikasi:
1. Menggunakan properti `theme` pada `MaterialApp`.
2. Mengonfigurasi elemen-elemen tema melalui `ThemeData`, seperti:
   - `colorScheme`: Mengatur skema warna dasar aplikasi, termasuk warna utama (`primary`) dan warna sekunder (`secondary`).
   - `useMaterial3`: Mengaktifkan Material 3 untuk tampilan komponen yang lebih modern.

Pada aplikasi ini, saya telah mengimplementasikan tema dengan mengatur warna utama (`primary`) menjadi biru tua (`Colors.blue[900]`) dan warna sekunder (`secondary`) menjadi biru yang lebih terang (`Colors.blue[800]`). Hal ini memastikan elemen-elemen UI yang menggunakan warna utama dan sekunder akan tampil konsisten di seluruh aplikasi.

Selain itu, saya juga menggunakan Material 3 untuk memberikan tampilan yang lebih modern dan mengikuti standar desain terbaru dari Flutter.


## Pertanyaan 5

_Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?_

Jawaban :

Dalam aplikasi Flutter dengan banyak halaman, navigasi dapat diatur dengan menggunakan `Navigator`. Pada contoh kode di atas, terdapat beberapa cara yang digunakan untuk menangani navigasi, yaitu:

1. **Navigator.push**: Digunakan untuk berpindah ke halaman baru tanpa mengganti halaman yang sedang aktif. Pada contoh `ItemCard`, ketika tombol "Tambah Produk" ditekan, `Navigator.push` digunakan untuk menampilkan halaman `AddProductFormPage` di atas halaman sebelumnya.

2. **Navigator.pushReplacement**: Digunakan untuk mengganti halaman saat ini dengan halaman baru. Pada contoh `LeftDrawer`, ketika item menu dipilih, seperti "Halaman Utama" atau "Tambah Produk", `Navigator.pushReplacement` digunakan untuk menggantikan halaman saat ini dengan halaman tujuan.

3. **Drawer untuk Navigasi Cepat**: Di dalam kelas `LeftDrawer`, terdapat elemen navigasi berupa drawer yang memudahkan pengguna untuk berpindah halaman dengan cepat. Drawer berisi daftar `ListTile`, yang masing-masing memiliki fungsi `onTap` yang memanggil `Navigator.pushReplacement` untuk mengarahkan ke halaman terkait.

Dengan pendekatan ini, aplikasi menjadi lebih terstruktur dan mudah digunakan, memungkinkan pengguna untuk berpindah antarhalaman dengan lancar dan konsisten.
