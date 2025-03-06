import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/provider/yolo_provider.dart';
import 'package:yolo/screens/bottom_nav_bar_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<YoloProvider>(
        create: (context) => YoloProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Color(0XFF0D0D0D),
        ),
        useMaterial3: true,
      ),
      home: BottomNavBarScreen(),
    );
  }
}
