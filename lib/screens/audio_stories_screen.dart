import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/audio_story.dart';

final List<AudioStory> stories = [
  AudioStory(
    title: "Zomo da Kunkuru",
    image: "assets/images/rabbit.jpg",
    audio: "assets/audio/zomo.mp3",
  ),
  AudioStory(
    title: "Sarkin Gaskiya",
    image: "assets/images/king.jpg",
    audio: "assets/audio/king.mp3",
  ),
  AudioStory(
    title: "Darasin Tausayi",
    image: "assets/images/kindness.jpg",
    audio: "assets/audio/kindness.mp3",
  ),
  AudioStory(
    title: "Gizo da Saniya",
    image: "assets/images/saniya.jpg",
    audio: "assets/audio/saniya.mp3",
  ),
  AudioStory(
    title: "Annabi Ibrahim (alayhi as-salaam) da Kifin Babba",
    image: "assets/images/Ibrahim(A.S).jpg",
    audio: "assets/audio/Ibrahim(A.S).mp3",
  ),
  AudioStory(
    title: "Annabi Yunus (alayhi as-salaam) da Gaskiyar Bautar ALLAH",
    image: "assets/images/Yunus(A.S).jpg",
    audio: "assets/audio/Yunus(A.S).mp3",
  ),
  AudioStory(
    title: "Annabi Nuhu (alayhi as-salaam) da Babban Jirgin Ruwa",
    image: "assets/images/Nuhu(A.S).jpg",
    audio: "assets/audio/Nuhu(A.S).mp3",
  ),
   AudioStory(
    title: "Watan da Ya Yi Murmushi",
    image: "assets/images/Wata.jpg",
    audio: "assets/audio/Wata.mp3",
  ),
  AudioStory(
    title: "Tauraruwar Alheri",
    image: "assets/images/Alheri.jpg",
    audio: "assets/audio/Alheri.mp3",
  ),
  AudioStory(
    title: "Zomo da Hular Biri",
    image: "assets/images/Hula.jpg",
    audio: "assets/audio/Hula.mp3",
  ),
];

class AudioStoriesScreen extends StatefulWidget {
  const AudioStoriesScreen({super.key});

  @override
  State<AudioStoriesScreen> createState() => _AudioStoriesScreenState();
}

class _AudioStoriesScreenState extends State<AudioStoriesScreen> {
  final AudioPlayer player = AudioPlayer();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadStory(0);

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        nextStory();
      }
    });
  }

  Future<void> loadStory(int index) async {
    print("Loading: ${stories[index].audio}");

    await player.stop();

    await player.setAsset(stories[index].audio);

    setState(() {
      currentIndex = index;
    });
  }

  Future<void> playPause() async {
    if (player.playing) {
      await player.pause();
    } else {
      await player.play();
    }

    setState(() {});
  }

  void nextStory() {
    if (currentIndex < stories.length - 1) {
      loadStory(currentIndex + 1);
      player.play();
    }
  }

  void previousStory() {
    if (currentIndex > 0) {
      loadStory(currentIndex - 1);
      player.play();
    }
  }

  String format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');

    return "${two(d.inMinutes)}:${two(d.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final story = stories[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Audio Stories")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(story.image, height: 180, fit: BoxFit.cover),
              ),

              const SizedBox(height: 20),

              Text(
                story.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              StreamBuilder<Duration>(
                stream: player.positionStream,
                builder: (context, snapshot) {
                  final position = snapshot.data ?? Duration.zero;
                  final duration = player.duration ?? Duration.zero;

                  return Column(
                    children: [
                      Slider(
                        value: position.inSeconds.toDouble(),
                        max: duration.inSeconds == 0
                            ? 1
                            : duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          player.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(format(position)),
                          Text(format(duration)),
                        ],
                      ),
                    ],
                  );
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.skip_previous),
                    onPressed: previousStory,
                  ),

                  IconButton(
                    iconSize: 70,
                    icon: Icon(
                      player.playing ? Icons.pause_circle : Icons.play_circle,
                    ),
                    onPressed: playPause,
                  ),

                  IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.skip_next),
                    onPressed: nextStory,
                  ),
                ],
              ),

              const Divider(),

              const Text(
                "All Stories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          stories[index].image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(stories[index].title),
                      trailing: const Icon(Icons.play_arrow),
                      onTap: () async {
                        await loadStory(index);
                        await player.play();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
