// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'counter2_state.dart';

class Counter2Cubit extends Cubit<Counter2State> {
  Counter2Cubit() : super(Counter2Initial(count: 0));
  void increment() {
    var count = state.count;
    count++;
    emit(state.copyWith(count2: count));
  }

  void decrement() {
    var count = state.count;
    count--;
    emit(state.copyWith(count2: count));
  }
}
