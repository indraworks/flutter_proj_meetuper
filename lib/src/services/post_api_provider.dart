/*
pindahkan fetchPosts  dari post_screen.dart agar lebih rapi dan readible 
module api biar disni semua ,jgn lua import juga package nya darisitu juga
dan kit abuat sync await jgn lupa pakai future
*/
import 'package:http/http.dart' as http; //kita import
//sblumnya istall atau tulis file yaml
////sumber http: ===========>>>>https://pub.dev/packages/http
//kita taruh di yaml file : http: ^0.12.0+2  otomatis ntr menginstall dengan sendirinya
import 'dart:convert';
import 'package:learn_meetup/src/models/post.dart'; //utk convert object json jadi string

class PostAPiProvider {
 
  Future<List<Post>> fetchPost() async {
    final res = await http
        .get('https://jsonplaceholder.typicode.com/posts')
       
      final List<dynamic> parsePosts = jsonDecode(res.body);
      final posts = parsePosts.map((parsePost) {
        return Post.fromJSON(parsePost);
      }).toList();
   
  }
}

/* lama:/old

 void _fetchPost() async {
    http.get('https://jsonplaceholder.typicode.com/posts').then((res) {
      //final posts = jsonDecode(res.body);
      //ktika then res data uda kluar ,dimabil
      //dlm bntuk 1 page res.body,nah skrg kita masukan hasil json kdlm variable list
      final List<dynamic> parsePosts =
          jsonDecode(res.body); //parse string balikinke obj
      final posts = parsePosts.map((parsePost) {
        return Post.fromJSON(parsePost); //Post import dari class Post;
      }).toList(); //pake toList isinya kan 2 dan iterable
      // setState(() => _posts = posts); // kita delete juga nnti buat setStatenya di post_screen
      // //yg _post dimasukan ke _PostList(posts:_posts)
    });
  }




*/