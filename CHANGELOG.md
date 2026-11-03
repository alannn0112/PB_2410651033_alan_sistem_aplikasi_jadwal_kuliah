# CHANGELOG

## v0.0 - Prototype
Tanggal: Selasa, 6 Oktober 2026

Perubahan:
- Membuat halaman home/profil sederhana.
- Menambahkan nama aplikasi.
- Menambahkan deskripsi aplikasi.
- Menambahkan identitas pengembang.
- Menambahkan tombol interaktif sederhana.
- Menjalankan aplikasi melalui Flutter Web/Chrome.

Bukti:
- Screenshot running tersedia.
- Commit Git tersedia.


# Changelog 
13 Oktober 2026
Semua perubahan penting pada project JadwalKu dicatat dalam dokumen ini.

## [0.0.0] - Prototype Awal

### Added
- Membuat project Flutter dengan nama aplikasi JadwalKu.
- Menambahkan tampilan beranda.
- Menampilkan informasi pengguna.
- Menampilkan contoh jadwal Pemrograman Bergerak.
- Menampilkan contoh jadwal Statistika dan Probabilitas.
- Menambahkan tombol Mulai Eksplorasi.
- Menggunakan Material Design 3 dan tema warna biru.

### Design
- Menyusun konsep antarmuka mobile-first.
- Merancang kartu jadwal untuk memisahkan informasi mata kuliah.
- Menyusun panduan warna, tipografi, dan komponen UI.
- Menyiapkan checklist aksesibilitas dasar dan refleksi keputusan desain.

### Known Limitations
- Data jadwal masih statis.
- Penyimpanan data belum tersedia.
- Fitur CRUD belum sepenuhnya diimplementasikan.
- Notifikasi jadwal masih berupa konsep desain.
- Pengujian aksesibilitas menyeluruh belum dilakukan.

# Changelog
20 Oktober 2026
[v0.1] - Navigation

Added
- Menambahkan navigasi dari halaman utama ke halaman Form Jadwal.
- Menambahkan halaman Semua Jadwal.
- Menambahkan formulir untuk memasukkan mata kuliah, hari, jam, ruang, dan dosen.
- Menambahkan tombol Tambah Jadwal Kuliah dan Lihat Semua.
- Menambahkan tombol Simpan Jadwal dan Batal.
- Menambahkan validasi untuk kolom formulir.
- Menambahkan navigasi kembali menggunakan Navigator.pop.
- Menambahkan tampilan kartu jadwal dengan informasi perkuliahan.

Improved
- Menyesuaikan tampilan aplikasi menggunakan warna biru dan putih.
- Merapikan tampilan halaman utama dan halaman daftar jadwal.
- Menambahkan pemeriksaan agar halaman tidak memperbarui state setelah widget tidak aktif.

Notes
- Data jadwal masih disimpan dalam memori aplikasi.
- Database dan penyimpanan permanen belum diterapkan.
- Pengujian tombol dan navigasi perlu dilakukan sebelum versi ini dinyatakan selesai.


# Changelog
28 Oktober 2026 
## [0.2] - BAB 6: Form & Validation

### Added
- Menambahkan form untuk memasukkan data jadwal kuliah.
- Menambahkan input mata kuliah, hari, jam kuliah, ruang, dan dosen.
- Menambahkan validasi agar setiap kolom wajib diisi.
- Menambahkan validasi minimal 3 karakter untuk setiap kolom teks.
- Menambahkan notifikasi ketika input belum valid.
- Menambahkan notifikasi ketika jadwal berhasil ditambahkan.
- Menambahkan indikator proses saat penyimpanan berlangsung.
- Menambahkan tombol batal pada form.
- Mempertahankan navigasi ke halaman semua jadwal.

### Improved
- Memperjelas label dan petunjuk pengisian form.
- Menambahkan ikon pada kolom input agar lebih mudah dikenali.
- Menyesuaikan tampilan form dengan desain utama JadwalKu.

### Notes
- Data jadwal masih disimpan sementara di memori aplikasi.
- Penyimpanan ke database belum diterapkan.

## [0.1] - BAB 5: Navigation

### Added
- Menambahkan navigasi dari halaman utama ke halaman semua jadwal.
- Menambahkan halaman untuk menampilkan daftar jadwal kuliah.
- Menambahkan navigasi menuju form tambah jadwal.

### Improved
- Menata alur perpindahan halaman agar lebih mudah digunakan.

## [0.0] - Initial Prototype

### Added
- Membuat struktur awal aplikasi JadwalKu menggunakan Flutter.
- Membuat halaman utama aplikasi.
- Menampilkan contoh jadwal kuliah.
- Membuat komponen kartu untuk menampilkan informasi jadwal.
- Menggunakan Material Design 3 dengan warna biru sebagai warna utama.


# Changelog – JadwalKu
3 November 2026
## [v0.3] – BAB 7 Data Module

### Added
- Menambahkan fitur Create untuk memasukkan data jadwal kuliah.
- Menambahkan fitur Read untuk menampilkan seluruh data jadwal.
- Menambahkan fitur Update untuk mengubah data jadwal.
- Menambahkan fitur Delete untuk menghapus data jadwal.
- Menambahkan dialog konfirmasi sebelum menghapus data.
- Menambahkan Empty State ketika daftar jadwal masih kosong.
- Menambahkan notifikasi menggunakan SnackBar setelah proses pengelolaan data.

### Improved
- Menggabungkan form tambah dan edit jadwal agar dapat digunakan kembali.
- Memperbarui tampilan daftar jadwal setelah data mengalami perubahan.
- Mempertahankan validasi input dari versi sebelumnya.

### Notes
- Data masih disimpan sementara menggunakan list di dalam aplikasi.
- Database permanen belum diterapkan pada versi ini.

## [v0.2] – BAB 6 Form & Validation

### Added
- Menambahkan form input jadwal kuliah.
- Menambahkan validasi pada setiap input.
- Menambahkan pilihan hari menggunakan dropdown.
- Menambahkan pesan informasi menggunakan SnackBar.

### Improved
- Memperbarui tampilan setelah data berhasil ditambahkan menggunakan setState().
- Memastikan data diperiksa sebelum diproses.

## [v0.1] – BAB 5 Navigation

### Added
- Membuat struktur awal aplikasi JadwalKu.
- Menambahkan halaman utama.
- Menambahkan navigasi antarhalaman.
- Menampilkan contoh jadwal kuliah.


Nama Aplikasi: JadwalKu  
Platform: Flutter  
Bahasa Pemrograman: Dart
