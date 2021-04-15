import 'package:flutter/material.dart';

//kita refactoring isi dari code,nama class sama
//sesuai dgn nama file dartnya

//manual

class MeetuperApp extends StatelessWidget {
  final String appTitle = "Meetuper App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CounterHomeScreen(title: appTitle));
  }
}

class CounterHomeScreen extends StatefulWidget {
  final String _title;
  //constructornya
  //
  CounterHomeScreen({String title}) : _title = title;

  // CounterHomeScreenState createState() => CounterHomeScreenState();
  //  yg diatas sama syntax commandnya dgn func () { return statement}
  @override
  CounterHomeScreenState createState() {
    return CounterHomeScreenState();
  }
}

class CounterHomeScreenState extends State<CounterHomeScreen> {
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
                style: TextStyle(fontSize: 30.0))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increment,
      ),
    );
  }
}

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
