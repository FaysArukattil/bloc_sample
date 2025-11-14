import 'package:block_sample/controllers/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Login Success")));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(EmailChanged(value));
                      },
                      validator: (v) {
                        return v!.isEmpty ? "Must fill" : null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(PasswordChanged(value));
                      },
                      validator: (v) {
                        return v!.isEmpty ? "Must fill" : null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<LoginBloc>().add(Login());
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "",
                      style: const TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
