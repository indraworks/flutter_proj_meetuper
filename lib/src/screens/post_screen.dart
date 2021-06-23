import 'package:flutter/material.dart';
import 'package:learn_meetup/src/scoped_model/post_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'widgets/bottom_navigation.dart';

//manual

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Widget build(BuildContext context) {
    return ScopedModel<PostModel>(model: PostModel(), child: _PostList());
  }
}

//class -PostList utk tampilkan list dari Post ke screen
class _PostList extends StatelessWidget {
//dipasang di constructor  functionnya createPost dari atas header di widgetbuild

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PostModel>(
      builder: (context, _, model) {
        final posts = model.posts;
        return Scaffold(
          appBar: AppBar(centerTitle: true, title: Text('Posts')),
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
      },
    );
  }
}

class _PostButton extends StatelessWidget {
  Widget build(BuildContext context) {
    final postmodel = ScopedModel.of<PostModel>(context, rebuildOnChange: true);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: postmodel.addPost,
      //pangil func createPost ktika button press
      tooltip: 'Add Post',
    );
  }
}

/*catatam:
setelah pakai ScopedModel ini gak dipakai :
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



//
return 

//


*/

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
