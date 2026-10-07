import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Pembuatan Variabel Yang Akan Dipakai
  TextEditingController inputNama = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel"),
        backgroundColor: const Color.fromARGB(0, 50, 145, 145),
      ),
      backgroundColor: const Color(0xFF2373F4),
      body: Column(
        children: [
          const SizedBox(height: 20), // Memberikan sedikit jarak dari AppBar ke input field
          Center(
            child: SizedBox(
              width: 300,
              child: TextFormField(
                // Dekorasi untuk TextFormField
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Masukan Nama Kamu',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                // controller untuk menangkap input nama
                controller: inputNama,
                // Ketika user menekan tombol 'Enter'/'Done' pada keyboard ponsel
                onFieldSubmitted: (values) {
                  inputNama.text = values;
                },
              ),
            ),
          ),
          
          // NOTE: Kedua ElevatedButton ("Tampilkan Nama" dan "Logout") serta padding jaraknya sudah dihapus dari sini
        ],
      ),
    );
  }
}
