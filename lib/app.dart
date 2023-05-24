import 'package:flutter/material.dart';

import 'view/calculator_view.dart';
import 'view/dashboard.dart';
import 'view/gallery.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardView(),
        '/calculator': (context) => const CalculatorView(),
        '/gallery': (context) => const GalleryView()
      },
    );
  }
}
