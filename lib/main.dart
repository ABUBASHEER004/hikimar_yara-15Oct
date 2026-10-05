import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/favorites_provider.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(create: (_) => FavoritesProvider(), child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override Widget build(BuildContext context)=>MaterialApp(title:'Hikimar Yara',debugShowCheckedModeBanner:false,theme:AppTheme.lightTheme,home:const SplashScreen());
}
