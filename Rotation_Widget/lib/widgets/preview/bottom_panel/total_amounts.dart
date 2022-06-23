import 'package:flutter/material.dart';

class TotalAmounts extends StatelessWidget {
  const TotalAmounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const _duration = Duration(milliseconds: 300);
    return const Center(
      child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 30), child: Text('\$ 0.0')),
    );
  }
}
