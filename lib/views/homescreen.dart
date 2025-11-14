import 'package:block_sample/controllers/bloc/counter/counter_bloc.dart';
import 'package:block_sample/controllers/bloc/counter2/cubit/counter2_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(child: Text("${state.count}"));
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrement());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrement());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<Counter2Cubit, Counter2State>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(child: Text("${state.count}"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter2Cubit>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
