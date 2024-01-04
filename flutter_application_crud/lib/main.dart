import 'package:flutter/material.dart';
import 'package:flutter_application_crud/Mahasiswa.dart';
import 'package:flutter_application_crud/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Widget MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tgllahirController = TextEditingController();

  Mahasiswa? _selectedMahasiswa; // Lacak Mahasiswa yang dipilih untuk diedit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh CRUD'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _tgllahirController,
                    decoration: InputDecoration(labelText: 'Tgl Lahir'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_selectedMahasiswa == null) {
                        // Membuat Mahasiswa baru
                        Mahasiswa mahasiswaBaru = Mahasiswa(
                          id: 0,
                          nama: _namaController.text,
                          email: _emailController.text,
                          tgllahir: _tgllahirController.text,
                        );
                        await _apiService.createMahasiswa(mahasiswaBaru);
                      } else {
                        // Mengedit Mahasiswa yang sudah ada
                        Mahasiswa mahasiswaDiperbarui = Mahasiswa(
                          id: _selectedMahasiswa!.id,
                          nama: _namaController.text,
                          email: _emailController.text,
                          tgllahir: _tgllahirController.text,
                        );
                        await _apiService.updateMahasiswa(mahasiswaDiperbarui);
                        _selectedMahasiswa = null; // Reset Mahasiswa yang dipilih
                      }

                      // Bersihkan field teks
                      _namaController.clear();
                      _emailController.clear();
                      _tgllahirController.clear();

                      // Segarkan UI
                      setState(() {});
                    },
                    child: Text(_selectedMahasiswa == null
                        ? 'Buat Mahasiswa'
                        : 'Perbarui Mahasiswa'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Mahasiswa>>(
              future: _apiService.getMahasiswa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Mahasiswa> mahasiswas = snapshot.data!;
                  return ListView.builder(
                    itemCount: mahasiswas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(mahasiswas[index].nama),
                        subtitle: Text(mahasiswas[index].email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () async {
                                await _apiService
                                    .deleteMahasiswa(mahasiswas[index].id);
                                setState(() {
                                  mahasiswas.removeAt(index);
                                });
                              },
                              child: Text("Hapus"),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () async {
                                _selectedMahasiswa = mahasiswas[index];
                                // Set nilai ke controller untuk diedit
                                _namaController.text =
                                    _selectedMahasiswa!.nama;
                                _emailController.text =
                                    _selectedMahasiswa!.email;
                                _tgllahirController.text =
                                    _selectedMahasiswa!.tgllahir;

                                // Segarkan UI
                                setState(() {});
                              },
                              child: Text("Edit"),
                            ),
                          ],
                        ),
                        onTap: () async {
                          // Kode yang sudah ada untuk navigasi ke MahasiswaEditScreen
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget MahasiswaEditScreen
class MahasiswaEditScreen extends StatelessWidget {
  final Mahasiswa mahasiswa;

  MahasiswaEditScreen({required this.mahasiswa});

  final ApiService _apiService = ApiService();
  final TextEditingController _editedNamaController = TextEditingController();
  final TextEditingController _editedEmailController = TextEditingController();
  final TextEditingController _editedTglLahirController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    _editedNamaController.text = mahasiswa.nama;
    _editedEmailController.text = mahasiswa.email;
    _editedTglLahirController.text = mahasiswa.tgllahir;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _editedNamaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _editedEmailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _editedTglLahirController,
                decoration: InputDecoration(labelText: 'Tgl Lahir'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Contoh: Memperbarui Mahasiswa yang sudah ada
                  Mahasiswa mahasiswaDiperbarui = Mahasiswa(
                    id: mahasiswa.id,
                    nama: _editedNamaController.text,
                    email: _editedEmailController.text,
                    tgllahir: _editedTglLahirController.text,
                  );

                  // Simpan Mahasiswa yang diperbarui
                  await _apiService.updateMahasiswa(mahasiswaDiperbarui);

                  // Kembalikan Mahasiswa yang diperbarui ke layar pemanggil
                  Navigator.pop(context, mahasiswaDiperbarui);
                },
                child: Text('Perbarui Mahasiswa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
