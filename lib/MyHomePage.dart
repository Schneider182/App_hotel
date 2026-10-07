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
        title: Text("Hotel"),
        backgroundColor: Color.fromARGB(0, 50, 145, 145),
      ),
      //Color.fromRGBO (opacity, red, green, blue)
      backgroundColor: Color(0xFF2373F4),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              child: TextFormField(
                // Dekorasi untuk TextFormField
                decoration: InputDecoration(
                  fillColor: Colors.orange,
                  hintText: 'Masukan Nama Kamu',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                // controller untuk ...
                controller: inputNama,
                // Ketika Dikirim nanti
                onFieldSubmitted: (values) {
                  // isi blabla ...
                  inputNama.text = values;
                },
              ),
            ),
          ),
          // Untuk kasih jarak antar widget
          Padding(
            padding: EdgeInsets.all(16),
          ),
          // Tombol
          ElevatedButton(
            child: Text("Tampilkan Nama"),
            onPressed: () {
              print(inputNama.text);
            },
          ),
        ],
      ),
    );
  }
}