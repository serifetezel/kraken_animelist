import 'package:flutter/cupertino.dart';

class PaginationLoading extends StatelessWidget {
  const PaginationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
