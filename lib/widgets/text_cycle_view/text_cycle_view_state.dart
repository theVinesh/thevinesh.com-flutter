part of './text_cycle_view_bloc.dart';

abstract class TextCycleViewState extends Equatable {
  const TextCycleViewState();
}

class TextCycleNext extends TextCycleViewState{
  final String text;

  const TextCycleNext(this.text);

  @override
  List<Object> get props => [text];
}
