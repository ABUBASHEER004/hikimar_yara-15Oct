import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_assets.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 54, height: 54,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: .10),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Image.asset(AppAssets.logo, errorBuilder: (_, __, ___) => const Icon(Icons.auto_stories_rounded, color: AppColors.primary)),
        ),
        const SizedBox(width: 13),
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Sannu da zuwa 👋', style: TextStyle(color: AppColors.muted, fontSize: 13, fontWeight: FontWeight.w600)),
          SizedBox(height: 2),
          Text('Hikimar Yara', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, letterSpacing: -.5)),
        ])),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.border)),
          child: const IconButton(onPressed: null, icon: Icon(Icons.notifications_none_rounded)),
        ),
      ],
    );
  }
}
