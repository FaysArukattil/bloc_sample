part of 'counter2_cubit.dart';

class Counter2State {
  final int count;

  Counter2State({required this.count});

  Counter2State copyWith({int? count2}) {
    return Counter2State(count: count2 ?? count);
  }
}

final class Counter2Initial extends Counter2State {
  Counter2Initial({required super.count});
}
