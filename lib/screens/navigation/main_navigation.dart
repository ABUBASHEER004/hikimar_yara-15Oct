import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../favorites/favorites_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class MainNavigation extends StatefulWidget { const MainNavigation({super.key}); @override State<MainNavigation> createState()=>_MainNavigationState(); }
class _MainNavigationState extends State<MainNavigation>{int currentIndex=0;final pages=const [HomeScreen(),FavoritesScreen(),ProfileScreen()];@override Widget build(BuildContext context)=>Scaffold(body:pages[currentIndex],bottomNavigationBar:NavigationBar(backgroundColor:Colors.white,indicatorColor:AppColors.primary.withValues(alpha:.12),selectedIndex:currentIndex,onDestinationSelected:(i)=>setState(()=>currentIndex=i),destinations:const [NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home_rounded,color:AppColors.primary),label:'Gida'),NavigationDestination(icon:Icon(Icons.favorite_border_rounded),selectedIcon:Icon(Icons.favorite_rounded,color:Colors.red),label:'Favorites'),NavigationDestination(icon:Icon(Icons.person_outline_rounded),selectedIcon:Icon(Icons.person_rounded,color:AppColors.primary),label:'Profile')]));}
