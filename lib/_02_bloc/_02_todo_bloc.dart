import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//MODEL
class Todo{
  String desc;
  DateTime added_on;
  Todo({required this.desc,required this.added_on});
  @override
  String toString() {
    // TODO: implement toString
    return "[${desc}:${added_on}]";
  }
}

//Bloc
class AddEvent{
  String desc;
  DateTime added_on;
  AddEvent({required this.desc,required this.added_on});
}
class TodoBloc extends Bloc<AddEvent,List<Todo>>{
  TodoBloc():super([]){
    on<AddEvent>((ev,emit)=>addTodo(ev,emit));
  }
  void addTodo(AddEvent ev,Emitter<List<Todo>>emit){
    emit([...state,Todo(desc: ev.desc, added_on: ev.added_on)]);//creates a updated list with different address
  }

  //--------used while debugging the changes occued
  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    log(change.toString());
  }
}


//---------UI
class TodoThree extends StatefulWidget {
  const TodoThree({super.key});

  @override
  State<TodoThree> createState() => _TodoThreeState();
}

class _TodoThreeState extends State<TodoThree> {

  //i have added the bloc provider in main
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo app using Bloc"),backgroundColor: Colors.blue,),
      body: Center(
        child: BlocBuilder<TodoBloc,List<Todo>>(
          builder: (context,todoList) {
            return ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (_,idx){
                  if(todoList.isEmpty) return const Center(child: Text("Empty List!"),);
                  return ListTile(
                    title: Text(todoList[idx].desc),
                    subtitle: Text(todoList[idx].added_on.toString()),
                  );
                },
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed: (){
        BlocProvider.of<TodoBloc>(context).add(AddEvent(desc: "SAMPLE", added_on: DateTime.now()));
      }),
    );
  }
}
