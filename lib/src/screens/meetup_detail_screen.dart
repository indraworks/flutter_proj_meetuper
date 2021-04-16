import 'package:flutter/material.dart';

class MeetupDetailScreen extends StatelessWidget {
  static final String route = '/meetupDetail';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meetup Detail"),
      ),
      body: Center(
        child: Text('Iam Meetup Detail Screen'),
      ),
    );
  }
}

/*
Gimana cara buat route pastikan bahwa kit asudah buat 
class anak widget difile disini di /screens dgn contoh meetup_detail_screen.dart
nah stalh nya di main.dart buat routenya 
nama classnya tadi sbgai rujukan 
nah di chilc class buat widget 
RaisedButton( 
  child:Text('GotoDetailed'),
  onPressed:() {
    Navigator.pushedName(context,NamaRoute-nya)
  }
)


*/
