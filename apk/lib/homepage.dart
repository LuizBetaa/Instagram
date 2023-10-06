import 'package:apk/pages/account.dart';
import 'package:apk/pages/chat_screen.dart';
import 'package:apk/pages/home.dart';
import 'package:apk/pages/reels.dart';
import 'package:apk/pages/search.dart';
import 'package:apk/pages/store_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) :super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  void _navigateBottonNavBar (int Index) {
    setState(() {
      _selectedIndex = Index;
    });
  }

//buat halaman masing-masing
final List<Widget> _children = [
UserHome(),
UserSearch(),
UserReels(),
UserStore(),
UserChat(),
UserAccount(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold( //kerangka 
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottonNavBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call),label: 'reels'),
          BottomNavigationBarItem(icon: Icon(Icons.store),label: 'store'),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'account'),
          ],    
      ),
    ); 
  }
}