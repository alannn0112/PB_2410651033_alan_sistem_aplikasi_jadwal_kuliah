# sistem aplikasi jadwal kuliah

## Deskripsi
Aplikasi ini membantu mahasiswa melihat dan mengatur jadwal dengan lebih mudah.

## Identitas
Nama: Muhammad Maulana Nur Sulaiman 
NIM: 2410651033

## Versi
v0.0 - Prototype

## Fitur Prototype v0.0
- Menampilkan nama aplikasi
- Menampilkan deskripsi aplikasi
- Menampilkan identitas pengembang
- Menampilkan target pengguna
- Menampilkan tombol interaktif sederhana dengan SnackBar

## Cara Menjalankan
flutter pub get
flutter run -d chrome

## Bukti Running
Screenshot aplikasi berjalan dilampirkan pada LMS.

## Catatan Kendala
Tuliskan kendala yang dialami jika ada.(gaada)

## Catatan Penggunaan AI
Digunakan untuk mencari ide aplikasi yang akan dikembangkan kedepannya



# JadwalKu — Aplikasi Jadwal Kuliah

**Versi:** Prototype v0.0

## Deskripsi

JadwalKu adalah rancangan aplikasi mobile untuk membantu mahasiswa melihat dan mengatur jadwal perkuliahan. Informasi yang menjadi fokus utama meliputi nama mata kuliah, waktu, ruangan, dan dosen pengampu.

Project ini dibuat untuk memenuhi tugas mata kuliah Pemrograman Bergerak menggunakan Flutter.

## Target Pengguna

Mahasiswa yang membutuhkan akses praktis terhadap informasi jadwal kuliah harian maupun mingguan.

## Fitur Prototype v0.0

- Tampilan beranda aplikasi.
- Informasi pengguna.
- Ringkasan jadwal kuliah hari ini.
- Contoh kartu informasi mata kuliah.
- Rancangan antarmuka untuk pengembangan fitur jadwal berikutnya.

## Teknologi

- Flutter
- Dart
- Material Design 3
- Visual Studio Code

## Desain dan Aksesibilitas

Desain menggunakan pendekatan mobile-first dengan warna biru sebagai warna utama. Informasi jadwal disusun menggunakan kartu agar lebih mudah dibaca.

Checklist aksesibilitas dasar mencakup keterbacaan teks, kontras warna, label tombol, ukuran area sentuh, dan konsistensi navigasi. Pemeriksaan perlu dilakukan kembali pada implementasi aplikasi.

## Status Pengembangan

Prototype v0.0 masih berfokus pada struktur antarmuka dan tampilan awal. Fitur penyimpanan data, CRUD jadwal, serta notifikasi aktif belum dinyatakan selesai.

## Cara Menjalankan

1. Pastikan Flutter SDK sudah terpasang.
2. Buka folder project melalui Visual Studio Code.
3. Jalankan `flutter pub get`.
4. Jalankan aplikasi menggunakan `flutter run` atau `flutter run -d chrome`.

## Rencana Pengembangan

- Menambahkan dan mengedit jadwal kuliah.
- Menghapus jadwal.
- Menyimpan data jadwal.
- Menambahkan validasi formulir.
- Mengembangkan pengingat jadwal kuliah.
- Menguji aksesibilitas dan responsivitas antarmuka.

## Penggunaan AI

AI digunakan sebagai alat bantu untuk brainstorming ide, menyusun struktur antarmuka, serta meninjau keputusan desain dan checklist aksesibilitas. Hasilnya tetap perlu diperiksa dan disesuaikan dengan kebutuhan project.

## Lisensi

Project ini dibuat untuk keperluan pembelajaran akademik.


## Fitur Aplikasi

- Menampilkan jadwal kuliah pada halaman utama.
- Menambahkan jadwal kuliah baru.
- Mengisi informasi mata kuliah, hari, jam, ruang, dan dosen.
- Menampilkan seluruh jadwal kuliah pada halaman Semua Jadwal.
- Menggunakan navigasi antarhalaman dengan Navigator.push dan Navigator.pop.
- Memvalidasi kolom formulir agar tidak kosong.
- Menampilkan pesan ketika jadwal berhasil ditambahkan.

Halaman Aplikasi
1. Home Page — halaman utama yang menampilkan sapaan dan jadwal kuliah hari ini.
2. Form Jadwal — halaman untuk mengisi dan menyimpan jadwal kuliah.
3. Semua Jadwal — halaman untuk melihat seluruh jadwal yang sudah ditambahkan.

Teknologi yang Digunakan
- Flutter
- Bahasa pemrograman Dart
- Material Design 3
- Visual Studio Code
- Git dan GitHub

Cara Menjalankan Aplikasi
1. Pastikan Flutter SDK dan Google Chrome sudah terpasang.
2. Buka folder proyek JadwalKu melalui Visual Studio Code.
3. Buka terminal pada folder proyek.
4. Jalankan perintah berikut:
    flutter pub get
    flutter run -d chrome
5. Tunggu sampai aplikasi terbuka di Google Chrome.

Struktur Proyek

lib/
└── main.dart
web/
├── index.html
├── manifest.json
└── icons/
README.md
CHANGELOG.md

## Pengujian

Pengujian dilakukan dengan mencoba membuka halaman formulir, mengisi data jadwal, menyimpan jadwal, dan membuka halaman Semua Jadwal. Setiap tombol perlu diuji kembali untuk memastikan navigasi berjalan sesuai fungsinya.

## Catatan

Data jadwal pada versi ini masih disimpan sementara selama aplikasi berjalan. Data belum menggunakan database atau penyimpanan permanen, sehingga dapat hilang ketika aplikasi dimulai ulang.

## Pengembangan

Versi ini merupakan pengembangan aplikasi JadwalKu dari prototype awal menuju Navigation v0.1. Pengembangan selanjutnya dapat mencakup penyimpanan data permanen, pengeditan jadwal, dan penghapusan jadwal.



v0.2 - Form & Validation
## Fitur Aplikasi
- Jadwal Hari Ini: Menampilkan jadwal kuliah berdasarkan hari saat ini.
- Semua Jadwal: Menampilkan seluruh jadwal yang tersedia.
- Tambah Jadwal: Menambahkan informasi mata kuliah, hari, jam, ruang, dan dosen.
- Form Validation: Memeriksa agar setiap kolom wajib diisi dan memiliki minimal 3 karakter.
- Notifikasi: Menampilkan pesan ketika input tidak valid atau jadwal berhasil ditambahkan.
- Indikator Penyimpanan: Menampilkan status proses saat jadwal sedang disimpan.
- Navigasi Halaman: Berpindah dari halaman utama ke halaman semua jadwal dan form penambahan jadwal.

## Teknologi yang Digunakan
- Flutter
- Bahasa pemrograman Dart
- Material Design 3
- Visual Studio Code
- Google Chrome untuk pengujian Flutter Web

## Tampilan dan Desain
JadwalKu menggunakan desain sederhana dengan warna biru sebagai warna utama. Tampilan dibuat agar informasi jadwal mudah dibaca dan fitur utama mudah ditemukan oleh pengguna.

## Struktur Proyek
lib/
└── main.dart

File main.dart berisi struktur utama aplikasi, model data jadwal, halaman utama, halaman semua jadwal, komponen kartu jadwal, serta form tambah jadwal beserta validasinya.

## Cara Menjalankan Aplikasi
- Pastikan Flutter SDK dan Google Chrome sudah terpasang.
- Buka folder proyek JadwalKu menggunakan Visual Studio Code.
- Jalankan perintah berikut pada terminal untuk mengambil dependensi:
     flutter pub get
- Jalankan aplikasi menggunakan perintah:
    flutter run -d chrome

## Pengujian
 Pengujian dilakukan dengan menjalankan aplikasi melalui Flutter Web di Google Chrome. Beberapa skenario pengujian yang dapat dilakukan adalah:
- Membuka halaman utama dan melihat jadwal kuliah.
- Membuka halaman semua jadwal.
- Mencoba menyimpan form dalam keadaan kosong.
- Memasukkan teks kurang dari 3 karakter.
- Mengisi seluruh data dengan benar dan menyimpan jadwal.
- Memastikan notifikasi keberhasilan muncul setelah jadwal ditambahkan.




## Informasi Aplikasi

- Nama Aplikasi: JadwalKu
- Platform: Flutter
- Bahasa Pemrograman: Dart
- Versi: v0.3
- Mata Kuliah: Pemrograman Bergerak

## Fitur Aplikasi

### BAB 5 – Navigation v0.1
- Navigasi antarhalaman aplikasi.
- Halaman utama untuk menampilkan jadwal kuliah.
- Halaman untuk melihat seluruh jadwal.

### BAB 6 – Form & Validation v0.2
- Form untuk menambahkan jadwal kuliah.
- Input mata kuliah, hari, jam, ruang, dan dosen.
- Validasi agar data wajib diisi.
- Validasi minimal 3 karakter pada input teks.
- Pesan informasi menggunakan SnackBar.
- Pembaruan tampilan menggunakan setState().

### BAB 7 – Data Module v0.3
- Menambahkan data jadwal kuliah (Create).
- Menampilkan daftar jadwal kuliah (Read).
- Mengubah data jadwal yang sudah tersimpan (Update).
- Menghapus data jadwal (Delete).
- Menampilkan konfirmasi sebelum data dihapus.
- Menampilkan Empty State ketika belum ada data jadwal.
- Memberikan informasi kepada pengguna setelah proses tambah, ubah, atau hapus data.

## Teknologi yang Digunakan

- Flutter
- Dart
- Material Design 3
- Visual Studio Code
- Git dan GitHub

## Cara Menjalankan Aplikasi

1. Pastikan Flutter sudah terpasang di komputer.
2. Clone repository ini.
3. Buka folder project menggunakan Visual Studio Code.
4. Jalankan perintah berikut pada terminal:
    flutter pub get

5. Jalankan aplikasi menggunakan perintah:
    flutter run -d chrome

## Struktur Project
lib/
└── main.dart

README.md
CHANGELOG.md

## Penyimpanan Data

Pada versi v0.3, data jadwal kuliah masih disimpan sementara menggunakan list di dalam aplikasi. Data dapat ditambahkan, ditampilkan, diubah, dan dihapus selama aplikasi berjalan. Penyimpanan permanen menggunakan database belum diterapkan.

## Pengembangan Selanjutnya

Pengembangan berikutnya dapat dilakukan dengan menambahkan penyimpanan data secara permanen menggunakan database lokal maupun online agar data jadwal tidak hilang ketika aplikasi ditutup.