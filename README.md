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

<details>
<summary>:blue_book: Tugas 9</summary>

## :blue_book: Tugas 9

### :arrow_right: Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model berfungsi untuk mengubah data dalam bentuk JSON ke object Dart dan sebaliknya. Model juga berfungsi untuk validasi data sehingga meminimalisasi terjadinya kesalahan akibat ketidaksesuaian tipe. Tanpa model, kita harus menggunakan `Map<String, dynamic>` yang akan sulit untuk dikerjakan, rawan kesalahan, dan kurang terstruktur. 

### :arrow_right: Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library `http` digunakan untuk komunikasi antara Flutter dengan server. Contoh implementasiannya adalah pada pengambilan semua data produk user dan data produk masing-masing. Untuk tugas ini, library `http` diabstraksikan melalui package `pbp_django_auth` sebagai berikut.

```dart
final response = await request.logout("http://localhost:8000/auth/logout/");
```

```dart
final response = await request.get('http://localhost:8000/json/${widget.id}');
```

### :arrow_right: Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` berfungsi untuk mengelola sesi pengguna dengan menyimpan token autentikasi yang diterima dari server. Ini memastikan bahwa pengguna yang sudah log in tetap terautentikasi tanpa harus login ulang. Instance dari `CookiRequest` ini dibuat sekali di `main.dart` menggunakan library `provider` dan digunakan berulang kali. Pembuatan pada `main.dart` adalah sebagai berikut.

```dart
Provider(
  create: (_) {
    CookieRequest request = CookieRequest();
    return request;
  },
  child: MaterialApp(
    title: 'Sekoleksi',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      useMaterial3: true,
    ),
    initialRoute: '/login',
    routes: {
      '/product-detail': (context) => ProductDetailPage(ModalRoute.of(context)?.settings.arguments as String),
      '/product-form': (context) => const ProductFormPage(),
      '/product-list': (context) => const ProductListPage(),
      '/register': (context) => const RegisterPage(),
      '/login': (context) => const LoginPage(),
      '/home': (context) => HomePage(),
    },
  ),
);
```

Dengan demikian, untuk menggunakan instance yang sama, setiap page dapat mengakses instance yang sama menggunakan fungsi `context.watch` dari library `provider`.

```dart
final request = context.watch<CookieRequest>();
```

### :arrow_right: Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Proses pengiriman data dimulai dari input pada form di Flutter. Data dari form dikonversi menjadi JSON menggunakan fungsi `jsonDecode` dan dikirim ke server menggunakan `http.post`. Lalu, server Django akan melakukan apa saja yang dibutuhkan ke data tersebut, misalnya dengan menyimpannya ke dalam database atau menjalankan logika tertentu sesuai kebutuhan aplikasi. Setelah itu, Django mengembalikan respons yang berisi data atau status hasil pemrosesan, yang kemudian diterima oleh Flutter untuk ditampilkan di antarmuka pengguna sesuai dengan kebutuhan.

### :arrow_right: Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Pada login, pengguna memasukkan email dan password, lalu Flutter mengirimkan data tersebut ke endpoint login di Django. Jika Django berhasil memverifikasi kredensial login, Django akan mengembalikan cookie atau token yang disimpan di `CookieRequest`. Pada registrasi, Flutter mengirimkan data akun baru ke Django untuk pembuatan akun. Setelah berhasil, pengguna dapat log in menggunakan data pengguna yang sudah dibuat. Logout dilakukan dengan meminta Django untuk menghapus sesi pengguna yang disimpan di server dan setelahnya, cookie atau token yang tersimpan di Flutter juga dihapus untuk mengakhiri sesi dan mengembalikan aplikasi ke status tidak terautentikasi.

### :arrow_right: Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

#### :one: Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
Mengunjungi `http://muhammad-vito31-sekoleksi.pbp.cs.ui.ac.id/`

#### :two: Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
Pertama, membuat app baru di Django dengan nama `authentication`. App ini akan digunakan oleh Flutter untuk autentikasi. Untuk registrasi, route yang dibuat adalah `register`. Pada Flutter, membuat screen baru bernama `register.dart`. Screen ini akan menggunakan route `register` yang dibuat di app `authentication` Django. Screen tersebut berisi Form yang terdapat field username, password, dan konfirmasi password. Pemanggilan endpointnya adalah sebagai berikut dengan `username`, `password1`, dan `password2` didapatkan dari form.

```dart
final response = await request.postJson(
  "http://localhost:8000/auth/register/",
  jsonEncode({
    "username": username,
    "password1": password1,
    "password2": password2,
  })
);
```

#### :three: Membuat halaman login pada proyek tugas Flutter.
Perlu dibuat route baru pada app `authentication` Django, yaitu `login`. Pada Flutter, membuat screen baru bernama `login.dart`. Screen ini akan menggunakan route `login` yang dibuat di app `authentication` Django. Screen tersebut berisi form yang terdapat field username dan password. Pemanggilan endpointnya adalah sebagai berikut dengan `username` dan `password` didapatkan dari form.

```dart
final response = await request .login("http://localhost:8000/auth/login/", {
  'username': username,
  'password': password,
});
```

#### :four: Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
Menggunakan `CookieRequest` untuk menyimpan token autentikasi sehingga tidak kredensial login tersimpan dan tidak perlu login berulang kali. `CookieRequest` akan digunakan berulang kali dengan menggunakan library `provider`.

#### :five: Membuat model kustom sesuai dengan proyek aplikasi Django.
Pertama, mengambil contoh respons dari server untuk model produk. Lalu, respons tersebut dimasukkan ke QuickType dan mengubah bahasanya ke Dart. Kode Dart yang dibuat oleh QuickType adalah mapping dari JSON ke object Dart. Kode ini dapat langsung ditaruh ke models di dart.

<details>
<summary>Response dari server</summary>

```json
[
  {
    "model": "main.product",
    "pk": "731f5d98-6871-43aa-a7f7-de17041c439e",
    "fields": {
      "user": 4,
      "name": "Berserk Vol. 1",
      "price": 60,
      "description": "The first volume of the critically acclaimed manga, Berserk. Follow Guts, a lone mercenary, on his quest for vengeance in a dark, medieval world."
    }
  },
  {
    "model": "main.product",
    "pk": "e587c3dd-b101-4656-bbcf-a19b2fe745cd",
    "fields": {
      "user": 4,
      "name": "Berserk Vol. 2",
      "price": 60,
      "description": "Continuing the dark saga of Guts and the Band of the Hawk as they clash with powerful foes."
    }
  },
  {
    "model": "main.product",
    "pk": "4e5c5807-6978-438b-9308-2bdcde62ae61",
    "fields": {
      "user": 4,
      "name": "Attack on Titan Vol. 1",
      "price": 11,
      "description": "Humanity struggles to survive against giant man-eating titans in a dystopian world."
    }
  },
  {
    "model": "main.product",
    "pk": "32fff4d0-4360-445d-86d4-ece02689b7d6",
    "fields": {
      "user": 4,
      "name": "Vagabond Vol. 1",
      "price": 30,
      "description": "Musashi"
    }
  },
  {
    "model": "main.product",
    "pk": "67d4730a-e2e0-447d-89c0-84f8ae3da1d0",
    "fields": {
      "user": 4,
      "name": "The Fragrant Flower Blooms with Dignity Vol. 1",
      "price": 10,
      "description": "WAGURI SAN"
    }
  },
  {
    "model": "main.product",
    "pk": "f316e062-98e3-4600-aa5a-3030469eb167",
    "fields": {
      "user": 4,
      "name": "Test",
      "price": 60,
      "description": "Vivamus a nibh ut elit condimentum posuere. Vivamus sit amet dui sed massa pretium posuere sit amet eget dolor. Fusce et nisi vulputate, tempus nisi ac, ultricies enim. Curabitur imperdiet, tortor at convallis porttitor, odio metus ullamcorper orci, et facilisis ligula nisi et orci. Nulla ultricies ultrices justo, a semper leo interdum vel. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam non lacinia lacus, nec luctus arcu. Donec bibendum gravida augue, ut imperdiet diam accumsan non. Fusce mollis venenatis libero sit amet fermentum. Duis varius faucibus porta. Sed elementum luctus metus at pulvinar. Suspendisse mauris odio, bibendum id libero vitae, pulvinar luctus ex. Phasellus tristique tellus quis elit fermentum, dictum interdum eros facilisis."
    }
  },
  {
    "model": "main.product",
    "pk": "5f0351f8-8396-4ca7-917f-28e47a8461c3",
    "fields": {
      "user": 4,
      "name": "Test 2",
      "price": 30,
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In commodo nibh sed auctor rhoncus. Nulla molestie euismod magna, et tempor turpis tempor eget. Curabitur mattis elit eget diam gravida, nec egestas ligula dictum. Curabitur ipsum ex, iaculis nec nibh id, pulvinar posuere tortor. Aliquam id turpis luctus, ornare nibh eget, semper mauris. Mauris ornare aliquam magna at volutpat. Aenean a sapien nisl. Vivamus volutpat metus lacus, pulvinar egestas tellus facilisis ut."
    }
  },
  {
    "model": "main.product",
    "pk": "9808a66c-76d6-425c-a331-a276db901609",
    "fields": {
      "user": 4,
      "name": "df",
      "price": 123,
      "description": "123"
    }
  }
]
```
</details>

#### :six: Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
Ini dilakukan di screen bernama `product_list.dart`. Implementasinya menggunakan route `json` pada Django. Pada dasarnya, akan mengambil data dari backend dan memetakannya ke widget di Flutter. Fungsi untuk mengambil datanya adalah sebagai berikut.

```dart
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    
    var data = response;
    
    List<Product> listMood = [];
    for (var d in data) {
      if (d != null) {
        listMood.add(Product.fromJson(d));
      }
    }
    return listMood;
  }
```

Widget untuk memetakan datanya adalah `ListView` seperti berikut.

```dart
ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (_, index) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    child: InkWell(
      onTap: () => Navigator.pushNamed(context, '/product-detail', arguments: snapshot.data![index].pk),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${snapshot.data![index].fields.name}",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text("${snapshot.data![index].fields.price}"),
              const SizedBox(height: 10),
              Text("${snapshot.data![index].fields.description}"),
            ],
          ),
        ),
      ),
    ),
  ),
);
```

#### :seven: Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
Ini dilakukan di screen bernama `product_detail.dart`. Implementasinya menggunakan route `show_json_by_id` di Django. Screen ini membutuhkan id untuk bisa melakukan fetch data sehingga perlu satu atribut bernama id dengan tipe String pada `ProductDetailPage`. Fungsi untuk mengambil detail produk adalah sebagai berikut.

```dart
  Future<Product> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/${widget.id}');
    return Product.fromJson(response[0]);
  }
```

Widget untuk menampilkan detail produk adalah menggunakan `FutureBuilder` sebagai berikut. Widget tersebut akan mem-_build_ ketika future yang diberikan sudah selesai. 

```dart
FutureBuilder(
  future: fetchProduct(request),
  builder: (context, AsyncSnapshot<Product> snapshot) {
    if (snapshot.data == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      if (!snapshot.hasData) {
        return const Column(
          children: [
            Text('Belum ada produk.'),
            SizedBox(height: 8),
          ],
        );
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.fields.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data!.fields.price}"),
                      const SizedBox(height: 10),
                      Text(snapshot.data!.fields.description),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                child: const Text('Back'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    }
  },
),
);
```

#### :eight: Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
Ini sudah diimplementasi dari Django secara langsung. Setiap ada permintaan ke `/json`, Django akan mengecek user yang sudah terautentikasi dan mengembalikan produk untuk user tersebut. Dengan demikian, tidak perlu mem-_filter_ pada Flutter.

</details>
