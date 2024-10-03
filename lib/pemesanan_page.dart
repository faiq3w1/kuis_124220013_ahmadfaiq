import 'package:flutter/material.dart';
import 'pembayaran_page.dart'; // Impor halaman pembayaran

class DetailPage extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productDescription;
  final double productPrice;

  const DetailPage({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.productPrice,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Controller untuk menangkap input teks pengguna
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _totalRoomController = TextEditingController();
  final TextEditingController _totalNightController = TextEditingController();

  @override
  void dispose() {
    // Membersihkan controller saat widget dihapus dari tree
    _nameController.dispose();
    _emailController.dispose();
    _totalRoomController.dispose();
    _totalNightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName), // Menampilkan nama produk
        backgroundColor: Colors.deepPurple, // Mengatur warna AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black], // Warna gradien
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                elevation: 4, // Mengatur efek bayangan kartu
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Sudut membulat
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Gambar produk
                      Image.asset(
                        widget.productImage,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 12),
                      // Nama produk
                      Text(
                        widget.productName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      // Deskripsi produk
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.productDescription,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      // Input teks dari pengguna
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _totalRoomController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Total Kamar',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _totalNightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Total Malam',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Harga produk dan tombol ke halaman pembayaran
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Harga: Rp${widget.productPrice.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () {
                              // Kirim data ke halaman pembayaran
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PembayaranPage(
                                    namaLengkap: _nameController.text,
                                    email: _emailController.text,
                                    totalKamar:
                                        int.parse(_totalRoomController.text),
                                    totalMalam:
                                        int.parse(_totalNightController.text),
                                    harga: widget.productPrice,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.deepPurple,
                            ),
                            child: const Text('Bayar Sekarang'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
