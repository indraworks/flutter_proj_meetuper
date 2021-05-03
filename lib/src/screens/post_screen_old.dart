import 'package:flutter/material.dart';
import 'package:learn_meetup/src/models/post.dart';
import 'package:learn_meetup/src/services/post_api_provider.dart';
import 'widgets/bottom_navigation.dart';
import 'package:faker/faker.dart'; //panggl faker utk nambah data dari faker

//kita refactoring isi dari code,nama class sama
//sesuai dgn nama file dartnya

//manual

class PostScreen extends StatefulWidget {
  PostAPiProvider _api = new PostAPiProvider(); //kita gunakan functionya
  //kalau statement ditaruh diatas diclass widget maka di anak kelas harus
  //paggil widget. ( wajib! nama instance + nama func) sbb: widget._api.fetchPost()

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

  List<Post> _posts = [];
  //kita ganti  asal mula //List<dynamic> _posts = []; //type datanya adalah dynamic
  //dimana <Post> adalah typedatanya dari class Post

//pengenalan listView :
//https://medium.com/nusanet/flutter-listview-7de1759b4fb1
//jadi dibuat initState yg didalamnya ada super.initState
////krn module ini diambil dari parent  nah baru dibawahnya ada
// functon ambil data diserver yaitu fetchPost

  //post_api_provider disini

  // kalau sekarang bisa langsung tanpa new

  void initState() {
    super.initState(); //panggil initstate
    _fetchPost(); //buat judul func utk panggil
  }

  // note :fecthpost dipindah ke class service_api_provider
  _fetchPost() async {
    List<Post> posts = await widget._api.fetchPost();
    setState(() => _posts = posts);
  }

  _addPost() {
    //random sd 8nilai max 999,kita pilih food data dari faker tuk
    //title dan body
    final id = faker.randomGenerator.integer(999);
    final title = faker.food.dish();
    final body = faker.food.cuisine();
    //instasiate dari Class Post (model)
    final newPost = Post(title: title, body: body, id: id);
    //jgn lupa update statenya utk _posts
    setState(() {
      return _posts.add(newPost);
    });
    //stlah ini _addPost taruh diwidget utk button tambah
  }

  Widget build(BuildContext context) {
    print('aim calling build');
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Posts')),
      body: _PostList(posts: _posts), //artinya hasil variable local _post
      //dimasukan kedalam param posts pada kontstructor di class _Postlist dibawah
      //agar nilai bisa dimap ditampilkan lewat ListView amazing :D
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addPost, //tanpa tanda () krn method
        tooltip: 'Add Post',
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
  final List<Post>
      _posts; //ini localnya sblumnya <dinmay> digantik typedata jadi <Post>

  //buat posts constructor
  //yg dalam kurung diknstructor adalah param dari luar
  //({List<dynamic> posts}) nah stelah tanda : adalah _posts =  posts
  //artinay posts param dari luar di berikan pasing ke variable local _posts
  _PostList({@required List<Post> posts}) : _posts = posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length *
          2, //itemCount ini *2  sama kayak itemBuilder properties dari listView.Builder
      itemBuilder: (BuildContext context, int i) {
        //ingat i ini sama dgn itemCOunt nilai max-nya
        print(i);
        print(_posts.length);
        if (i.isOdd) {
          return Divider(); //jika ganjil maka render diayar widget Divider/garis pemisah

        }
        final index = i ~/ 2; //hasil harus selalu bntuk integer
        return ListTile(
          //listTitle builtun rendering <widget>list dlm txt makanya
          //diubah dulu lwat Text!
          // title: Text(_posts[index]['title']), yg lama  skrg bisa pakai dot krn object
          // subtitle: Text(_posts[index]['body']),
          title: Text(_posts[index].title),
          subtitle: Text(_posts[index].body),
        );
      },
    );
  }
}

/* //// PENJELASAN PROGRAM
http.get('https://jsonplaceholder.typicode.com/posts').then((res) {
      //final posts = jsonDecode(res.body);
      //ktika then res data uda kluar ,dimabil
      //dlm bntuk 1 page res.body,nah skrg kita masukan hasil json kdlm variable list
      final List<dynamic> parsePosts =
          jsonDecode(res.body); //parse string balikinke obj
      final posts = parsePosts.map((parsePost) {
        return Post.fromJSON(parsePost); //Post import dari class Post;
      }).toList(); //pake toList isinya kan 2 dan iterable

jadi gini:stlah dapat ttp.get maka didecode dulu dlm bntuk object 
dimasukan list  final List<dynamic> parsePosts =
          jsonDecode(res.body)
nah kmudian dimaping ,nah utk munculkan kita pake Post krn udah parse masing2 dari parseJosn ke 
bntuk object lewat Post class 
 final posts = parsePosts.map((parsePost) {
        return Post.fromJSON(parsePost) //ingat Postnya dari class di /model/Post.dart


*/

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

/* ///catatatn lama ////
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


*/
