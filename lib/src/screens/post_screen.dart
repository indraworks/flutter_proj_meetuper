import 'package:flutter/material.dart';

import 'widgets/bottom_navigation.dart';
import 'package:http/http.dart' as http; //kita import
//sblumnya istall atau tulis file yaml
////sumber http: ===========>>>>https://pub.dev/packages/http
//kita taruh di yaml file : http: ^0.12.0+2  otomatis ntr menginstall dengan sendirinya
import 'dart:convert'; //utk convert object json jadi string

//kita refactoring isi dari code,nama class sama
//sesuai dgn nama file dartnya

//manual

class PostScreen extends StatefulWidget {
  // final String _title; gak perlu title!
  // //constructornya
  // //
  // PostScreen({String title}) : _title = title;

  // PostScreenState createState() => PostScreenState();
  //  yg diatas sama syntax commandnya dgn func () { return statement}
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  //kit ambuat varable penampung krn yg dikeluarkan adalah array kita
  //dart pake list
  List<dynamic> _posts = [];
//pengenalan listView :
//https://medium.com/nusanet/flutter-listview-7de1759b4fb1
//jadi dibuat initState yg didalamnya ada super.initState
////krn module ini diambil dari parent  nah baru dibawahnya ada
// functon ambil data disrever yaitu fetchPost

  void initState() {
    super.initState(); //panggil initstate
    _fetchPost();
  }

  void _fetchPost() {
    http.get('https://jsonplaceholder.typicode.com/posts').then((res) {
      final posts = jsonDecode(res.body);
      setState(() => _posts = posts);
    });
  }

  Widget build(BuildContext context) {
    print('aim calling build');
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Posts')),
      body: _PostList(posts: _posts), //artinya hasil variable local _post
      //dimasukan kedalam param posts pada kontstructor _Postlist dibawah
      //agar nilai bisa dimap ditampilkan lewat ListView amazing :D
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

/*
next capther adalah kita lihat dalam 1 layar mesti ada 17 line listView saja 
gak smua di tampilkan ke scrol kita bahas di bab berikutnya

*/

/*
tugas assignment:
create new stateless widget "_PostList" didalam post_screen.dart 
move ListView dari body widget ke widget di _Postlist
provide PsotList to body of scafold in PostScreen
buat kosntructor didalam _Poslist dan pass _post :posts didalam constructor
sbb:
*/
class _PostList extends StatelessWidget {
  //nah Postlis nani dimasukan ke body di atas
  //widget build dari _PostScreen

  //buat instaciate variable _posts
  final List<dynamic> _posts; //ini localnya

  //buat posts constructor
  //yg dalam kurung diknstructor adalah param dari luar
  //({List<dynamic> posts}) nah strlah tanda : adalah _posts =  posts
  //artinay posts param dari luar di berikan pasing ke variable local _posts
  _PostList({List<dynamic> posts}) : _posts = posts;

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //     children: _posts.map((post) {
    //   //children brupa array ya tapi kita pakai adalah _posts yg
    //   return ListTile(
    //       title: Text(post['title']), //title dan subtitle adalah default widget
    //       //style yg akan di tampilkan di listTile ( namanya lho ya )
    //       //kalau tulis body: post['body'],body: not defined jadi msti ikuti
    //       //aturan dari flutternya
    //       subtitle: Text(post['body']));
    //   //ingat karena data brupa sting post['body']
    //   //maka utk tampilkan kewidget maka harus pake Text()
    // }).toList()
    //     //sama berupa list kita map dan tampilkan di ListTile,
    //     );
    ///////buat listbuilder dan divider()
    return ListView.builder(
      itemCount: _posts.length *
          2, //itemCount ini sama kayak itemBuilder properties dari listView.Builder
      itemBuilder: (BuildContext context, int i) {
        //ingat i ini sama dgn itemCOunt nilai max-nya
        if (i.isOdd) {
          return Divider(); //jika ganjil maka render diayar widget Divider/garis pemisah

        }
        final index = i ~/ 2;
        return ListTile(
          title: Text(_posts[index]['title']),
          subtitle: Text(_posts[index]['body']),
        );
      },
    );
  }
}

/*
kita akan buat list builder yg jadi masalah adalah ketika di scroll
trus padahal index sudah selesai utk itu dibuat batasan dari length index
nah yg kedua kita buat Divider() yaitu wdget garis pemisah antar widget listTile
jadi seprti ada space antar widget listTile

///// seblum ada buat divider ////
return ListView.builder(
      itemCount: _posts
          .length, //itemCount ini sama kayak itemBuilder properties dari listView.Builder
      itemBuilder: (BuildContext context, int i) { //ingat i ini sama dgn itemCOunt nilai max-nya
        print(i);
        print(_posts.length);
        print(_posts[i]['title']);

        //i buat index array-nya
        return ListTile(
          title: Text(_posts[i]['title']),
          subtitle: Text(_posts[i]['body']),
        );
      },
    );
*/

/*PENTING Alau fetch data dari serrver ini mirip dgn useEffect di react
utk itu haru di ambil skali kalau kita pakai di widget build maka akan 
terus menerus ,utk itu kita taruh di ..R
j

penting harus sudah install utk itu iunakan package  http 0.12.0+2
caranya taruh di yaml file
//kita taruh di yaml file : http: ^0.12.0+2  otomatis ntr menginstall dengan sendirinya


PENTING jadi useEffect()nya atau functionnya harus ditaruh di widget builder 
sebab kalau didalam akan trus menerus jika lagi hotreload di update 

*/

/* NOTE HTPP-nya
nah kita akan fetch data posts dari JSONPlaceHolder 
utk cari package di https://pub.dev/packages/http
utk itu iunakan package  http 0.12.0+2
yang terupdate adalah http 0.13.1
//kita mau ambil data dari jsonplaceholder kita fetch datanya
//dan kita copy dulu data counter_home ganti nama classnya saja
//ini tuk latihan
//sumber http: ===========>>>>https://pub.dev/packages/http
//kita taruh di yaml file : http: ^0.12.0+2  otomatis ntr menginstall dengan sendirinya

*/

/* 
Keteranan pada initState :
void initState() {
    super.initState(); //panggil initstate
    print('hello initState');
    http.get('https://jsonplaceholder.typicode.com/posts').then((res) {
      //kita tampung di ariabel posts data harus di conver jadi object
      // pakai dart:convert yaitu json.decode
      print('ini res.body =' + res.body);
      final posts = jsonDecode(res.body);
      //harus pakai setState utk ubah _posts sbab sllalu dinamis tiap
      //dipanggil dan isi _posts berubah2
      // print('ini adalah posts ' + posts);
      setState(() => _posts = posts);
    });
  }
 http kebawah kita pisah jadi sebuah methoode atau function tersendiri

*/

/*
return listview yg lama :
ListView(
        children: _posts.map((post) {
      //children brupa array ya tapi kita pakai adalah _posts yg
      return ListTile(
          title: Text(post['title']), //title dan subtitle adalah default widget
          //style yg akan di tampilkan di listTile ( namanya lho ya )
          //kalau tulis body: post['body'],body: not defined jadi msti ikuti
          //aturan dari flutternya
          subtitle: Text(post['body']));
      //ingat karena data brupa sting post['body']
      //maka utk tampilkan kewidget maka harus pake Text()
    }).toList()
        //sama berupa list kita map dan tampilkan di ListTile,
        );


*/
