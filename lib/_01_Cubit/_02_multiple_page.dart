import 'package:bloc_pattern/_01_Cubit/_01_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class IncPage extends StatelessWidget {
  const IncPage({super.key});
  @override
  Widget build(BuildContext context) {
    final instance=BlocProvider.of<Couter_Cubit>(context);
    return Scaffold(
      body: Center(
        child: FloatingActionButton(child: const Icon(Icons.add),onPressed: (){
          instance.increment();
        }),
      ),
    );
  }
}
class DecPage extends StatelessWidget {
  const DecPage({super.key});
  @override
  Widget build(BuildContext context) {
    final instance=BlocProvider.of<Couter_Cubit>(context);
    return Scaffold(
      body: Center(
        child: FloatingActionButton(child: const Icon(Icons.minimize),onPressed: (){
          instance.decrement();
        }),
      ),
    );
  }
}

class Two extends StatefulWidget {
  const Two({super.key});

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> {
  // final main_instance=Couter_Cubit();---i have used alternate syntax below using provider
  /*
  main method:
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (_)=>Couter_Cubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const One(),
        ),);
      }
  * */
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter multiple pages"),),
      body: Center(
        child:  BlocBuilder<Couter_Cubit, int>(
          builder: (context, state) {
            return Text("Counter: $state", style: const TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: const Text("Go to inc page"),
              onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const IncPage()));
          }),
          TextButton(
            child: const Text("Go to dec page"),
              onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const DecPage()));
          })
        ],
      ),
    );
  }
}

