import 'package:flutter/material.dart';

class AllAnimesListed extends StatelessWidget {
  const AllAnimesListed({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0.0, 1.0),
              blurRadius: 4.0,
            ),
          ],
          color: Colors.white,
          border: Border.all(width: .5, color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: const Text('All animes are listed'),
      ),
    );
  }
}
