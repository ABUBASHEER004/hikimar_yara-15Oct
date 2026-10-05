import 'package:flutter/material.dart';
class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  const SectionTitle({super.key, required this.title, this.subtitle});
  @override
  Widget build(BuildContext context) => Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w900)), if (subtitle != null) ...[const SizedBox(height: 3), Text(subtitle!, style: const TextStyle(color: Colors.grey, fontSize: 12))]]))]);
}
