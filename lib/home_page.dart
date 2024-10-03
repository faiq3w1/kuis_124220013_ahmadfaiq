import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pemesanan_page.dart';

class HomePage extends StatelessWidget {
  // Method to launch URL (Traveloka)
  void _launchURL() async {
    final Uri url = Uri.parse('https://www.traveloka.com/');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Blue Lagoon',
        'image': 'assets/image/hotel.jpg',
        'description': 'Beautiful hotel with a lagoon view',
        'price': 500000.0
      },
      {
        'name': 'Ocean Breeze',
        'image': 'assets/image/hotel.jpg',
        'description': 'Luxury hotel near the ocean',
        'price': 700000.0
      },
      {
        'name': 'Mountain Retreat',
        'image': 'assets/image/hotel.jpg',
        'description': 'Serene mountain retreat',
        'price': 600000.0
      },
      {
        'name': 'City Lights',
        'image': 'assets/image/hotel.jpg',
        'description': 'Modern hotel in the heart of the city',
        'price': 550000.0
      },
      {
        'name': 'Desert Mirage',
        'image': 'assets/image/hotel.jpg',
        'description': 'Exotic desert resort',
        'price': 750000.0
      },
      {
        'name': 'Rainforest Escape',
        'image': 'assets/image/hotel.jpg',
        'description': 'Hidden gem in the rainforest',
        'price': 800000.0
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 102, 1, 120),
        title: Row(
          children: [
            Image.asset(
              'assets/image/pintu.png', // Logo image path
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            const Text('Blue Doorz'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: _launchURL, // Button to open Traveloka website
            child: const Text(
              'About Us',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10, // Space between items
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      child: Image.asset(
                        product['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp${product['price'].toStringAsFixed(0)}/night',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  productName: product['name'],
                                  productImage: product['image'],
                                  productDescription: product['description'],
                                  productPrice: product['price'],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            textStyle: const TextStyle(fontSize: 14),
                          ),
                          child: const Text('Book Now'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
