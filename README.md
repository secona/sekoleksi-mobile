# sekoleksi_mobile

<details>
<summary>:blue_book: Tugas 7</summary>

## :blue_book: Tugas 7

### :arrow_right: Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
State pada widget adalah data yang bersifat dinamis dan dapat mempengaruhi tampilan seiring penggunaan aplikasi. State ini lah yang memberikan interaktivitas ke aplikasi Flutter. Contoh dari state adalah counter, display text berdasarkan input, dan lain sebagainya. Dengan demikian, perbedaan dari keduanya adalah sebagai berikut.
- **Stateless Widget** tidak memiliki state dan menampilkan data statis yang tidak berubah.
- **Stateful Widget** memiliki state yang dapat berubah, memungkinkan tampilan atau perilaku widget untuk diperbarui sesuai interaksi atau perubahan data.

### :arrow_right: Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
1. `MaterialApp` untuk mendefinisikan bahwa aplikasinya menggunakan material design.
2. `Scaffold` untuk struktur visual aplikasi, yaitu app bar, body, dan lain-lain.
3. `AppBar` untuk membuat bar yang ada di bagian atas layar.
4. `Padding` untuk menambahkan ruang yang ada di samping widget.
5. `Column` untuk mengatur _children_ secara horizontal.
6. `Expanded` untuk mengatur supaya mengisi ruangan yang tersisa pada Column.
7. `GridView` untuk menampilkan _children_ dalam bentuk grid. Untuk kasus ini, dalam dua kolom.
8. `InkWell` untuk mendeteksi sentuhan dan memberikan efek visual.
9. `Material` untuk memberikan efek material (shadow dan elevation) untuk anaknya.
10. `Container` untuk membuat kotak dengan ukuran, padding, margin, dan dekorasi.
11. `Center` untuk mengatur anak supaya menengah.
12. `Icon` untuk menampilkan icon.
13. `Text` untuk menampilkan teks.
14. `SnackBar` untuk menampilkan pesan sementara di bagian bawah layar.

### :arrow_right: Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi `setState()` digunakan dalam stateful widget untuk memberi tahu Flutter bahwa terdapat data yang berubah yang membutuhkan pembaruan UI. Ketika method `setState()` dipanggil, Flutter akan mengeksekusi method `build` dari widget tersebut dan memperbarui UI dengan data yang terbaru. Variabel yang dapat terdampak dengan fungsi `setState()` adalah variabel state, seperti counter dan input pengguna.

### :arrow_right: Jelaskan perbedaan antara const dengan final.
Variabel `final` hanya dapat di-_assign_ sekali dan nilainya tidak dapat diubah setelah diinisialisasi. Nilai dari variabel `final` ditentukan pada saat runtime, sehingga lebih fleksibel dan dapat menggunakan hasil perhitungan atau input pengguna saat diinisialisasi.

Variabel `const` adalah variabel yang di-_assign_ valuenya pada saat _compile-time_, yang berarti nilainya harus sudah diketahui saat proses kompilasi. Variabel `const` hanya dialokasikan ke memori sekali, dan jika ada beberapa referensi ke variabel yang sama, semuanya akan merujuk ke lokasi memori yang sama. Ini membuat const lebih efisien dalam penggunaan memori dan performa aplikasi.

### :arrow_right: Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

#### :one: Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
Menjalankan perintah `flutter create sekoleksi_mobile`.

#### :two: Membuat tiga tombol sederhana dengan ikon dan teks untuk:
Mendefiniskan dua class sebagai berikut.
```dart
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}")));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

Class `ItemHomepage` digunakan sebagai penyimpan data yang diperlukan oleh class `ItemCard`. Class `ItemCard` itu sendiri adalah komponen tombol yang menampilkan data tersebut. Nilai-nilai seperti nama, ikon, dan warna diambil dari instansi kelas `ItemHomepage`, sehingga setiap tombol dapat menampilkan informasi yang sesuai dan konsisten dengan desain aplikasi.

Pada class `HomePage`, mendefinisikan variabel baru `items` yang akan digunakan sebagai data tombol melalui `GridView`.

```dart
// ...
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.inventory_2, Colors.red),
    ItemHomepage("Tambah Produk", Icons.add, Colors.green),
    ItemHomepage("Logout", Icons.logout, Colors.blue),
  ];
// ...

// ...
GridView.count(
  crossAxisCount: 2,
  crossAxisSpacing: 8,
  mainAxisSpacing: 8,
  children: items.map((ItemHomepage item) => ItemCard(item)).toList(),
),
// ...
```

#### :three: Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
Setiap class `ItemHomepage` menyimpan data berupa warna yang digunakan untuk menampilkan warna yang berbeda untuk setiap instance dari `ItemHomepage`. Warna yang saya gunakan adalah merah, hijau, dan biru.

```dart
// ...
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.inventory_2, Colors.red),
    ItemHomepage("Tambah Produk", Icons.add, Colors.green),
    ItemHomepage("Logout", Icons.logout, Colors.blue),
  ];
// ...

// ...
  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
// ...
```

#### :four: Memunculkan Snackbar ketika tombol ditekan
Pada `ItemCard`, terdapat widget `InkWell` yang dapat digunakan untuk mendeteksi sentuhan. Dengan menggunakan ini, kita dapat definisikan untuk setiap _tap_ untuk menunjukkan snackbar dengan pesan tertentu yang dibuat dari `item.name`, sebuah instance dari `ItemHomepage`.

```dart
// ...
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}")));
        },
// ...
```

</details>

<details>
<summary>:blue_book: Tugas 8</summary>

## :blue_book: Tugas 8

### :arrow_right: Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
Kegunaan `const` dalam Flutter adalah untuk mendeklarasikan konstanta yang tidak akan berubah selama siklus hidup aplikasi. Beberapa keuntungan `const` adalah sebagai berikut.
- **Menghemat memori**: Flutter hanya membuat 1 instance dari objek yang diberi `const`. Jika objek tersebut digunakan berulang kali, Flutter akan menggunakan ulang objek yang sudah dibuat.
- **Mempercepat build time**: Karena widgetnya tidak akan berubah, Flutter tidak perlu menggambar ulang widget tersebut ketika sebuah _state_ berubah.
- **Mempermudah prediktabilitas dan _debugging_**: Mirip seperti poin sebelumnya, Flutter tidak akan mengubah widget dengan `const`. Ini akan mempermudah karena setelah widget tersebut dibuat, _state_-nya tidak dapat diubah, mengeliminasi masalah-masalah yang berkaitan dengan state.

Tidak semua widget di Flutter pantas untuk digunakan `const`. Hanya widget yang tidak akan berubah, seperti yang tidak memiliki state, yang dapat digunakan `const`. Jika `const` digunakan ke widget dengan state yang akan berubah, widget tersebut tidak akan diperbarui tampilannya. 

### :arrow_right: Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Column menyusun anak-anaknya secara vertikal dari atas ke bawah. Column cocok digunakan ketika ingin menampilkan elemen-elemen dalam satu kolom seperti pada form atau list. Column biasanya diatur menggunakan `mainAxisAlignment` dan `crossAxisAlignment` untuk posisi vertikal dan horizontal elemen-elemen di dalamnya. Berikut merupakan contoh implementasi dari widget Column berupa form dengan beberapa bagian saya potong supaya tidak terlalu panjang.

```dart
Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            // ...
          ),
        ),
        Padding(
          child: TextFormField(
            // ...
          ),
        ),
        Padding(
          child: TextFormField(
            // ...
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            child: ElevatedButton(
              // ....
              child: const Text(
                // ...
              ),
            ),
          ),
        ),
      ],
    ),
  )
)
```

Row menyusun anak-anaknya secara horizontal dari kiri ke kanan. Row cocok digunakan ketika ingin menampilkan elemen-elemen dalam satu baris seperti tombol, ikon, atau informasi yang disusun sejajar. Sama seperti Column, Row biasanya diatur menggunakan `mainAxisAlignment` dan `crossAxisAlignment` untuk posisi elemen-elemen di dalamnya. Berikut merupakan contoh implementasi Row yang berupa menempatkan InfoCard secara horizontal.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
),
```

### :arrow_right: Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada halaman form, saya menggunakan widget `TextFormInput`. Widget form lain untuk data teks adalah `TextInput`. Perbedaan antara `TextInput` dan `TextFormInput` adalah `TextInput` tidak berintegrasi dengan `Form`, sedangkan `TextFormInput` berintegrasi. Beberapa widget selain `TextFormInput` dan `TextInput` adalah `CheckBox`, `DatePicker`, `Radio`, `Slider`, `Switch`, dan `TimePicker`. Widget-widget tersebut tidak digunakan karena form yang dibuat hanya berisi teks data.

### :arrow_right: Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Tema dalam aplikasi Flutter diatur dari MaterialApp pada berkas `lib/main.dart`.

```dart
// ...
ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  useMaterial3: true,
)
// ...
```

Data tema ini dapat digunakan melalui variabel `context` yang diberikan pada method `build` dalam semua bagian dari aplikasi Flutter supaya warna yang digunakan konsisten. Penggunaannya adalah sebagai berikut.

```dart
// ...
AppBar(
  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
  title: Text(
    "Sekoleksi",
    style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)
  ),
),
// ...
```

```dart
// ...
BoxDecoration(
  color: Theme.of(context).colorScheme.primary,
),
// ...
```

Dengan demikian, pewarnaan pada aplikasi Flutter menjadi konsisten dan nyaman untuk dilihat.

### :arrow_right: Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Saya menggunakan _named routes_ untuk mengatur halaman-halaman pada Flutter. _Named routes_ tersebut diatur di widget `MaterialApp`.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ...
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/product-form': (context) => const ProductFormPage(),
      }
    );
  }
}
```

Untuk pindah halaman, dapat digunakan fungsi `Navigator.pushNamed`, seperti berikut.

```dart
ListTile(
  leading: const Icon(Icons.inventory_2_outlined),
  title: const Text('Tambah Produk'),
  onTap: () => Navigator.pushNamed(context, '/product-form'),
)
```

Variabel `context` didapatkan dari argumen method `build`.

</details>
