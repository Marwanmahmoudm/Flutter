import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

final _formKey = GlobalKey<FormState>();
class Singupscreen extends StatefulWidget {
  const Singupscreen({super.key});
  @override
  State<Singupscreen> createState() => _SingupscreenState();
}
class _SingupscreenState extends State<Singupscreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwoedController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
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
                    return'please enter new email ';
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
                    return'please enter  stronger password ';
                  }
                },
                decoration: InputDecoration(
                  labelText:'Pass Word' ,
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                color: Colors.grey,
                height: 50.0,
                width: 300.0,
                child: MaterialButton(onPressed: () async {
                  bool result=await   fireBaseregister(emailController.text,passwoedController.text) ;
                  if(result==true)
                  { ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Now You Can Login '
                      )));
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          Loginscreen(),)
                  );}

                  else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'SignUp Field Try Again '
                        )));
                  }




                },
                  child: Text(
                    ' SinUp Now',
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
  Future<bool> fireBaseregister(String email,String password) async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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


