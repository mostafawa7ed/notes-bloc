part of 'switch1_bloc.dart';

class Switch1State extends Equatable {
  final bool switchValue;
  const Switch1State({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return {
      'switchValue': switchValue,
    };
  }

  factory Switch1State.fromMap(Map<String, dynamic> map) {
    return Switch1State(switchValue: map['switchValue']);
  }
}

class Switch1Initial extends Switch1State {
  const Switch1Initial({required bool switchValue})
      : super(switchValue: switchValue);
}
