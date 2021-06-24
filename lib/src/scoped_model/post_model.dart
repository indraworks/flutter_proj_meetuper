// import 'package:flutter/material.dart';
import 'package:learn_meetup/src/models/post.dart';
// import 'package:learn_meetup/src/scoped_model/post_model.dart';
import 'package:faker/faker.dart';
import 'package:learn_meetup/src/services/post_api_provider.dart';
import 'package:scoped_model/scoped_model.dart'; //kita install lib 1.0.1

class PostModel extends Model {
  // extend Model adalah nama class dari librari scoped_model
   List<Post> posts = []; //var local posts yg berypte Post dari model.dart 
   // post =[] kita inisial dgn empty array 
   //_post jgn pake under score dianggap private gak bisa diaksesnnti dari laur
  final testingState = 'Testing State';
  final PostAPiProvider _api = new PostAPiProvider();
//declarsi new APi dari class PostAPiProvider
  PostModel() {
    _fetchPost(); //cosntructor hny abody bersi func fetchpost saja 
    //tak ada isntanciate/pasing argument
  }//constructor nya hnya body
 
    void _fetchPost() async {
      List<Post> posts = await _api.fetchAPIPost();
      this.posts = posts; 
      //var local _post diisi dari post yg sudah berisi hasil fetchApi json placeholder
      notifyListeners(); //func dari libary scoped_model yg kasih tau widget dbawahnya jika yupdate
  
 }
  //addPot pakai global jang _addPost gak bisa diakses kculali pakai constrcutor
  addPost() {
    final id = faker.randomGenerator.integer(999);
    final title = faker.food.dish();
    final body = faker.food.cuisine();
    //instasiate dari Class Post (model)
    final newPost = Post(title: title, body: body, id: id);

    //ini func jadi gak ada setState
    //addatau buat posts baru
    posts.add(newPost);
    notifyListeners(); //function ini buildin dari scopemodel guna yg otomatis
    //kasih tahu iwdget jika ada funct /state yg brubak di class PostModel/scope_model
  }
}


/*
msalah ambil dari jsonplaceholder ya benar kalau ambil nila posts
yg sudah ada ambil dari jsonplaceholder nah kalau mata tambah addPost kita
pake faker masukin datanya gak pake atau blum dari imputan user!( req.body)


*/