import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OwnerProfilePage extends StatelessWidget {
  // --- Data Profil Owner (GANTI DENGAN DATA ANDA) ---
  final String ownerName = "Mauludia Naila Rizza Maula";
  final String birthInfo = "Malang, 25 February 2009";
  final String address = "Jl. Teluk Pelabuhan Ratu 117 Malang";
  final String waNumber = "6281399373330"; // Format internasional tanpa '+'
  final String instagramHandle = "@rizzamaulaa_";
  final String tiktokHandle = "@whooo._10";
  // ----------------------------------------------------

  const OwnerProfilePage({super.key});

  // Fungsi untuk membuka URL (WA, IG, TT)
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  // --- Widget Kustom untuk Item Informasi yang Bisa Diklik ---
  Widget _buildClickableInfoItem({
    required IconData icon,
    required String title,
    required String value,
    required String url,
    required Color color,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: color, size: 28),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(value, style: const TextStyle(fontSize: 15)),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () => _launchUrl(url),
        ),
        const Divider(height: 1, indent: 72, endIndent: 16), // Divider tipis
      ],
    );
  }
  
  // --- Widget Kustom untuk Item Informasi Statis ---
  Widget _buildStaticInfoItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.grey[700], size: 28),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(value, style: const TextStyle(fontSize: 15)),
        ),
        const Divider(height: 1, indent: 72, endIndent: 16),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil Owner", 
          style: TextStyle(
            fontSize: 16,            // kecil seperti NewsPage
            fontWeight: FontWeight.w600,
            color: Colors.black,
          )
        ),
        backgroundColor: const Color(0xFFFFB3D9),
        iconTheme: const IconThemeData(color: Colors.black),
        titleSpacing: 0.0,
        leadingWidth: 40.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // 1. Bagian Foto dan Nama (Di Tengah)
          Center(
            child: Column(
              children: [
                // FOTO PROFIL (Agak Besar)
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: const AssetImage('assets/rizza.jpg'), 
                  
                ),
                const SizedBox(height: 12),
                
                // NAMA LENGKAP
                Text(
                  ownerName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          
          const Text(
            "INFORMASI DASAR", 
            style: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.bold, 
              color: Colors.grey
            )
          ),
          const SizedBox(height: 8),

          // 2. Tempat Tanggal Lahir (Statis)
          _buildStaticInfoItem(
            icon: Icons.calendar_today,
            title: "Tempat/Tgl Lahir",
            value: birthInfo,
          ),
          
          // 3. Alamat (Statis)
          _buildStaticInfoItem(
            icon: Icons.location_on,
            title: "Alamat",
            value: address,
          ),
          
          const SizedBox(height: 32),

          const Text(
            "MEDIA SOSIAL & KONTAK", 
            style: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.bold, 
              color: Colors.grey
            )
          ),
          const SizedBox(height: 8),

          // 4. WhatsApp (Bisa Diklik)
          _buildClickableInfoItem(
            icon: Icons.chat,
            title: "Nomor WhatsApp",
            value: waNumber,
            url: 'https://wa.me/$waNumber', // Link WhatsApp
            color: Colors.green,
          ),
          
          // 5. Instagram (Bisa Diklik)
          _buildClickableInfoItem(
            icon: Icons.camera_alt, // Atau Icon khusus IG jika ada
            title: "Instagram",
            value: "@rizzamaulaa_",
            url: 'https://www.instagram.com/rizzamaulaa_/?utm_source=ig_web_button_share_sheet',
            color: Colors.purple,
          ),

          // 6. TikTok (Bisa Diklik)
          _buildClickableInfoItem(
            icon: Icons.person_sharp, // Atau Icon khusus TT jika ada
            title: "TikTok",
            value: "@whooo._10",
            url: 'https://www.tiktok.com/@whooo._10?is_from_webapp=1&sender_device=pc',
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}