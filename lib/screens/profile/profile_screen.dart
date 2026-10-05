import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../data/sample_stories.dart';
import '../../providers/favorites_provider.dart';
import '../audio_stories_screen.dart';
import '../favorites/favorites_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override Widget build(BuildContext context){
    final favorites=context.watch<FavoritesProvider>().favorites.length;
    return Scaffold(body:SafeArea(child:SingleChildScrollView(padding:const EdgeInsets.fromLTRB(18,18,18,110),child:Column(children:[
      Container(width:double.infinity,padding:const EdgeInsets.all(22),decoration:BoxDecoration(gradient:const LinearGradient(colors:[AppColors.primaryDark,AppColors.primary]),borderRadius:BorderRadius.circular(28)),child:Row(children:[Container(width:64,height:64,padding:const EdgeInsets.all(10),decoration:BoxDecoration(color:Colors.white.withValues(alpha:.14),borderRadius:BorderRadius.circular(20)),child:Image.asset(AppAssets.logo,errorBuilder:(_,__,___)=>const Icon(Icons.auto_stories_rounded,color:Colors.white,size:38))),const SizedBox(width:15),const Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Hikimar Yara',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900)),SizedBox(height:4),Text('Learn • Listen • Grow',style:TextStyle(color:Colors.white70))]))]),
      ),
      const SizedBox(height:16),
      Row(children:[_stat('${stories.length}','Stories',Icons.menu_book_rounded),const SizedBox(width:10),_stat('$favorites','Favorites',Icons.favorite_rounded),const SizedBox(width:10),_stat('2','Languages',Icons.translate_rounded)]),
      const SizedBox(height:22),
      _tile(context,Icons.favorite_rounded,'Favorite stories','Your saved reading list',()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const FavoritesScreen())),Colors.red),
      _tile(context,Icons.headphones_rounded,'Audio library','Listen in Hausa or English',()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const AudioStoriesScreen())),AppColors.primary),
      _tile(context,Icons.translate_rounded,'Bilingual learning','Every story has Hausa + English',null,AppColors.secondary),
      _tile(context,Icons.auto_awesome_rounded,'Why Hikimar Yara?','Stories that entertain, teach and preserve Hausa values',null,const Color(0xff7C3AED)),
      _tile(context,Icons.share_rounded,'Share Hikimar Yara','Invite another family to learn',()=>Share.share('Hikimar Yara — Hausa and English stories for children.'),AppColors.primary),
      _tile(context,Icons.info_outline_rounded,'About the app','A child-friendly library inspired by Hausa storytelling, family values and learning',()=>showAboutDialog(context:context,applicationName:'Hikimar Yara',applicationVersion:'2.0.0',applicationLegalese:'© 2026 Hikimar Yara'),AppColors.muted),
    ]))));
  }
  Widget _stat(String value,String label,IconData icon)=>Expanded(child:Container(padding:const EdgeInsets.symmetric(vertical:16),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(20),border:Border.all(color:AppColors.border)),child:Column(children:[Icon(icon,color:AppColors.primary),const SizedBox(height:6),Text(value,style:const TextStyle(fontSize:19,fontWeight:FontWeight.w900)),Text(label,style:const TextStyle(color:AppColors.muted,fontSize:11))])));
  Widget _tile(BuildContext context,IconData icon,String title,String subtitle,VoidCallback? onTap,Color color)=>Card(margin:const EdgeInsets.only(bottom:10),child:ListTile(onTap:onTap,contentPadding:const EdgeInsets.symmetric(horizontal:14,vertical:5),leading:Container(width:46,height:46,decoration:BoxDecoration(color:color.withValues(alpha:.1),borderRadius:BorderRadius.circular(15)),child:Icon(icon,color:color)),title:Text(title,style:const TextStyle(fontWeight:FontWeight.w900)),subtitle:Text(subtitle,style:const TextStyle(fontSize:12)),trailing:onTap==null?null:const Icon(Icons.chevron_right_rounded)));
}
