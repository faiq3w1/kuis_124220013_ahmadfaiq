import 'package:flutter/material.dart';

class PembayaranPage extends StatelessWidget {
  final String namaLengkap;
  final String email;
  final int totalKamar;
  final int totalMalam;
  final double harga;

  const PembayaranPage({
    super.key,
    required this.namaLengkap,
    required this.email,
    required this.totalKamar,
    required this.totalMalam,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    final totalHarga = totalKamar * totalMalam * harga;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        // Latar belakang gradasi ungu dan hitam
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          // Membuat seluruh konten berada di tengah
          child: Card(
            // Kartu dengan warna transparan
            color: Colors.black.withOpacity(0.9),
            elevation: 8, // Memberikan bayangan pada kartu
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Sudut membulat
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Ukuran kolom disesuaikan dengan konten
                mainAxisAlignment: MainAxisAlignment
                    .center, // Konten berada di tengah secara vertikal
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Konten berada di tengah secara horizontal
                children: [
                  const Text(
                    'Informasi Pembayaran',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nama Lengkap: $namaLengkap',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Email: $email',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Total Kamar: $totalKamar',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Total Malam: $totalMalam',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Harga per Malam: Rp${harga.toStringAsFixed(0)}',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Total Harga: Rp${totalHarga.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pembayaran Berhasil!')),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Rounded corners for button
                      ),
                    ),
                    child: const Text('Pay Now'),
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
