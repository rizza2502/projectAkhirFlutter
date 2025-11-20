import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../pages/list.dart';

class PesananPage extends StatelessWidget {
  const PesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: sampleOrders.isEmpty
          ? Center(child: Text('Belum ada pesanan', style: TextStyle(fontSize: 16)))
          : ListView.builder(
            itemCount: sampleOrders.length,
            itemBuilder: (context, index) {
              final order = sampleOrders[index];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(order.serviceName),
                  subtitle: Text('Tanggal: ${order.date}\nID: ${order.id}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(order.status, style: TextStyle(color: order.status == 'Selesai' ? Colors.green : Colors.orange)),
                      SizedBox(height: 6),
                      Text(order.total, style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  isThreeLine: true,
                  onTap: () {
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 253, 227, 252),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Detail\nPesanan',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),

                                Text('ID: ${order.id}', style: TextStyle(fontSize: 16)),
                                Text('Layanan: ${order.serviceName}', style: TextStyle(fontSize: 16)),
                                Text('Status: ${order.status}', style: TextStyle(fontSize: 16)),
                                Text('Total: ${order.total}', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 25),

                                Center(
                                  child: TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'Tutup',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  },
                ),
              );
            }
          ),
      ),
    );
  }
}