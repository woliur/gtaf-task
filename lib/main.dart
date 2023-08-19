
import 'package:flutter/material.dart';
import 'app/flavours/app_flavour.dart';
import 'app/view/app.dart';

void main() {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const AppRepoProvider());
}
