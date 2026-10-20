
import 'package:flutter/material.dart';

void main() {
  runApp(const JadwalKuApp());
}

const Color biru = Color(0xFF1976E8);
const Color latar = Color(0xFFF2F6FF);

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

class Jadwal {
  final String matkul;
  final String hari;
  final String jam;
  final String ruang;
  final String dosen;

  const Jadwal({
    required this.matkul,
    required this.hari,
    required this.jam,
    required this.ruang,
    required this.dosen,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Jadwal> daftar = [
    const Jadwal(
      matkul: 'Pemrograman Bergerak',
      hari: 'Senin',
      jam: '07.50–11.09',
      ruang: 'CC 4.1B',
      dosen: 'Yeni Dwi Rahayu',
    ),
    const Jadwal(
      matkul: 'Statistika',
      hari: 'Senin',
      jam: '12.50–15.50',
      ruang: 'CC 2.2',
      dosen: 'Dewi Lusiana',
    ),
  ];

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
        daftar.add(hasil);
      });
    }
  }

  Future<void> lihatSemua() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SemuaJadwalPage(
          daftar: daftar,
          onTambah: tambahJadwal,
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

    final jadwalHariIni =
        daftar.where((j) => j.hari == hariIni).toList();

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
            tooltip: 'Lihat semua jadwal',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  Icon(Icons.school, color: Colors.white, size: 38),
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
            const SizedBox(height: 8),
            Expanded(
              child: jadwalHariIni.isEmpty
                  ? const Center(
                      child: Text('Belum ada jadwal untuk hari ini.'),
                    )
                  : ListView.builder(
                      itemCount: jadwalHariIni.length,
                      itemBuilder: (context, index) {
                        return KartuJadwal(
                          jadwal: jadwalHariIni[index],
                        );
                      },
                    ),
            ),
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
}

class SemuaJadwalPage extends StatefulWidget {
  final List<Jadwal> daftar;
  final Future<void> Function() onTambah;

  const SemuaJadwalPage({
    super.key,
    required this.daftar,
    required this.onTambah,
  });

  @override
  State<SemuaJadwalPage> createState() => _SemuaJadwalPageState();
}

class _SemuaJadwalPageState extends State<SemuaJadwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Semua Jadwal')),
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
      body: widget.daftar.isEmpty
          ? const Center(child: Text('Belum ada jadwal kuliah.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.daftar.length,
              itemBuilder: (context, index) {
                return KartuJadwal(jadwal: widget.daftar[index]);
              },
            ),
    );
  }
}

class KartuJadwal extends StatelessWidget {
  final Jadwal jadwal;

  const KartuJadwal({super.key, required this.jadwal});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE3F2FD),
          child: Icon(Icons.menu_book, color: biru),
        ),
        title: Text(
          jadwal.matkul,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            '${jadwal.hari} • ${jadwal.jam}\n'
            'Ruang: ${jadwal.ruang}\n'
            'Dosen: ${jadwal.dosen}',
          ),
        ),
        isThreeLine: true,
      ),
    );
  }
}

class FormJadwal extends StatefulWidget {
  const FormJadwal({super.key});

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

  @override
  void dispose() {
    matkul.dispose();
    jam.dispose();
    ruang.dispose();
    dosen.dispose();
    super.dispose();
  }

  String? validasi(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Kolom ini wajib diisi';
    }
    return null;
  }

  void simpan() {
    if (!formKey.currentState!.validate()) return;

    Navigator.pop(
      context,
      Jadwal(
        matkul: matkul.text.trim(),
        hari: hari,
        jam: jam.text.trim(),
        ruang: ruang.text.trim(),
        dosen: dosen.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Jadwal Kuliah')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Isi Informasi Perkuliahan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: matkul,
              decoration: const InputDecoration(
                labelText: 'Mata Kuliah',
                border: OutlineInputBorder(),
              ),
              validator: validasi,
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              initialValue: hari,
              decoration: const InputDecoration(
                labelText: 'Hari',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Senin', child: Text('Senin')),
                DropdownMenuItem(value: 'Selasa', child: Text('Selasa')),
                DropdownMenuItem(value: 'Rabu', child: Text('Rabu')),
                DropdownMenuItem(value: 'Kamis', child: Text('Kamis')),
                DropdownMenuItem(value: 'Jumat', child: Text('Jumat')),
                DropdownMenuItem(value: 'Sabtu', child: Text('Sabtu')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => hari = value);
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: jam,
              decoration: const InputDecoration(
                labelText: 'Jam Kuliah',
                hintText: 'Contoh: 07.50–09.30',
                border: OutlineInputBorder(),
              ),
              validator: validasi,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: ruang,
              decoration: const InputDecoration(
                labelText: 'Ruang',
                border: OutlineInputBorder(),
              ),
              validator: validasi,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: dosen,
              decoration: const InputDecoration(
                labelText: 'Dosen',
                border: OutlineInputBorder(),
              ),
              validator: validasi,
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 52,
              child: FilledButton.icon(
                onPressed: simpan,
                icon: const Icon(Icons.save),
                label: const Text('Simpan Jadwal'),
                style: FilledButton.styleFrom(
                  backgroundColor: biru,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}
