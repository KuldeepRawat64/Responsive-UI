import 'package:flutter/material.dart';
import 'package:responsive_ui/constants.dart';
import 'package:responsive_ui/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.purpleDark,
        canvasColor: Constants.purpleLight,
        primarySwatch: Colors.blue,
      ),
      home: const WidgetTree(),
    );
  }
}
