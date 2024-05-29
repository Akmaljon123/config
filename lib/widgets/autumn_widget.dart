import 'package:flutter/material.dart';

class AutumnWidget extends StatelessWidget {
  const AutumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/autumn.jpg"),
            fit: BoxFit.cover
          )
      ),
    );
  }
}
