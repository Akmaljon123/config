import 'package:flutter/material.dart';

class SpringWidget extends StatelessWidget {
  const SpringWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/spring.webp"),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
