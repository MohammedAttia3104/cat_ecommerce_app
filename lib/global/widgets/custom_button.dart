// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? buttonOnPressed;
  final String buttonText;
  double? buttonWidth = double.infinity;
  IconData ? icon;

  CustomButton({super.key, required this.buttonOnPressed, required this.buttonText, this.buttonWidth, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue,
      ),
      child: TextButton(
          onPressed: buttonOnPressed,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style:const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 12,),
              Icon(
                icon,
                color: Colors.white,
                size: 18 ,
              ),
            ],
          ),),
    )
    ;
  }
}
