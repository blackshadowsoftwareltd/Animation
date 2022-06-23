import 'package:flutter/material.dart'; 

import 'total_amounts.dart';

class BottomPanelWidgets extends StatefulWidget {
  const BottomPanelWidgets({Key? key}) : super(key: key);

  @override
  State<BottomPanelWidgets> createState() => _BottomPanelWidgetsState();
}

class _BottomPanelWidgetsState extends State<BottomPanelWidgets> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150, width: double.infinity,
      child: TotalAmounts(),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     SlideUpAnimation(
      //         initDelay: const Duration(seconds: 1), widget: widget)
      //   ],
      // ),
    );
  }
}
