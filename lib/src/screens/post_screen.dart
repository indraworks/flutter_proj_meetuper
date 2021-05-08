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
    return _InheritedPost( 
       child: _PostList(  posts: _posts, createPost: _addPost);    
        //poslist dipindah masuk diinherited sbgai passing parameter
        
    );
    
    
  }
}

//inheritedWidget ditaruh diantara statefull dan statelessWidget
class _InheritedPost extends StatelessWidget {
  final Widget child; //kalau di ecrae final di atas maka di construcotr pakai this
  _InheritedPost({@required this.child});

 //build widgetnya
   Widget build(BuildContext context) {
     return child;
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

/*
CATATAN INHERITAGE WIDGET


*/
