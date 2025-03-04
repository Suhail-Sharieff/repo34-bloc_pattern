import 'dart:developer';

import 'package:bloc_pattern/_02_bloc/_03_authorization_demo_using_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginUI_Three extends StatefulWidget {
  const LoginUI_Three({super.key});

  @override
  State<LoginUI_Three> createState() => _LoginUI_ThreeState();
}

class _LoginUI_ThreeState extends State<LoginUI_Three> {
  //for now i will be cheking validation for password if its atleast 6 chars long
  TextEditingController passcontr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login Page")),
        body: BlocConsumer<AuthBloc, AuthState>(
          //BlocBuilder+BlocListener---IMP
          //listens and builds siultanously
          listener: (_, state) {
            if (state is Auth_Login_Failure_State) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.failure_reason)));
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageAfterLogin(),
                  ),
                  (r) => false);
            }
          },
          builder: (_, state) {
            return Column(
              children: [
                const TextField(
                  decoration: InputDecoration(label: Text("Enter email")),
                ),
                TextField(
                  controller: passcontr,
                  decoration:
                      const InputDecoration(label: Text("Enter password")),
                ),
                const SizedBox(
                  height: 23,
                ),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                          Auth_Login_Requested(
                              password_requested: passcontr.text));
                    },
                    child: const Text("Submit")),
              ],
            );
          },
        ));
  }
}

class PageAfterLogin extends StatefulWidget {
  const PageAfterLogin({super.key});

  @override
  State<PageAfterLogin> createState() => _PageAfterLoginState();
}

class _PageAfterLoginState extends State<PageAfterLogin> {
  @override
  Widget build(BuildContext context) {
    final instance_of_logged_in_user =
        context.watch<AuthBloc>().state as Auth_Login_Sucess_State;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          FloatingActionButton(child:Icon(Icons.logout),onPressed: (){
            BlocProvider.of<AuthBloc>(context).add(Auth_Logout_Requested());
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginUI_Three()));
          })
        ],
      ),
      body: Center(
        child: Text(
            "Welcome ${instance_of_logged_in_user.logged_email}+${instance_of_logged_in_user.logged_password}"),
      ),
    );
  }
}
