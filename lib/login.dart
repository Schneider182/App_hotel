import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController inputNama = TextEditingController();
  final TextEditingController inputSandi = TextEditingController();

 
  bool isAdmin = true;


  static const Color biruBg = Color(0xFF2373F4);
  static const Color kuningAvatar = Color(0xFFF9F9A3);
  static const Color abuGelap = Color(0xFF4A4A4A);
  static const Color abuSegmen = Color(0xFFC9C9CE);
  static const Color abuPilihan = Color(0xFFEAEAEA);
  static const Color abuInput = Color(0xFFDADADA);
  static const Color hijauTombol = Color(0xFF55C99A);

 
  static const double lebarDesain = 402;
  static const double tinggiDesain = 874;

  @override
  void dispose() {
    inputNama.dispose();
    inputSandi.dispose();
    super.dispose();
  }

  
  List<BoxShadow> get _bayangan => [
        BoxShadow(
          color: Colors.black.withOpacity(0.35),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ];

  
  Widget _label(String teks, double top) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: Center(
        child: Text(
          teks,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ),
    );
  }


  Widget _textField(
    TextEditingController controller,
    double top, {
    bool obscure = false,
  }) {
    return Positioned(
      top: top,
      left: 32,
      right: 32,
      height: 42,
      child: Container(
        decoration: BoxDecoration(
          color: abuInput,
          boxShadow: _bayangan,
        ),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ),
      ),
    );
  }


  Widget _segmen() {
    const double lebar = 334;
    const double tinggi = 54;
    const double padding = 5;
    const double lebarPilihan = (lebar - padding * 2) / 2;

    return Positioned(
      top: 386,
      left: 34,
      width: lebar,
      height: tinggi,
      child: Container(
        decoration: BoxDecoration(
          color: abuSegmen,
          borderRadius: BorderRadius.circular(tinggi),
        ),
        child: Stack(
          children: [
            // Pil penanda pilihan aktif
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: isAdmin ? padding : padding + lebarPilihan,
              top: padding,
              width: lebarPilihan,
              height: tinggi - padding * 2,
              child: Container(
                decoration: BoxDecoration(
                  color: abuPilihan,
                  borderRadius: BorderRadius.circular(tinggi),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(() => isAdmin = true),
                    child: const Center(
                      child: Text(
                        "Admin",
                        style: TextStyle(fontSize: 32, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(() => isAdmin = false),
                    child: const Center(
                      child: Text(
                        "Users",
                        style: TextStyle(fontSize: 32, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Avatar: lingkaran kuning + kepala + badan
  Widget _avatar() {
    return Positioned(
      top: 18,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: 200,
          height: 260,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Lingkaran kuning
              Container(
                width: 196,
                height: 196,
                decoration: const BoxDecoration(
                  color: kuningAvatar,
                  shape: BoxShape.circle,
                ),
              ),
              // Badan
              Positioned(
                top: 179,
                child: Container(
                  width: 153,
                  height: 74,
                  decoration: BoxDecoration(
                    color: abuGelap,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: _bayangan,
                  ),
                ),
              ),
              // Kepala
              Positioned(
                top: 61,
                child: Container(
                  width: 86,
                  height: 86,
                  decoration: BoxDecoration(
                    color: abuGelap,
                    shape: BoxShape.circle,
                    boxShadow: _bayangan,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: biruBg,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        bottom: false,
        child: SizedBox.expand(
          // FittedBox supaya layout 402 x 874 ikut menyesuaikan layar
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: lebarDesain,
              height: tinggiDesain,
              child: Stack(
                children: [
                  // Ikon pengaturan (kanan atas)
                  Positioned(
                    top: 58,
                    right: 34,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      iconSize: 36,
                      color: abuGelap,
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ),

                  // Avatar
                  _avatar(),

                  
                  Positioned(
                    top: 336,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Pilih Cara Masuk",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  
                  _segmen(),

                  
                  _label("Masukkan Nama Pengguna", 455),
                  _textField(inputNama, 527),

                  
                  _label("Masukkan Kata Sandi", 608),
                  _textField(inputSandi, 645, obscure: true),

                 
                  Positioned(
                    top: 744,
                    left: 124,
                    width: 154,
                    height: 61,
                    child: Container(
                      decoration: BoxDecoration(
                        color: hijauTombol,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: _bayangan,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(40),
                          onTap: () {
                            print(
                              "Mode: ${isAdmin ? 'Admin' : 'Users'} | "
                              "Nama: ${inputNama.text} | "
                              "Sandi: ${inputSandi.text}",
                            );
                          },
                          child: const Center(
                            child: Text(
                              "Kirim",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}