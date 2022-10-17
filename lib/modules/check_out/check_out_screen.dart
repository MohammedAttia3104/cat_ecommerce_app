import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:Text(
          'Check Out Screen',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
