import 'package:clean_pattern/app.dart';
import 'package:clean_pattern/config/flavor.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // config
  Flavor.env = Environment.dev;

  runApp(const MyApp(null));
}
