
import 'package:flutter/material.dart';

void main() {
  runApp(const JadwalKuApp());
}

const Color biru = Color(0xFF1976E8);
const Color latar = Color(0xFFF2F6FF);

// ==================== MODEL DATA ====================

class Jadwal {
  final int id;
  final String matkul;
  final String hari;
  final String jam;
  final String ruang;
  final String dosen;

  const Jadwal({
    required this.id,
    required this.matkul,
    required this.hari,
    required this.jam,
    required this.ruang,
    required this.dosen,
  });

  Jadwal copyWith({
    String? matkul,
    String? hari,
    String? jam,
    String? ruang,
    String? dosen,
  }) {
    return Jadwal(
      id: id,
      matkul: matkul ?? this.matkul,
      hari: hari ?? this.hari,
      jam: jam ?? this.jam,
      ruang: ruang ?? this.ruang,
      dosen: dosen ?? this.dosen,
    );
  }
}

// ==================== APLIKASI ====================

class JadwalKuApp extends StatelessWidget {
  const JadwalKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JadwalKu',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: biru),
        scaffoldBackgroundColor: latar,
      ),
      home: const HomePage(),
    );
  }
}

// ==================== HALAMAN UTAMA ====================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Jadwal> daftar = [
    const Jadwal(
      id: 1,
      matkul: 'Pemrograman Bergerak',
      hari: 'Senin',
      jam: '07.50–11.09',
      ruang: 'CC 4.1B',
      dosen: 'Yeni Dwi Rahayu',
    ),
    const Jadwal(
      id: 2,
      matkul: 'Statistika',
      hari: 'Senin',
      jam: '12.50–15.50',
      ruang: 'CC 2.2',
      dosen: 'Dewi Lusiana',
    ),
  ];

  int nextId = 3;

  // CREATE
  Future<void> tambahJadwal() async {
    final hasil = await Navigator.push<Jadwal>(
      context,
      MaterialPageRoute(
        builder: (context) => const FormJadwal(),
      ),
    );

    if (!mounted) return;

    if (hasil != null) {
      setState(() {
        daftar.add(
          Jadwal(
            id: nextId,
            matkul: hasil.matkul,
            hari: hasil.hari,
            jam: hasil.jam,
            ruang: hasil.ruang,
            dosen: hasil.dosen,
          ),
        );
        nextId++;
      });

      tampilPesan('Jadwal berhasil ditambahkan!');
    }
  }

  // UPDATE
  Future<void> editJadwal(Jadwal jadwal) async {
    final hasil = await Navigator.push<Jadwal>(
      context,
      MaterialPageRoute(
        builder: (context) => FormJadwal(jadwal: jadwal),
      ),
    );

    if (!mounted) return;

    if (hasil != null) {
      setState(() {
        final index = daftar.indexWhere(
          (item) => item.id == jadwal.id,
        );

        if (index != -1) {
          daftar[index] = hasil;
        }
      });

      tampilPesan('Jadwal berhasil diperbarui!');
    }
  }

  // DELETE
  void hapusJadwal(Jadwal jadwal) {
    setState(() {
      daftar.removeWhere(
        (item) => item.id == jadwal.id,
      );
    });

    tampilPesan('Jadwal berhasil dihapus!');
  }

  // USER FEEDBACK
  void tampilPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
  }

  // NAVIGASI SEMUA JADWAL
  Future<void> lihatSemua() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SemuaJadwalPage(
          daftar: daftar,
          onTambah: tambahJadwal,
          onEdit: editJadwal,
          onHapus: hapusJadwal,
        ),
      ),
    );

    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hariIni = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ][DateTime.now().weekday - 1];

    final jadwalHariIni = daftar
        .where((jadwal) => jadwal.hari == hariIni)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JadwalKu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: lihatSemua,
            icon: const Icon(Icons.calendar_month),
            tooltip: 'Semua Jadwal',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: biru,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 38,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Halo, Mahasiswa!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Atur jadwal kuliahmu dengan mudah.',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // JADWAL HARI INI
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Jadwal Hari Ini',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: lihatSemua,
                  child: const Text('Lihat Semua'),
                ),
              ],
            ),

            Text(
              hariIni,
              style: const TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: jadwalHariIni.isEmpty
                  ? const EmptyState(
                      pesan: 'Belum ada jadwal kuliah hari ini.',
                    )
                  : ListView.builder(
                      itemCount: jadwalHariIni.length,
                      itemBuilder: (context, index) {
                        return KartuJadwal(
                          jadwal: jadwalHariIni[index],
                          onEdit: () =>
                              editJadwal(jadwalHariIni[index]),
                          onDelete: () =>
                              konfirmasiHapus(jadwalHariIni[index]),
                        );
                      },
                    ),
            ),

            // TOMBOL TAMBAH
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton.icon(
                onPressed: tambahJadwal,
                icon: const Icon(Icons.add),
                label: const Text('Tambah Jadwal Kuliah'),
                style: FilledButton.styleFrom(
                  backgroundColor: biru,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // DIALOG KONFIRMASI HAPUS
  Future<void> konfirmasiHapus(Jadwal jadwal) async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus Jadwal'),
          content: Text(
            'Apakah kamu yakin ingin menghapus '
            '${jadwal.matkul}?',
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, false),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, true),
              child: const Text(
                'Hapus',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (konfirmasi == true && mounted) {
      hapusJadwal(jadwal);
    }
  }
}

// ==================== HALAMAN SEMUA JADWAL ====================

class SemuaJadwalPage extends StatefulWidget {
  final List<Jadwal> daftar;
  final Future<void> Function() onTambah;
  final Future<void> Function(Jadwal) onEdit;
  final void Function(Jadwal) onHapus;

  const SemuaJadwalPage({
    super.key,
    required this.daftar,
    required this.onTambah,
    required this.onEdit,
    required this.onHapus,
  });

  @override
  State<SemuaJadwalPage> createState() =>
      _SemuaJadwalPageState();
}

class _SemuaJadwalPageState extends State<SemuaJadwalPage> {
  final List<String> urutanHari = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
  ];

  Future<void> konfirmasiHapus(Jadwal jadwal) async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus Jadwal'),
          content: Text(
            'Yakin ingin menghapus ${jadwal.matkul}?',
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, false),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, true),
              child: const Text(
                'Hapus',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (konfirmasi == true && mounted) {
      widget.onHapus(jadwal);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = [...widget.daftar];

    data.sort((a, b) {
      final urutanA = urutanHari.indexOf(a.hari);
      final urutanB = urutanHari.indexOf(b.hari);

      return urutanA.compareTo(urutanB);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Jadwal'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await widget.onTambah();

          if (!mounted) return;
          setState(() {});
        },
        backgroundColor: biru,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
      body: data.isEmpty
          ? const EmptyState(
              pesan: 'Belum ada jadwal kuliah.\n'
                  'Silakan tambahkan jadwal baru.',
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final jadwal = data[index];

                return KartuJadwal(
                  jadwal: jadwal,
                  onEdit: () async {
                    await widget.onEdit(jadwal);

                    if (!mounted) return;
                    setState(() {});
                  },
                  onDelete: () => konfirmasiHapus(jadwal),
                );
              },
            ),
    );
  }
}

// ==================== KARTU JADWAL ====================

class KartuJadwal extends StatelessWidget {
  final Jadwal jadwal;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const KartuJadwal({
    super.key,
    required this.jadwal,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Color(0xFFE3F2FD),
            child: Icon(
              Icons.menu_book,
              color: biru,
            ),
          ),
          title: Text(
            jadwal.matkul,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              '${jadwal.hari} • ${jadwal.jam}\n'
              'Ruang: ${jadwal.ruang}\n'
              'Dosen: ${jadwal.dosen}',
            ),
          ),
          isThreeLine: true,
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit') {
                onEdit();
              } else if (value == 'hapus') {
                onDelete();
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    Icon(Icons.edit, size: 20),
                    SizedBox(width: 8),
                    Text('Edit'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'hapus',
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text('Hapus'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== EMPTY STATE ====================

class EmptyState extends StatelessWidget {
  final String pesan;

  const EmptyState({
    super.key,
    required this.pesan,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.event_busy,
            size: 65,
            color: Colors.black26,
          ),
          const SizedBox(height: 12),
          Text(
            pesan,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== FORM TAMBAH DAN EDIT ====================

class FormJadwal extends StatefulWidget {
  final Jadwal? jadwal;

  const FormJadwal({
    super.key,
    this.jadwal,
  });

  @override
  State<FormJadwal> createState() => _FormJadwalState();
}

class _FormJadwalState extends State<FormJadwal> {
  final formKey = GlobalKey<FormState>();

  final matkul = TextEditingController();
  final jam = TextEditingController();
  final ruang = TextEditingController();
  final dosen = TextEditingController();

  String hari = 'Senin';
  bool sedangMenyimpan = false;

  bool get modeEdit => widget.jadwal != null;

  @override
  void initState() {
    super.initState();

    if (modeEdit) {
      matkul.text = widget.jadwal!.matkul;
      hari = widget.jadwal!.hari;
      jam.text = widget.jadwal!.jam;
      ruang.text = widget.jadwal!.ruang;
      dosen.text = widget.jadwal!.dosen;
    }
  }

  @override
  void dispose() {
    matkul.dispose();
    jam.dispose();
    ruang.dispose();
    dosen.dispose();
    super.dispose();
  }

  // VALIDASI INPUT
  String? validasi(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Kolom ini wajib diisi';
    }

    if (value.trim().length < 3) {
      return 'Minimal harus 3 karakter';
    }

    return null;
  }

  // SIMPAN DATA
  Future<void> simpan() async {
    FocusScope.of(context).unfocus();

    if (!formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Periksa kembali input yang masih salah.',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      sedangMenyimpan = true;
    });

    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    if (!mounted) return;

    final jadwalBaru = Jadwal(
      id: widget.jadwal?.id ?? 0,
      matkul: matkul.text.trim(),
      hari: hari,
      jam: jam.text.trim(),
      ruang: ruang.text.trim(),
      dosen: dosen.text.trim(),
    );

    setState(() {
      sedangMenyimpan = false;
    });

    Navigator.pop(context, jadwalBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          modeEdit ? 'Edit Jadwal Kuliah' : 'Tambah Jadwal Kuliah',
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              modeEdit
                  ? 'Perbarui Informasi Perkuliahan'
                  : 'Isi Informasi Perkuliahan',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Lengkapi informasi jadwal kuliah berikut.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // MATA KULIAH
            TextFormField(
              controller: matkul,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Mata Kuliah',
                hintText: 'Contoh: Pemrograman Bergerak',
                prefixIcon: Icon(Icons.menu_book),
                border: OutlineInputBorder(),
              ),
              validator: validasi,
            ),
            const SizedBox(height: 15),

            // HARI
            DropdownButtonFormField<String>(
              initialValue: hari,
              decoration: const InputDecoration(
                labelText: 'Hari',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Senin',
                  child: Text('Senin'),
                ),
                DropdownMenuItem(
                  value: 'Selasa',
                  child: Text('Selasa'),
                ),
                DropdownMenuItem(
                  value: 'Rabu',
                  child: Text('Rabu'),
                ),
                DropdownMenuItem(
                  value: 'Kamis',
                  child: Text('Kamis'),
                ),
                DropdownMenuItem(
                  value: 'Jumat',
                  child: Text('Jumat'),
                ),
                DropdownMenuItem(
                  value: 'Sabtu',
                  child: Text('Sabtu'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    hari = value;
                  });
                }
              },
            ),
            const SizedBox(height: 15),

            // JAM KULIAH
            TextFormField(
              controller: jam,
              decoration: const InputDecoration(
                labelText: 'Jam Kuliah',
                hintText: 'Contoh: 07.50–09.30',
                prefixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(),
              ),
              validator: validasi,
            ),
            const SizedBox(height: 15),

            // RUANG
            TextFormField(
              controller: ruang,
              textCapitalization: TextCapitalization.characters,
              decoration: const InputDecoration(
                labelText: 'Ruang',
                hintText: 'Contoh: CC 4.1B',
                prefixIcon: Icon(Icons.meeting_room),
                border: OutlineInputBorder(),
              ),
              validator: validasi,
            ),
            const SizedBox(height: 15),

            // DOSEN
            TextFormField(
              controller: dosen,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Dosen',
                hintText: 'Nama dosen pengampu',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: validasi,
            ),
            const SizedBox(height: 25),

            // TOMBOL SIMPAN
            SizedBox(
              height: 52,
              child: FilledButton.icon(
                onPressed: sedangMenyimpan ? null : simpan,
                icon: sedangMenyimpan
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.save),
                label: Text(
                  sedangMenyimpan
                      ? 'Menyimpan...'
                      : modeEdit
                          ? 'Perbarui Jadwal'
                          : 'Simpan Jadwal',
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: biru,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: sedangMenyimpan
                  ? null
                  : () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}

