import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel item;
  const OnboardingPage({super.key, required this.item});
  @override Widget build(BuildContext context)=>Padding(padding:const EdgeInsets.fromLTRB(24,20,24,0),child:Column(children:[
    Expanded(flex:7,child:Container(width:double.infinity,padding:const EdgeInsets.all(22),decoration:BoxDecoration(gradient:LinearGradient(colors:[AppColors.primary.withValues(alpha:.09),AppColors.secondary.withValues(alpha:.08)]),borderRadius:BorderRadius.circular(34)),child:Image.asset(item.image,fit:BoxFit.contain,errorBuilder:(_,__,___)=>const Icon(Icons.auto_stories_rounded,size:120,color:AppColors.primary)))),
    const SizedBox(height:28),Text(item.title,textAlign:TextAlign.center,style:const TextStyle(fontSize:28,fontWeight:FontWeight.w900)),const SizedBox(height:14),Text(item.description,textAlign:TextAlign.center,style:const TextStyle(fontSize:16,color:AppColors.muted,height:1.6)),const Spacer(),
  ]));
}
