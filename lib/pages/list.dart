import 'package:flutter/material.dart';
import 'package:movie_com/models/dummy_data.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // --------------------- HEADER KECIL ---------------------
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45), // tinggi kecil
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 254, 176, 224),
          elevation: 0,
          leadingWidth: 40,

          // PANAH KEMBALI
          leading: IconButton(
            padding: EdgeInsets.zero,                // rapat
            constraints: const BoxConstraints(),     // hilangkan padding default
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          titleSpacing: 0,
          // JUDUL
          title: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "Daftar Pesanan",
              style: TextStyle(
                fontSize: 16,            // kecil seperti NewsPage
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      // ---------------------------------------------------------

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: sampleOrders.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada pesanan',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : ListView.builder(
                itemCount: sampleOrders.length,
                itemBuilder: (context, index) {
                  final order = sampleOrders[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(
                        order.serviceName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      subtitle: Text(
                        'Tanggal: ${order.date}\n'
                        'Nama: ${order.name}\n'
                        'Jumlah: ${order.status}\n',
                      ),

                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            order.statusText,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: order.statusText == 'Selesai'
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            order.total,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      isThreeLine: true,

                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => Dialog(
                            backgroundColor: Colors.transparent,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 300),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1EAF4),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Detail\nPesanan',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),

                                    Text('ID: ${order.id}'),
                                    Text('Layanan: ${order.serviceName}'),
                                    Text('Nama: ${order.name}'),
                                    Text('Jumlah: ${order.status}'),
                                    Text('Total: ${order.total}'),

                                    const SizedBox(height: 20),
                                    Center(
                                      child: TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context),
                                        child: const Text(
                                          "Tutup",
                                          style: TextStyle(
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
