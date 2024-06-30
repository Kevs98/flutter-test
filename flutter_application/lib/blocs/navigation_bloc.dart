import 'package:flutter_application/blocs/navigation_event.dart';
import 'package:flutter_application/blocs/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(0)) {
    on<NavigateToIProcess>((event, emit) => emit(const NavigationState(0)));
    on<NavigateToECard>((event, emit) => emit(const NavigationState(1)));
    on<NavigateToQuiz>((event, emit) => emit(const NavigationState(2)));
  }
}
