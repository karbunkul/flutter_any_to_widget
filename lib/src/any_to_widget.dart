import 'package:any_to_widget/src/any_to_widget_scope.dart';
import 'package:any_to_widget/src/data_converter.dart';
import 'package:flutter/widgets.dart';

typedef AnyToWidgetBuilder = Widget Function(
    BuildContext context, Widget child);

class AnyToWidget extends StatelessWidget {
  final dynamic data;
  final AnyToWidgetBuilder? builder;

  const AnyToWidget(this.data, {Key? key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (builder != null) {
      return builder!.call(context, _WidgetConverter(data));
    }
    return _WidgetConverter(data);
  }
}

class _WidgetConverter extends StatelessWidget {
  final dynamic data;

  const _WidgetConverter(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scope = AnyToWidgetScope.of(context);
    final converter = scope.converters
        .firstWhere((e) => e.hasMatch(data), orElse: () => _DefaultConverter());

    return converter.convert(context, data);
  }
}

class _DefaultConverter implements DataConverter {
  @override
  Widget convert(_, data) => Text(data.toString());

  @override
  bool hasMatch(data) => true;
}
