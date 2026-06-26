import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travenor/app.dart';

void main() async {
  // Initialize
  WidgetsFlutterBinding.ensureInitialized();

  // Call API

  // Run Application
  runApp(const ProviderScope(child: MyApp()));
}
