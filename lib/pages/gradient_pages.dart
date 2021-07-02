import 'package:flutter/material.dart';

class GradientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1, -1),
                end: Alignment(1, 1),
                colors: [
                  Colors.red,
                  Colors.blue,
                ],
              ),
            ),
            child: Text('hello'),
          ),
        ),
      ),
    );
  }
}
