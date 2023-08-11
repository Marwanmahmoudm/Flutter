
import 'package:flutter/material.dart';
import 'package:untitled3/page1.dart';
import 'package:untitled3/page2.dart';
import 'package:untitled3/page3.dart';

class Home_screen extends StatefulWidget {
   String email;
   Home_screen({super.key,required this.email});
  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  int selectedindex= 0;
  List<Widget>pages =[
    Page1(),
    Page2(),
    Page3(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),

      ) ,
      body: pages[selectedindex],

    bottomNavigationBar: BottomNavigationBar(

      backgroundColor: Colors.red,
    selectedItemColor: Colors.cyan,
    currentIndex: selectedindex,
    onTap: (value){
      selectedindex=value;
        setState(() {});
    },
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'page1',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.add_a_photo_rounded),
    label: 'page2',

    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.laptop),
    label: 'page3',
    ),
    ],



    )

    );
  }
}
