import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Model/TodoModel.dart';
import  'package:untitled3/Service/TodosService.dart';


class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}
class _Page2State extends State<Page2> {
  List<Todos>todos=[];
   bool isLoading=true;
  
  getmytodos()async{
    todos=await TodosService(). gettodo();
    setState(() {
      isLoading=false;

    });

  }
  @override
  void initState(){
    super.initState();
    getmytodos();
  }
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
      child: CircularProgressIndicator(),
    )
        :ListView.builder(itemCount:todos.length,
        itemBuilder:(BuildContext context,int index){
          return ListTile(
            title: Text(todos[index].title??"__"),
            subtitle: Text((todos[index].id).toString() ),
            trailing:  Text((todos[index].userId).toString() ),
            leading:  Text((todos[index].completed).toString() ),


          );
        }


    );
        
  }
}
