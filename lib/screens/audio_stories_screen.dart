import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../data/sample_stories.dart';
import '../models/story.dart';
import '../services/tts_service.dart';

class AudioStoriesScreen extends StatefulWidget { const AudioStoriesScreen({super.key}); @override State<AudioStoriesScreen> createState()=>_AudioStoriesScreenState(); }
class _AudioStoriesScreenState extends State<AudioStoriesScreen>{
  int currentIndex=0; bool english=false; bool playing=false; final tts=TtsService();
  Story get story=>stories[currentIndex];
  Future<void> toggle() async { if(playing){await tts.stop();setState(()=>playing=false);}else{setState(()=>playing=true);await tts.speak(english?story.englishContent:story.content,english:english);if(mounted)setState(()=>playing=false);} }
  @override void dispose(){tts.stop();super.dispose();}
  @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Saurari Labarai • Listen')),body:Column(children:[
    Padding(padding:const EdgeInsets.fromLTRB(18,8,18,10),child:Row(children:[Expanded(child:_lang('Hausa',!english,(){setState(()=>english=false);if(playing)toggle();})),const SizedBox(width:8),Expanded(child:_lang('English',english,(){setState(()=>english=true);if(playing)toggle();}))])),
    Expanded(child:ListView(padding:const EdgeInsets.fromLTRB(18,8,18,100),children:[
      Container(height:230,clipBehavior:Clip.antiAlias,decoration:BoxDecoration(borderRadius:BorderRadius.circular(28)),child:Stack(fit:StackFit.expand,children:[Image.asset(story.image,fit:BoxFit.cover),Container(decoration:BoxDecoration(gradient:LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,colors:[Colors.transparent,Colors.black.withValues(alpha:.78)]))),Positioned(left:20,right:20,bottom:20,child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(english?story.englishTitle:story.title,style:const TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w900)),const SizedBox(height:6),Text('${story.category} • ${story.duration}',style:const TextStyle(color:Colors.white70,fontWeight:FontWeight.w700))]))])),
      const SizedBox(height:18),
      Container(padding:const EdgeInsets.all(18),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(24),border:Border.all(color:AppColors.border)),child:Column(children:[IconButton.filled(onPressed:toggle,icon:Icon(playing?Icons.stop_rounded:Icons.play_arrow_rounded),iconSize:40,style:IconButton.styleFrom(backgroundColor:playing?Colors.red.shade600:AppColors.primary,foregroundColor:Colors.white,padding:const EdgeInsets.all(18)),),const SizedBox(height:8),Text(playing?'Ana sauraro…':'Danna play don sauraro',style:const TextStyle(fontWeight:FontWeight.w800)),const SizedBox(height:14),Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[IconButton(onPressed:currentIndex>0?(){setState(()=>currentIndex--);}:null,icon:const Icon(Icons.skip_previous_rounded)),Text('${currentIndex+1} / ${stories.length}',style:const TextStyle(fontWeight:FontWeight.w900)),IconButton(onPressed:currentIndex<stories.length-1?(){setState(()=>currentIndex++);}:null,icon:const Icon(Icons.skip_next_rounded))])])),
      const SizedBox(height:22),const Text('All stories',style:TextStyle(fontSize:20,fontWeight:FontWeight.w900)),const SizedBox(height:10),
      ...stories.asMap().entries.map((entry){final i=entry.key;final s=entry.value;return Card(margin:const EdgeInsets.only(bottom:9),child:ListTile(onTap:(){setState(()=>currentIndex=i);},leading:ClipRRect(borderRadius:BorderRadius.circular(12),child:Image.asset(s.image,width:55,height:55,fit:BoxFit.cover)),title:Text(english?s.englishTitle:s.title,style:const TextStyle(fontWeight:FontWeight.w800)),subtitle:Text('${s.category} • ${s.duration}'),trailing:Icon(i==currentIndex?Icons.equalizer_rounded:Icons.play_circle_outline_rounded,color:i==currentIndex?AppColors.primary:null)));})
    ]))]));
  Widget _lang(String label,bool active,VoidCallback onTap)=>Expanded(child:GestureDetector(onTap:onTap,child:Container(padding:const EdgeInsets.symmetric(vertical:12),decoration:BoxDecoration(color:active?AppColors.primary:Colors.white,borderRadius:BorderRadius.circular(15),border:Border.all(color:active?AppColors.primary:AppColors.border)),child:Text(label,textAlign:TextAlign.center,style:TextStyle(color:active?Colors.white:AppColors.muted,fontWeight:FontWeight.w900)))));
}
