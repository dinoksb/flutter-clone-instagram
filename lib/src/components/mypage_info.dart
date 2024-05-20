import 'package:flutter/widgets.dart';

class MyPageInfo extends StatelessWidget {
  final int count;
  final String label;
  const MyPageInfo({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
