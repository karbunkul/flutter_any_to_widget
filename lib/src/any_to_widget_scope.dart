import 'package:any_to_widget/src/data_converter.dart';
import 'package:flutter/widgets.dart';

class AnyToWidgetScope extends InheritedWidget {
  final List<DataConverter> converters;

  const AnyToWidgetScope({
    required this.converters,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static AnyToWidgetScope of(BuildContext context) {
    final AnyToWidgetScope? result =
        context.dependOnInheritedWidgetOfExactType<AnyToWidgetScope>();
    assert(result != null, 'No AnyToWidgetScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AnyToWidgetScope oldWidget) {
    return false;
  }
}
