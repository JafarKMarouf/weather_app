import 'package:flutter/material.dart';

class InitialBody extends StatelessWidget {
  const InitialBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
      const Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'There is no weathering 😊',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              ' start searching now 🔎 ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
  }
}
