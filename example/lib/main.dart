import 'package:any_to_widget/any_to_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class A2WExceptionConverter implements DataConverter {
  const A2WExceptionConverter();

  @override
  Widget convert(BuildContext context, data) {
    final message =
        (data as Exception).toString().replaceAll('Exception: ', '');
    final style = Theme.of(context).textTheme.bodyText1;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.info, color: Colors.red),
      title: Text('Error', style: style),
      subtitle: Text(message),
    );
  }

  @override
  bool hasMatch(data) => data is Exception;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      builder: (_, child) {
        return AnyToWidgetScope(
          converters: const [
            A2WExceptionConverter(),
          ],
          child: child!,
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnyToWidget Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnyToWidget(Exception('Fatal Error')),
            const SizedBox(height: 4),
            const AnyToWidget(12.0),
            const SizedBox(height: 4),
            AnyToWidget(DateTime.now()),
          ],
        ),
      ),
    );
  }
}
