import 'package:flutter/material.dart';

class UserStore extends StatelessWidget {
  final List<ItemInfo> itemInfoList = [
    ItemInfo(price: 'Rp 50.000', description: 'Dompet Kulit'),
    ItemInfo(price: 'Rp 50.000', description: 'Dompet Bagus'),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2, // Ubah ini menjadi 2 atau 3 untuk tata letak
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: List.generate(itemInfoList.length, (index) {
            ItemInfo itemInfo = itemInfoList[index];
            String imageName = 'assets/dompet.jpg'; // insert foto

            return GestureDetector(
              onTap: () {
                _showItemDetails(context, itemInfo);
              },
              child: Card(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: 200.0,
                      child: Center(
                        child: Image.asset(imageName, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Harga: ${itemInfo.price}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Deskripsi: ${itemInfo.description}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _showItemDetails(BuildContext context, ItemInfo itemInfo) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detail Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Harga: ${itemInfo.price}'),
              SizedBox(height: 10.0),
              Text('Deskripsi: ${itemInfo.description}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

class ItemInfo {
  final String price;
  final String description;

  ItemInfo({required this.price, required this.description});
}

void main() => runApp(MaterialApp(
      home: UserStore(),
    ));
