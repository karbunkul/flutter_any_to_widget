<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Convert any data to widget

## Getting started

Add package to your project ```flutter pub add any_to_widget```

Implements DataConverter for your types. For example 

```dart
import 'package:any_to_widget/any_to_widget.dart';
import 'package:flutter/material.dart';

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
```

Setup AnyToWidgetScope

```dart
import 'package:any_to_widget/any_to_widget.dart';
import 'package:flutter/material.dart';

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
```

Convert any data to widget

```dart
import 'package:any_to_widget/any_to_widget.dart';
import 'package:flutter/material.dart';

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
```