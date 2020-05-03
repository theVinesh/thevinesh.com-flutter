import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/widgets/text_cycle_view/text_cycle_view_bloc.dart';

export './text_cycle_view_bloc.dart';

class TextCycleView extends StatelessWidget {
  final TextStyle style;

  const TextCycleView({this.style});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextCycleViewBloc, TextCycleViewState>(
      builder: (context, state) {
        if (state is TextCycleNext) {
          return Text(
            state.text,
            style: style,
          );
        } else {
          return null;
        }
      },
    );
  }
}
