import 'package:flutter/material.dart';
import 'package:untitled3/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Loginscreen extends StatefulWidget {
   Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
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

                    child: MaterialButton(onPressed: (){
                      saveprefs() async{
                        SharedPreferences prefs=await SharedPreferences.getInstance();
                        prefs.setString('Email',emailController.text);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home_screen(email:emailController.text ,),)
                      );
                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                          'Succes Data'
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
                  child: MaterialButton(onPressed: (){},
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
}
