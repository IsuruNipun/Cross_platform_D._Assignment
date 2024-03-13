import 'package:flutter/material.dart';



class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container
    (
      height: 70,
      width: 70, 
      margin: const EdgeInsets.only
      (
        top: 8,
        left: 8,
        ),
        decoration: BoxDecoration
        (
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
          ),
        );
  }
}