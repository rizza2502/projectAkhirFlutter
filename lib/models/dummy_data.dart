final officialPartners = [
  'assets/khayla.png',
  'assets/borcelle.jpeg',
  'assets/garden.jpeg',
  'assets/eco.png',
];

final financialPartners = [
  'assets/kredivo.jpg',
  'assets/bni.jpg',
  'assets/bca.png',
  'assets/ovo.png',
];

class Order {
  final String id;
  final String serviceName;
  final String date;
  final String name;
  final String status;
  final String total;
  final String statusText;

  Order({
    required this.id,
    required this.serviceName,
    required this.date,
    required this.name,
    required this.status,
    required this.total,
    required this.statusText,
  });
}

final List<Order> sampleOrders = [
  Order(
    id: 'ORD-001', 
    serviceName: 'Bunga Mawar', 
    date: '2024-11-01', 
    name: 'Naila Rizza', 
    status: '50 Tangkai',
    total: 'Rp. 150.000',
    statusText: 'Selesai',
  ),
  Order(
    id: 'ORD-002', 
    serviceName: 'Bunga Tulip', 
    date: '2024-12-22', 
    name: 'Taufiqie', 
    status: '15 Tangkai',
    total: 'Rp. 60.000',
    statusText: 'Dalam Proses'
  ),
];