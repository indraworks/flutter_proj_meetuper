import 'package:flutter/material.dart';
// import 'package:learn_meetup/src/screens/counter_home_screen.dart';
import 'package:learn_meetup/src/screens/meetup_detail_screen.dart';
import 'package:learn_meetup/src/screens/meetup_home_screen.dart';
import 'package:learn_meetup/src/screens/post_screen.dart';
import 'package:learn_meetup/src/state/app_state.dart';

void main() {
  // runApp(AppStore(child: MeetuperApp())); //meetuper diwraping sbgai memalui
  runApp(MeetuperApp()); //meetuper diwraping sbgai memalui
  //passing pada argument child di AppStore.
}

class MeetuperApp extends StatelessWidget {
  final String appTitle = "Meetuper App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        // home: CounterHomeScreen(title: appTitle), //temporary utk atihan jsonplaceholder
        // home: PostScreen(), //temporary home lari ke PostScreen() page
        home: MeetupHomeScreen(),
        // routes: {MeetupDetailScreen.route: (context) => MeetupDetailScreen()});
        routes: {'/meetupDetail': (context) => MeetupDetailScreen()});
  }
}
/*
Gimana cara buat route pastikan bahwa kit asudah buat 
class anak widget difile disini di /screens dgn contoh meetup_detail_screen.dart
nah stalh nya di main.dart buat routenya 
/meetupDetail adalah nama route nanti componentnya mesti dipanggil 
utk route bsa kita improve dengan pakai variabel


*/

/*
utk onPressed: _pressed ----disini kita gak manggil functionya
tapi kita arahkan referencenya
beda dgn  yg on pressed:() {
  _presserd();
} //---> ini jalangkan langsung anomious  Func panggil function didlam diriya 
karena satu baris bsa d singkat:
()=>
*/

/*
dalam dart smua yg ada adalah widget
dan kalau kita buat widget kita harus return utk dirender
pertama kita buat buildContext utk buat widgetCenter
adalah widget yg tangani agar widget lain posisinya ditengah 
skrgn kita buat widget yg return material app yg mana ini adalah moyang
dari smua widget



*/

/*contoh return widget center
 return Center(
      //kaau ki angebuilt pasti return
      //yh ini return sbagai apa??Center yg text ditengah
      child: Text(
        'Welcome Meetuper',
        textDirection: TextDirection.ltr,
      ),
    ); //ltr lef to right

*/

/*
ingat stateless widget adalah yg tak ada state sbb component 
tidak ada punya nilai property yg berubah2


*/
/*
layout column:main axis akan dari atas kebawah aturanya ,crossAxis dari kiri kanan
layout row:main axis dari kiri ke kanan,dan cross axis dari atas-bawah
*/
