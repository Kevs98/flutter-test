import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/navigation_bloc.dart';
import 'package:flutter_application/blocs/navigation_event.dart';
import 'package:flutter_application/blocs/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.selectedIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                context.read<NavigationBloc>().add(NavigateToIProcess());
                break;
              case 1:
                context.read<NavigationBloc>().add(NavigateToECard());
                break;
              case 2:
                context.read<NavigationBloc>().add(NavigateToQuiz());
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.bookmark_added), label: 'Progress'),
            BottomNavigationBarItem(icon: Icon(Icons.sd_card), label: 'Card'),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          ],
        );
      },
    );
  }
}
