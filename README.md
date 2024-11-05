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
final List<ItemHomepage> items = [
  ItemHomepage("Lihat Mood", Icons.mood, Colors.red),
  ItemHomepage("Tambah Mood", Icons.add, Colors.green),
  ItemHomepage("Logout", Icons.logout, Colors.blue),
];

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
final List<ItemHomepage> items = [
  ItemHomepage("Lihat Mood", Icons.mood, Colors.red),
  ItemHomepage("Tambah Mood", Icons.add, Colors.green),
  ItemHomepage("Logout", Icons.logout, Colors.blue),
];

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
