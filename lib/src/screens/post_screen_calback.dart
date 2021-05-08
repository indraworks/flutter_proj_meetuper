import 'package:flutter/material.dart';
import 'package:learn_meetup/src/models/post.dart';
import 'package:learn_meetup/src/services/post_api_provider.dart';
import 'widgets/bottom_navigation.dart';
import 'package:faker/faker.dart';
//manual

class PostScreen extends StatefulWidget {
  PostAPiProvider _api = new PostAPiProvider();
//declarsi new APi dari class PostAPiProvider
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  //kit ambuat varable penampung krn yg dikeluarkan adalah array kita
  //dart pake list

  List<Post> _posts = [];

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
    return _PostList(
        //mangil class staeless dan masukan parameter kesana
        posts: _posts,
        createPost: _addPost); //pasing di costructor createPost: _addPost

    //jadi refactor nama header function stateless widgte disini
    //distatefullwidget masukan paramnya biar diprossess,nah krn pemanggil atau
    //header di parent dan olah di anak dan statelesss widget gak ada state sbb state hanya ada di statefull
    //widgte gimana cara olahnya?
    //caranya yaitu kita buat function di _postlist stateles kita passing diconstructornya
    //
    //
    //
  }
}

class _PostList extends StatelessWidget {
  final List<Post> _posts;
  //ini localnya sblumnya <dinmay> digantik typedata jadi <Post>
  final Function createPost; //create post di declare

//dipasang di constructor  functionnya createPost dari atas header di widgetbuild
  _PostList(
      //  @required Function() createPost ganti pakai this.
      {@required List<Post> posts,
      @required this.createPost})
      : _posts = posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Posts')),
      body: ListView.builder(
        itemCount: _posts.length * 2,
        itemBuilder: (BuildContext context, int i) {
          //ingat i ini sama dgn itemCOunt nilai max-nya
          print(i);
          print(_posts.length);
          if (i.isOdd) {
            return Divider(); //jika ganjil maka render diayar widget Divider/garis pemisah

          }
          final index = i ~/ 2; //hasil harus selalu bntuk integer
          return ListTile(
            title: Text(_posts[index].title),
            subtitle: Text(_posts[index].body),
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createPost, //pangil func createPost ktika button press
        tooltip: 'Add Post',
      ),
    );
  }
}

//CTATAN PROGRAM FLOW

/* jadi mr.pifip ajarkan cara kalau kita buat calback function sbuah function yg 
 dipasing di construcktor jadi di declare dulu di parent widgit
 kita tahu di statefull wdiget hanya ada state prubahan state disini 
 nama_parent_class statefullwiget  {
   declare create state nana statenya

 class namastatenya exted dari state<nama_parent_classnya >{
   berisi init state dan declare variable_global
  func initstate () {}

  //berisi fucntion contoh:
   fetch_post() {};

   addPost() {
     //instasiate dari Class Post (model)
    final newPost = Post(title: title, body: body, id: id); //konstrutor clas Post di model
    //jgn lupa update statenya utk _posts
    setState(() {
      return _posts.add(newPost);
    });

   }
     //diimplementasikan kewidget /scren utk addPost tsb diatas yg baru dibuat
      Widget build(BuildContext context) {
            return _PostList( //ini statelessWidget yg dreturn
        
             posts: _posts,
             createPost: _addPost); 
        //pasing di costructor createPost: _addPost
        //mangil class staeless dan masukan parameter kesana
        //createPost di declare di awal sbgai variable funct global
        //stlahnya pakai this.createPost ktika pasing di constructor stateless dibawah 
       }

 }


 }

 //nah ini stateless widget yg widget build context kan pasing 
 
class _PostList extends StatelessWidget { 
   final List<Post> _posts;
         //ini localnya sblumnya <dinmayc> digantik typedata jadi <Post>
  final Function createPost; 
        //create post di declare sbgai variable global brupa Function

     _PostList(
      //  @required Function() createPost ganti pakai this.
      {@required List<Post> posts,  @required this.createPost})
      : _posts = posts;

   Widget build(BuildContext context) { 

     
      //nah di onpressnya kita panggil ini createPost func tadi 
      //tidak pakai () krna utk referencenya pada widget FloatingButton
      onPressed: createPost,
      

  }
??OK ini salah satu cara yg dibahas Mr.filip 



  */

//END PENJELASAN PROGRAM FLOW

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
