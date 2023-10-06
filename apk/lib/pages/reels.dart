import 'package:flutter/material.dart';

void main() => runApp(UserReels());

class UserReels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reels'),
          backgroundColor: Colors.grey,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // Tambahkan aksi
              },
            ),
          ],
        ),
        body: ReelsList(),
      ),
    );
  }
}

class ReelsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ReelsItem();
      },
    );
  }
}

class ReelsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/tikus2.jpg',
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.0),
          Text(
            'Berita Penting!!',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Mafia telah memberantas para tikus-tikus kantor',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.favorite_border),
                  SizedBox(width: 5.0),
                  Text('100'),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(width: 5.0),
                  Text('50'),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.send),
                  SizedBox(width: 5.0),
                  Text('Share'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
