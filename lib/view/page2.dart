import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/cubit/todo_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/TodoModel.dart';
import '../Model/TodoModel.dart';
import '../Model/TodoModel.dart';
import '../Model/TodoModel.dart';


class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}
class _Page2State extends State<Page2> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        builder: (context, state) {
          if(state is TodosLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is TodosError){
            return Center(
              child: Text(
                'Error'
              ),
            );
          }
          return ListView.builder(
              itemCount:context.watch<TodoCubit>().todos.length,
              itemBuilder:(BuildContext context,int index){
                return ListTile(
                  title: Text(context.watch<TodoCubit>().todos[index].title??"__"),
                  subtitle: Text((context.watch<TodoCubit>().todos[index].id).toString() ),
                  trailing:  Text((context.watch<TodoCubit>().todos[index].userId).toString() ),
                  leading:  Text((context.watch<TodoCubit>().todos[index].completed).toString() ),
                );
              }
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
