import 'package:flutter/widgets.dart';

abstract class DataConverter {
  bool hasMatch(dynamic data);
  Widget convert(BuildContext context, dynamic data);
}
