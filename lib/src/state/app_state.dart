import 'package:flutter/material.dart';

class AppStore extends StatefulWidget {
  //nanti AppStore di import di main.dart
//dsana dia wraping meetupApp()
  final Widget child;
  AppStore({@required this.child}); //constructor
  _AppStoreState createState() => _AppStoreState();
  static _AppStoreState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedAppState>())
        .data;
    //jadi gini data yg ada di _AppStoreStte ini bisa diambil oleh widget dimana saja
    //lewat variable static ini
    //dgn cara di buat di class state  AppStore yaitu _AppStoreStte dan di pasing di constuctor
    //_inheritedAPpStore bahwa data yg mau diambil ini adalah bertype-data: _AppStoreState
    //bgitulah pnjelasanya!
  }
}

//class State dari AppStore
class _AppStoreState extends State<AppStore> {
  //kita buat variable data  kita masukan ke constructor utk pasing
  //pasing di inheritedWidget _InheritedAppSate
  String testingData1 = "hello saya test1";
  String testingData2 = "hello saya test2";
  String testingData3 = "hello saya test3";

  Widget build(BuildContext context) {
    //returnnya class inheritedAppState
    return _InheritedAppState(
        child: widget.child,
        // variabel testingData1,2,3 diatas cukup diwakili dgn this
        data: this //this mewakili testugn data smua varibal diatas di pasing
        //di data yg merupakan dari type_data dari _AppStoreState di class _InheritateAppState
        //shingga nantinya bisa diakses krn diinjek di constructor _InheritedAppState
        );
  }
}

class _InheritedAppState extends InheritedWidget {
  final _AppStoreState data;
  _InheritedAppState({@required Widget child, @required this.data})
      : super(child: child);
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

/*
tujuan dari global app state adalah agar data dari atas bisa di akses oleh 
sluruh widget2 yg tersebar dlsuruh applikasi 
nah child yg akan passing diatas adalah dari meetuperApp jadi meetuper App di wrapung masuk disini 
di AppStore -->dimasukan di AppstoreState -->di InhheritedWidget nah darisni 
mis ada  data2 ygdideclare di inheritedAppState widget maka data2 trsbut bisa 
//dikases dgn mudah oleh sluruh widget yg 
ada di manapun dilsuruh meetupApp()

Iya karena ini bungkus meetupApp.dart page yg beda dan kita tahu pembungkusnya adalah 
widget AppStore maka kita taruhnya static variablenya ada di AppStore
nah bukan di inheritedAppState ya! tidak sama dgn yg sblunnya ditaruh di dibawah constructor in 
inheritedSttenya utk static variable tempat dimana wigdet dibawahnya akses data/funct disini 
jadi sklai lagi inilah yg disebut global state dari sini bisa di akses data dari 
appStoreStatenya dan dibagi ke bawah wiget2 dimana saja !
jadi skali lagi static variable utk akses context ada di app store karena sifatnya yg global 
bukan di _AppStoreState,_InheritedAppStore yg sifatnya lokal 
dan sklaian karena pmbungkus dari meeupApp ada disini dan meetupApp masuk sbgai child disini!


*/

/*
Kelemahan global state adalah yaitu jika inheritedwidget update maka reprsent 
update di anak widget tidak akan bisa memang kita tahu  state inheritedwidget + full widget adalah 
opsi yg baik utk bisa di baca dari anak2 widget 
tapi gak bisa update utk itu kita gunakan yg namanya package scoped_model
dgn scoped_model ini naka gabung statefull widget + inherited_widget jika ada update maka 
akan update widget2 yg dibawahnya yg mana akses contextnya !


*/
