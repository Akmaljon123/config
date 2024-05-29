import 'package:flutter/material.dart';

class WinterWidget extends StatelessWidget {
  const WinterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/winter.jpg"),
            fit: BoxFit.cover
          )
      ),
    );
  }
}
