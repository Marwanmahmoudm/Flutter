import 'package:dio/dio.dart';
import 'package:untitled3/Model/TodoModel.dart';

class TodosService extends Todos{
  String url="https://jsonplaceholder.typicode.com/todos";
  List<Todos>todolist=[];
  gettodo()async{
    final respone =await Dio().get(url);
    var data =respone.data;
    data.forEach((elment){
      Todos todo =Todos.fromJson(elment);
      todolist.add(todo);
    }
    );
    return todolist;
  }


}