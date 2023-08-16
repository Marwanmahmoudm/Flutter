import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/view/singup_screen.dart';


class Loginscreen extends StatefulWidget {
   Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwoedController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
          body:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(width: 200.0,
                     height: 200.0,
                     child: Image.asset('assets/supermarket.jpg')),
                SizedBox(height: 30.0,),
                TextFormField(

                  autovalidateMode:AutovalidateMode.always ,
                  controller:emailController,
                  validator: (value){
                    if (value == null || value.contains('@')==false){
                      return'please enter email again';
                    }

                  },
                  decoration: InputDecoration(
                    labelText:'Email' ,
                  ),
                ),
                SizedBox(height: 30.0,),
                TextFormField(
                  controller: passwoedController,
                  autovalidateMode:AutovalidateMode.always ,
                  validator: (value){
                  if (value == null || value.length<8){
                    return'please enter password again';
                  }

                },
                  decoration: InputDecoration(
                    labelText:'Pass Word' ,
                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    height: 50.0,
                    width: 300.0,

                    child: MaterialButton(onPressed: ()async{
                     bool result=await fireBaselogin(emailController.text,passwoedController.text);
                     if(result==true)
                       { SharedPreferences prefs = await SharedPreferences
                            .getInstance();
                        prefs.setString('Email', emailController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                Home_screen(email: emailController.text,),)
                        );}

                        else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Login Field'
                              )));
                        }

                    },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          height: 2.0,
                        ),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    'forget password? tap me',
                  ),
                ),
                SizedBox(height: 30.0,),
                Container(
                  color: Colors.grey,
                  height: 50.0,
                  width: 300.0,
                  child: MaterialButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                        Singupscreen(),)
                    );

                  },
                    child: Text(
                      'No Account? sin up',
                      style: TextStyle(

                        height: 2.0,
                      ),

                    ),
                  ),
                ),




              ],
            ),
          ),

      ),
    );
  }
  Future<bool> fireBaselogin(String email,String password) async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:email ,
          password:password
      );
    if(userCredential.user !=null){
      return true;
    }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}
