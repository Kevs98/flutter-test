import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToIProcess extends NavigationEvent {}

class NavigateToECard extends NavigationEvent {}

class NavigateToQuiz extends NavigationEvent {}
