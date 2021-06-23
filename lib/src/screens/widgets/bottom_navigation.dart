//kita copy smua bottom_navigation
//jangan lupa ubah _ yg di luar  kalang jadi plural bukan private variablenya
// biar bisa di import oleh file yang lainnya
//ubah stateless jadi statefull stlah ini menuju counter home ganti _ nya bottom jadi biasa
//klil kanann dan import
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() {
    //jgn lupa stlah create state di bagian class anak tulis
    // _BottomNavigationState extends state<_BottomNavigation>
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex, //ini utk kasih index nilai
      onTap: (int index) {
        setState(() => _currentIndex = index);
      },
      //jika stap di click
      items: [
        // ignore: deprecated_member_use
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.person), title: Text('Profile')),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.settings), title: Text('Settings')),
      ],
    );
  }
}
