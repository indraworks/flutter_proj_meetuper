

import 'package:flutter/material.dart';

class MeetuperApp extends StatelessWidget {
  final String appTitle = " Meetuper App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //theme.home.body
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CounterHomeScreen(
          title: appTitle,
        ));
  }
}

class CounterHomeScreen extends StatelessWidget {
  final String _title; //variable intansiate
  //constructornya
  CounterHomeScreen({String title}) : _title = title;

  //function
  _increment() {
    print('i got clicked by touch!');
  }

  Widget build(BuildContext context) {
    //returnnya scafold
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome in $_title lets increment number',
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 15.0),
          ),
          Text(
            'Click Counter : 0',
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 30.0),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increment,
      ),
      appBar: AppBar(
        centerTitle: true, //buat nengahin text
        title: Text(_title),
      ),
    );
  }
}