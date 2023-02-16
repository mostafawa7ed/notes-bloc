part of 'switch1_bloc.dart';

abstract class Switch1Event extends Equatable {
  const Switch1Event();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends Switch1Event {}

class SwitchOffEvent extends Switch1Event {}
