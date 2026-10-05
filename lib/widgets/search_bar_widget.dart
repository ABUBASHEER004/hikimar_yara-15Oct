import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});
  @override
  Widget build(BuildContext context) => Container(
    height: 58,
    padding: const EdgeInsets.symmetric(horizontal: 17),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(19), border: Border.all(color: AppColors.border), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .03), blurRadius: 14, offset: const Offset(0, 6))]),
    child: const Row(children: [Icon(Icons.search_rounded, color: AppColors.primary), SizedBox(width: 11), Text('Search Hausa or English stories…', style: TextStyle(color: AppColors.muted, fontSize: 14))]),
  );
}
