import 'package:flutter/material.dart';

class StoryCategory {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const StoryCategory({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
}

const categories = [
  StoryCategory(icon: Icons.pets_rounded, title: 'Dabbobi', subtitle: 'Animal tales', color: Color(0xffD97706)),
  StoryCategory(icon: Icons.mosque_rounded, title: 'Addini', subtitle: 'Faith & character', color: Color(0xff0F766E)),
  StoryCategory(icon: Icons.account_balance_rounded, title: 'Sarakuna', subtitle: 'Kings & kingdoms', color: Color(0xff7C3AED)),
  StoryCategory(icon: Icons.favorite_rounded, title: 'Tarbiyya', subtitle: 'Good manners', color: Color(0xffDB2777)),
  StoryCategory(icon: Icons.sentiment_very_satisfied_rounded, title: 'Barkwanci', subtitle: 'Fun & wisdom', color: Color(0xff2563EB)),
  StoryCategory(icon: Icons.nightlight_round, title: 'Kafin Barci', subtitle: 'Gentle bedtime', color: Color(0xff4338CA)),
];
