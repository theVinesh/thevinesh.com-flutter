import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part './text_cycle_view_event.dart';

part './text_cycle_view_state.dart';

class TextCycleViewBloc extends Bloc<TextCycleViewEvent, TextCycleViewState> {
  final _delayInMilliseconds = 1500;
  int _currentIndex = 0;
  StreamSubscription _subscription;

  final List<String> texts;

  TextCycleViewBloc(this.texts) {
    assert(texts.isNotEmpty);
  }

  @override
  TextCycleViewState get initialState => TextCycleNext(texts.first);

  @override
  Stream<TextCycleViewState> mapEventToState(TextCycleViewEvent event) async* {
    yield* _onNext(event);
  }

  Stream<TextCycleViewState> _onNext(TextCycleViewEvent event) async* {
    if (event is TextCycleStarted) {
      _currentIndex = 0;
      add(TextCycleResumed());
    }

    if (event is TextCycleResumed) {
      if (_subscription == null) {
        _subscription =
            Stream.periodic(Duration(milliseconds: _delayInMilliseconds))
                .listen((event) {
          add(TextCycleOnNext());
        });
      } else {
        _subscription.resume();
      }
    }

    if (event is TextCyclePaused) {
      _subscription.pause();
    }

    if (event is TextCycleOnNext) {
      _currentIndex = (_currentIndex + 1) % texts.length;
    }
    yield TextCycleNext(texts[_currentIndex]);
  }
}
