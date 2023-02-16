import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'switch1_event.dart';
part 'switch1_state.dart';

class Switch1Bloc extends HydratedBloc<Switch1Event, Switch1State> {
  Switch1Bloc() : super(const Switch1Initial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(const Switch1State(switchValue: true));
    });

    on<SwitchOffEvent>((event, emit) {
      emit(const Switch1State(switchValue: false));
    });
  }

  @override
  Switch1State? fromJson(Map<String, dynamic> json) {
    return Switch1State.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(Switch1State state) {
    return state.toMap();
  }
}
