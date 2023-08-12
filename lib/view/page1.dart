import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String email='' ;
  getcachedEmail() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    email=prefs.getString('Email')??'__';
    

    setState(() {});

  }
  void initState(){
    super.initState();
    getcachedEmail();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: Text(
          "page1 \n $email"
        ),

      ),

    );
  }
}
