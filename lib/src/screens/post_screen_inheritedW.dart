import 'package:flutter/material.dart';
import 'package:learn_meetup/src/models/post.dart';
import 'package:learn_meetup/src/services/post_api_provider.dart';
import 'package:learn_meetup/src/state/app_state.dart';
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
    List<Post> posts = await widget._api.fetchAPIPost();
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
        posts: _posts,
        //variable local _posts dari func _fetchPost dan _addPost masuk ke var posts di constructor _InheritePost
        createPost:
            _addPost, // var createdPost  mrupakan pemangil adress func _addPost
        child: _PostList() //class inigak pake cosntrutor udah dihapus
        //krn maggil variable posts langsun ke inheritedwidget ~_IhheritedPost

        );
  }
}

//inheritedWidget maka extened namanya ganti dari statelesswidget jadi inheritedwidget
class _InheritedPost extends InheritedWidget {
  final Widget child;
  final List<Post> posts;
  final Function createPost;
  //kalau di ecrae final di atas maka di construcotr pakai this
  _InheritedPost(
      {@required this.child, @required this.posts, @required this.createPost})
      : super(child: child);
  //dibawah constructor declare bahwa dia inherited widget
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //delete widget di class ini ,sbb  inherited widget gak butuh build wildget
  //buat static variable context pengakses context dari smua variable di _InheritedPost:
  static _InheritedPost of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedPost>();
  }
}

//class -PostList utk tampilkan list dari Post ke screen
class _PostList extends StatelessWidget {
//dipasang di constructor  functionnya createPost dari atas header di widgetbuild

  @override
  Widget build(BuildContext context) {
    //declare disini mau akses posts di inheritedWidget / _InheritedPost
    //sbb declare sbgai vaiable testingData AppStore.of(context) ..tinggal sorot mana yg ,au titampilka variable datanya
    final testingData = AppStore.of(context).testingData1;
    final posts = _InheritedPost.of(context).posts;
    return Scaffold(
      //saya mau akses data yg dideclare dari AppStoreState
      //saya mau tampilkan di AppBar

      appBar: AppBar(centerTitle: true, title: Text(testingData)),
      // appBar: AppBar(centerTitle: true, title: Text('Posts')),
      body: ListView.builder(
        itemCount: posts.length * 2,
        itemBuilder: (BuildContext context, int i) {
          //ingat i ini sama dgn itemCOunt nilai max-nya
          print(i);
          print(posts.length);
          if (i.isOdd) {
            return Divider(); //jika ganjil maka render diayar widget Divider/garis pemisah

          }
          final index = i ~/ 2; //hasil harus selalu bntuk integer
          return ListTile(
            title: Text(posts[index].title),
            subtitle: Text(posts[index].body),
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton:
          _PostButton(), //PotButton dibuat widget baru (stateless)
    );
  }
}

class _PostButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _InheritedPost.of(context).createPost,
      //pangil func createPost ktika button press
      tooltip: 'Add Post',
    );
  }
}

/*
yg lama saya taruh dgn nama file:post_screen_pre_inherited.dart
CATATAN:
1
https://stackoverflow.com/questions/59304242/inheritfromwidgetofexacttype-is-deprecated-use-dependoninheritedwidgetofexacttyp
InheritFromWidgetOfExactType method is deprecated , Use dependOnInheritedWidgetOfExactType method instead.
Example of a replacement:

Before : with InheritFromWidgetOfExactType

static Name of(BuildContext context) {
  return context.inheritFromWidgetOfExactType(Name);  //here
}
Now with dependOnInheritedWidgetOfExactType (Recommanded)

static Name of(BuildContext context) {
  return context.dependOnInheritedWidgetOfExactType<Name>();  //here
}


*/
