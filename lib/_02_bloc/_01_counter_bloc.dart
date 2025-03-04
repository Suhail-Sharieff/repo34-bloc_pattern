import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class Inc_Dec_Events{}
class Increment_Event extends Inc_Dec_Events{}
class Decrement_Event extends Inc_Dec_Events{}

class Couter_Bloc extends Bloc<Inc_Dec_Events,int> {
  Couter_Bloc() : super(0){
    // on<Increment_Event>((event,emit)=>increment(emit));
    // on<Decrement_Event>((event,emit)=>decrement(emit));

    //better way:
    on<Inc_Dec_Events>((ev,emit)=>_handle_events(ev, emit));
  }

    void _handle_events(Inc_Dec_Events ev,Emitter<int>emit){
    emit(
      switch(ev){
        Increment_Event() => state+1,
        Decrement_Event() => state-1,
      }
    );
  }

  // void increment(Emitter<int> emit) {
  //   emit(state + 1);
  // } void decrement(Emitter<int> emit) {
  //   emit(state - 1);
  // }
}


class Counter_using_bloc_one extends StatefulWidget {
  const Counter_using_bloc_one({super.key});

  @override
  State<Counter_using_bloc_one> createState() => _Counter_using_bloc_oneState();
}

class _Counter_using_bloc_oneState extends State<Counter_using_bloc_one> {

  //multiple page mngmt is as same method as of cubt, ie in main page u wrap app within bloc provider(create:(_)=>...)
  @override
  Widget build(BuildContext context) {

    // final instance=BlocProvider.of<Couter_Bloc>(context); this was created just to call function

    return Scaffold(
      appBar: AppBar(title: Text("Counter using Bloc"),),
      body: Center(
        child: BlocBuilder<Couter_Bloc,int>(builder: (_,val){
          return Text("${val}");
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(child:Icon(Icons.add),onPressed: (){
            // instance.add(Increment_Event());---since i have commented out instance, i canuse below syntx
            context.read<Couter_Bloc>().add(Increment_Event());
          }),FloatingActionButton(child:Icon(Icons.minimize),onPressed: (){
            // instance.add(Increment_Event());
            context.read<Couter_Bloc>().add(Decrement_Event());
          }),
        ],
      ),
    );
  }
}
