import 'package:flutter/material.dart';

import 'widgets/bottom_navigation.dart';

//kita refactoring isi dari code,nama class sama
//sesuai dgn nama file dartnya

//manual

class CounterHomeScreen extends StatefulWidget {
  final String _title;
  //constructornya
  //
  CounterHomeScreen({String title}) : _title = title;

  // CounterHomeScreenState createState() => CounterHomeScreenState();
  //  yg diatas sama syntax commandnya dgn func () { return statement}
  @override
  _CounterHomeScreenState createState() {
    return _CounterHomeScreenState();
  }
}

class _CounterHomeScreenState extends State<CounterHomeScreen> {
  int _counter = 0;
  _increment() {
    //set state ada dlm sbuah sunction yg dipanggil oleh widget
    //sgai referencenya dlm hal ini adala floatingbutton
    setState(() {
      _counter++; //setState jlankan function ubah counter =counter+1
      //dari sini setState  re-build widget buildCOntext dan prbarui rendernya
      //tiap2 counter brubah atau state brubah maka rebuild widget!
    });
  }

  Widget build(BuildContext context) {
    print('caling build widget');
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Meetuper')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to our ${widget._title},lets increment number!', //karna _title ada diluar class
              //dluar class dan berada di statefullwidget
              //kita pake widget utk ambil variable ttitlenya,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 15.0),
            ),
            Text('Clik Counter : $_counter ',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 30.0)),
            RaisedButton(
                child: Text('Goto Details'),
                onPressed: () => Navigator.pushNamed(context, '/meetupDetail')),
          ],
        ),
      ),
<<<<<<< HEAD
      bottomNavigationBar: BottomNavigation(),
=======
      bottomNavigationBar: _BottomNavigation(),
>>>>>>> 9498d0131b79c8ed2083cd40f9ca90f4c89bccbb
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increment,
      ),
    );
  }
}

<<<<<<< HEAD
/*o apps for pc linux
=======
class _BottomNavigation extends StatelessWidget {
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('Profile')),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Settings')),
      ],
    );
  }
}

/*
>>>>>>> 9498d0131b79c8ed2083cd40f9ca90f4c89bccbb
bab9 - mmbuat navigation bottom bar
navigtionbar dibuat didalam wiget scaffold penempatan setelah body ,dan ada 3 items 
masing2 ,dan kita taruh defaultnya pada currentIndex:0 ; paling kiri
nah jadi gini kit abisa buat class widget ini denga panggil namanya 
nah nnatinya akan ada state tapi kita buat dulu dari staeless 
nah kit aakan panggil widget dari atas ,kita buat class terpisaah dan kita panggil dari widgetfull
nama widget navigtionbar utk yg 3 item ini kita buat di class ini terpisah sgn cara widgetbuil context

<<<<<<< HEAD
-utk mmbuat function on TAp maka harus ada inputan int yg passing utk iut
onTap:(int index) {} //disini ktka nanti diklik maka akan terlihat nilai index
ktika item bottom navigation di pilih dan diklik/onTap

syarat2 ubah statefless jadi stastefull

=======
>>>>>>> 9498d0131b79c8ed2083cd40f9ca90f4c89bccbb

*/

/*
tentang perubahan state nah jadi kalau mau ubah itu 
harus setting setState dan dia dipassing dalam sbuah function 
setState(){

}
nah setState ini akan menjalankan widget yaitu mmbuat context widget lagi 
atau build dan merender perubahan tadi ,jadi stiap ada perubahan setState
maka dia akan buildWidget



*/

//ini dari stf sniper ktik stf artinya statfull widget automatis
//akan trbuat tiggal ganti nama function/classnya
// class CounterHomeScreen extends StatefulWidget {
//   @override
//   _CounterHomeScreenState createState() => _CounterHomeScreenState();
// }

// class _CounterHomeScreenState extends State<CounterHomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }

//old stateless widget
// class MeetuperApp extends StatelessWidget {
//   final String appTitle = " Meetuper App";
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         //theme.home.body
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: CounterHomeScreen(
//           title: appTitle,
//         ));
//   }
// }

// class CounterHomeScreen extends StatelessWidget {
//   final String _title; //variable intansiate
//   int _counter = 0;
//   //constructornya
//   CounterHomeScreen({String title}) : _title = title;

//   //function
//   _increment() {
//     print('i got clicked by touch!');
//     _counter++;
//     return _counter;
//   }

//   Widget build(BuildContext context) {
//     //returnnya scafold
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Welcome in $_title lets increment number',
//             textDirection: TextDirection.ltr,
//             style: TextStyle(fontSize: 15.0),
//           ),
//           Text(
//             'Click Counter : $_counter',
//             textDirection: TextDirection.ltr,
//             style: TextStyle(fontSize: 30.0),
//           )
//         ],
//       )),
//       floatingActionButton: FloatingActionButton(
//         //floating dalam scafold
//         child: Icon(Icons.add),
//         onPressed: _increment,
//       ),
//       appBar: AppBar(
//         centerTitle: true, //buat nengahin text
//         title: Text(_title),
//       ),
//     );
//   }
// }

/*
KITA BUAT STATEFULL WIDGET dari stateless sebab ada variable yg akanberubah 
nilai nilainya maka adari itu kita refactoring codenya
penjelasan : 


*/

/*
kita barusan pindah class counterhome screen dari menutama 
kalau mau lihat klikkanann uk import package yg tidak ada 
pilih import




*/
