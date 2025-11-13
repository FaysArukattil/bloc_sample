import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_sample/controllers/bloc/login/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    context.read<LoginBloc>().add(EmailChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: (value) {
                    context.read<LoginBloc>().add(PasswordChanged(value));
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginButtonPressed());
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),
                Text(
                  state.message,
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
