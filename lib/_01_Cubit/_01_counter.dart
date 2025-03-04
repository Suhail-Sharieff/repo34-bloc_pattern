import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Couter_Cubit extends Cubit<int> {
  Couter_Cubit() : super(0);
  void increment() {
    emit(state + 1);
  }
}

class One extends StatefulWidget {
  const One({super.key});

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  final instance = Couter_Cubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter using Cubit",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<Couter_Cubit,int>(bloc:instance,builder: (_, val) {
        return Center(
          child: Text("Counter value is $val"),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        instance.increment();
      },child: Icon(Icons.add),),
    );
  }
}
