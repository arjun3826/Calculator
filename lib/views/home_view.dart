import 'package:base/views/calculator.dart';
import 'package:flutter/material.dart';

class home_view extends StatelessWidget {
  const home_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.orangeAccent,
          child: CalculatorView(),
        ),
      ),
    );
  }
}
