import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

/// Highly visual and color-coded Bloc observer for debugging and monitoring.
class PrettyBlocObserver extends BlocObserver {
  final String prefix;
  final bool useColor;

  const PrettyBlocObserver({
    this.prefix = 'Bloc',
    this.useColor = true,
  });

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _logBox(
      bloc,
      type: 'EVENT 🔵',
      content: event.toString(),
      colorCode: '\x1B[34m', // Blue
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logBox(
      bloc,
      type: 'STATE 🟢',
      content: 'From:\n  ${change.currentState}\nTo:\n  ${change.nextState}',
      colorCode: '\x1B[32m', // Green
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logBox(
      bloc,
      type: 'TRANSITION 🌀',
      content: 'Event:\n  ${transition.event}\nFrom:\n  ${transition.currentState}\nTo:\n  ${transition.nextState}',
      colorCode: '\x1B[36m', // Cyan
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _logBox(
      bloc,
      type: 'ERROR ❌',
      content: 'Error:\n  $error\nStackTrace:\n  ${stackTrace.toString().split('\n').take(3).join('\n  ')}',
      colorCode: '\x1B[31m', // Red
    );
  }

  void _logBox(
    BlocBase bloc, {
    required String type,
    required String content,
    required String colorCode,
  }) {
    final timestamp = DateFormat('HH:mm:ss').format(DateTime.now());
    final lines = content.split('\n').map((line) => '│ $line').toList();
    final header = '[$prefix][${bloc.runtimeType}] $type [$timestamp]';

    final fullBox = [
      '┌───────────────────────────────────────────────────────┐',
      '│ $header',
      '├───────────────────────────────────────────────────────┤',
      ...lines,
      '└───────────────────────────────────────────────────────┘',
    ];

    for (var line in fullBox) {
      print(useColor ? '$colorCode$line\x1B[0m' : line);
    }
  }
}
