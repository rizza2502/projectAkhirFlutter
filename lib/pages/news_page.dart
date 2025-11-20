import 'dart:convert';

import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  final List<Map<String, String>> newsData = const [
    {
      "title": "Bunga Rafflesia Arnoldi Tumbuh di Kebun Warga Cilodong",
      "image":
          "data:image/jpeg;base64,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",
      "desc": "Bunga Rafflesia Arnoldi ditemukan tumbuh di kebun milik Suhadi, Warga RT 04/RW 08, Kelurahan Cilodong, Kecamatan Cilodong. Bunga tersebut pertama kali ditemukan pada hari Sabtu, 11 Februari 2023. Bunga itu ditemukan oleh Bapak Suhadi, pemilik kebun. Diperkirakan masa bunganya akan tumbuh kurang lebih lima hari lagi”, ujar Lurah Cilodong, Herry Wibowo, kepada berita.depok.go.id, Selasa (14/02/23)."
    },
    {
      "title": "Bunga bangkai raksasa mekar di Kebun Raya Cibodas",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXBQOM-Mw6i8JTDRN-ZtDCt3GUuejwun9HBSBhZAfvdZjAvLsax7YtEJ15ewtyaa_bAPQ&usqp=CAU",
      "desc": "Bunga bangkai raksasa mekar di Kebun Raya Cibodas, Cianjur, Jawa Barat, dapat dinikmati wisatawan yang hendak menghabiskan libur panjang sekolah, dan bunga kedua yang mekar di tahun 2023."  
    },
    {
      "title": "Bunga Kertas: Pesona Sederhana yang Menawan",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Starr_030418-0058_Bougainvillea_spectabilis.jpg/1200px-Starr_030418-0058_Bougainvillea_spectabilis.jpg",
      "desc": "Bunga kertas, dengan nama ilmiah Bougainvillea, adalah tanaman merambat yang terkenal dengan keindahan bunganya yang berwarna-warni. Bunga kertas bukanlah bunga sesungguhnya, melainkan seludang daun yang disebut braktea yang memiliki warna yang mencolok, seperti merah, pink, ungu, kuning, dan putih."
    },
    {
      "title": "5 Bunga yang Bisa Dimakan",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKLHf9P1KVvAOFggkNyJcXxEmM1yB9xcS0Pg&s",
      "desc": "Edible flower merupakan bunga yang aman dimakan dan bisa ditoleransi oleh lidah."
    },
  ];
  
  get newsItem => null;

  // Fungsi untuk menampilkan modal detail berita
  void _showNewsDetailModal(BuildContext context, String title, String desc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Melengkungkan sudut
          ),
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.5, // Mengatur tinggi baris agar lebih mudah dibaca
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0, bottom: 24.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        highlightColor: Colors.transparent,
                        splashColor: const Color(0x335A2A77),
                        child: const Text(
                          "Tutup",
                          style: TextStyle(
                            color: Color(0xFF5A2A77), // Warna ungu tua
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // ---------------- HEADER ----------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFFFFB3D9), // warna pink sama
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  padding: EdgeInsets.zero, // membuat jarak rapat
                  constraints: const BoxConstraints(), // menghapus padding default
                ),

                const SizedBox(width: 6),

                const Text(
                  "Berita Lokal",
                  style: TextStyle(
                    fontSize: 16,      // lebih kecil
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),


          // ---------------- KONTEN BERITA ----------------
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Artikel Lokal",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 0.7,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Dapatkan berita lokal dari komunitas Anda",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 0.7,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // GRID BERITA
                  GridView.builder(
                    itemCount: newsData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      String imageUrl = newsData[index]["image"]!;
                      Widget gridImageWidget;

                      if (imageUrl.startsWith('data:image')) {
                        String base64String = imageUrl.split(',').last;
                        try {
                          gridImageWidget = Image.memory(
                            base64Decode(base64String),
                            height: 110,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(height: 110, color: Colors.grey[300], child: const Center(child: Text("Gagal muat Base64")));
                            },
                          );
                        } catch (e) {
                          gridImageWidget = Container(height: 110, color: Colors.red[100], child: const Center(child: Text("Base64 Invalid")));
                        }
                      } else {
                        gridImageWidget = Image.network(
                        imageUrl,
                          height: 110,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              height: 110,
                              color: Colors.grey[200],
                              child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 110,
                              color: Colors.grey[300],
                              child: const Center(child: Text("Gagal Muat Gambar")),
                            );
                          },
                        );
                      }
                      return InkWell(
                        onTap: () {
                          _showNewsDetailModal(
                            context,
                            newsData[index]["title"]!,
                            newsData[index]["desc"]!,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 248, 246, 255),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.vertical(top: Radius.circular(12)),
                                child: gridImageWidget,
                              ),

                              //JUDUL + DESKRIPSI
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      newsData[index]["title"]!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      newsData[index]["desc"]!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    // PANAH KECIL DI KANAN BAWAH
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 6), // geser panah kiri/dikit
                                        child : InkWell(
                                          onTap: () {
                                            _showNewsDetailModal(
                                              context,
                                              newsData[index]["title"]!,
                                              newsData[index]["desc"]!,
                                            );
                                          },
                                          child: const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14,
                                            color: Colors.grey,
                                          ),
                                        ),                                
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}