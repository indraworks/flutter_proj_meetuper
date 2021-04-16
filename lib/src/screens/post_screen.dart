//kita mau ambil data dari jsonplaceholder kita fetch datanya
//dan kita copy dulu data counter_home ganti nama classnya saja
//ini tuk latihan
//
import 'package:flutter/material.dart';

import 'widgets/bottom_navigation.dart';
import 'package:http/http.dart' as http;

//kita refactoring isi dari code,nama class sama
//sesuai dgn nama file dartnya

//manual

class PostScreen extends StatefulWidget {
  final String _title;
  //constructornya
  //
  PostScreen({String title}) : _title = title;

  // PostScreenState createState() => PostScreenState();
  //  yg diatas sama syntax commandnya dgn func () { return statement}
  @override
  _PostScreenState createState() {
    return _PostScreenState();
  }
}

class _PostScreenState extends State<PostScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Posts')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to our PostScreen',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
/*
nah kita akan fetch data posts dari JSONPlaceHolder 
utk cari package di https://pub.dev/packages/http
utk itu iunakan package  http 0.12.0+2
yang terupdate adalah http 0.13.1


*/
