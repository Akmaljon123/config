import 'package:flutter/material.dart';

class SummerWidget extends StatelessWidget {
  const SummerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/summer.jpg"),
            fit: BoxFit.cover
          )
      ),
    );
  }
}
