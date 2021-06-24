import 'dart:math';

import 'package:flutter/material.dart';

class MeetupHomeScreen extends StatefulWidget {
  _MeetupHomeScreenState createState() => _MeetupHomeScreenState();
}

class _MeetupHomeScreenState extends State<MeetupHomeScreen> {
  List<CustomText> customTextList = [
    // CustomText(key: UniqueKey(), name: '1'),
    // CustomText(key: UniqueKey(), name: '2'),
    // CustomText(key: UniqueKey(), name: '3')
    CustomText(key: ValueKey('1'), name: '1'),
    CustomText(key: ValueKey('2'), name: '2'),
    CustomText(key: ValueKey('3'), name: '3')
  ];
  //akses constructor dng kasih label di instasiate constumeText

  _shuffleList() {
    setState(() {
      customTextList.shuffle();
      //suffle itu method dari dart yg mengurutkan blangan /list secara random
      customTextList.forEach((e) => print(e.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Home')),
        body: Column(children: customTextList),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:
              _shuffleList, //ktika dilcik maka warna palette di colum acak urutanya
        ));
  }

  static uniqeKey() {}
}

class CustomText extends StatefulWidget {
  final String name;
  CustomText({Key key, this.name})
      : super(key: key); //diforward keynya ke super consturcotr
  // buat constructor supaya bisa diakses dan isntante dari atas
  @override
  CustomTextState createState() => CustomTextState();
}

class CustomTextState extends State<CustomText> {
  List colors = [
    Colors.blue,
    Colors.red,
    Colors.brown,
    Colors.grey,
    Colors.orange,
    Colors.deepPurple
  ];
  Random random = Random(); //instasiate dari library class Random
  Color color;

  //utk buat state atau nilai baru wajib dibuat init state distipa widgetStae
  initState() {
    super.initState();
    //state variable yg berubah di delacare disini
    color = colors[random.nextInt((colors.length))];
    //nextInt metode generato positif random dari o0 sd max nah maxnya adalah
    //nilai jumlah array yg ada dari list
  }

  Widget build(BuildContext context) {
    //Container aada high,width,color
    return Container(
      child: Text(
          'Custom text of $color'), //dart jangan pake {}langsung aja $color beda sama js!
      color: color,
      height: 150.0, //heigh pallete
    );
  }
}

/*Catatatn:
class Color
dart:ui
An immutable 32 bit color value in ARGB format.


class Colors
package:flutter/src/material/colors.dart

[Color] and [ColorSwatch] constants which represent Material design's color palette.

sbnarnya biasa langsung dari container 
color:Colors.blue tetapi pnulis mau buat nilai colornya dirandom 
maka pilihan utk tampiljan digunkana type Color utk var
color:Colors[]


*/

/*
List <CustomText> customText = [customText(),customText(),]
langkah kerja mmbuat palete berupa list yg  mana kita buat dari class CustomPalete
berisi warna ,random( angkar2 warna,heightnya)
yg nantinya  didaftarkan di meetupHoemScreen 
sbgai type dari class CustomText
jadi buat class CustomText statefullnya dan juga CustomTextStaenya dan buat widgetnya 
karakteristik/Property  dari si class Customtext terbut
nah di homeScreen daftarkan dia sbgai 3 buah warna 
nah ini customText() ini adalah object isntansiate yg dicetak oleh class tsb 
didaftarkan sbgai type class Customtext berupa list jadi delcarenya :
List <CustomText> customText = [customText(),customText(),customTExt)
nah stlah didaftakan akan dimunculkan di scafold di meethomScreen
nah buat child:Column ( krn bentuknya brupa axis y kebawah!)



*/

/* TENTANG KEY , UniqueKey,ValueKey,Object Key
Notthing hapen why??knapa warna gak berubah waktu disufle ?

ya karena kita gak buat constructor nya argument plwat 
atay pmbuat instansiate di class CustomText!
dan juga mesti kita tampilkan nilai dari hex color tsb sprti
itu supaya bisa nilai tsb kita tahu itu dishufle!
Dan JUGA INGAT INI Adalah StateFull Widget!
maka perlu di perlukan Key utk karena stiap element dari statefull widget yg di referensikan ke widgetnya( wdget buildnya)
harus tahu harus ada referensi Key nya kalau distate less gak perlu 
jadi waktu di pindah dirurut di shulfe maka key wajib jadi referens dari element utk stiap pasangan widgtenya masing2
jadi kit awajib pasang Key di constuctornya di customText fullWiget ini !

diats sana pertama kita di constructor kasih asignment UniqueKey() yg mana nilainya random 
nah kita juga bisa assign nilai Key dari metode ValueKey yg nilainay mesti uniq satu sama lain( dari permasing2 List di customeText)
ValueKey('1') ValueKey('2') ValueKey('3') wajib uniq satu sama lain dari element2 di dalam List
nah ObjectKey itu apa sama speti yg sblumnya tapi dia mau bandingkan Object elemet dalam sbuat Object Literal 

//contoh Object Literal Person berisi eleemnt propertis variable name,password,





*/
