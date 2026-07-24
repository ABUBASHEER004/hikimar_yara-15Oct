import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../models/story.dart';

class AudioPlayerScreen extends StatefulWidget {
  final Story story;

  const AudioPlayerScreen({
    super.key,
    required this.story,
  });

  @override
  State<AudioPlayerScreen> createState() =>
      _AudioPlayerScreenState();
}

class _AudioPlayerScreenState
    extends State<AudioPlayerScreen> {

  final AudioPlayer player = AudioPlayer();

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadAudio();
  }

  Future<void> loadAudio() async {
    try {
      await player.setAsset(widget.story.audio);
    } catch (e) {
      debugPrint(e.toString());
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  String format(Duration d) {
    String two(int n) =>
        n.toString().padLeft(2, "0");

    return "${two(d.inMinutes)}:${two(d.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [

            const SizedBox(height: 20),

            Hero(
              tag: widget.story.title,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(25),

                child: Image.asset(
                  widget.story.image,
                  height: 260,
                  width: 260,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 35),

            Text(
              widget.story.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.story.author,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 40),

            StreamBuilder<Duration>(
              stream: player.positionStream,
              builder: (context, snapshot) {

                final position =
                    snapshot.data ?? Duration.zero;

                final duration =
                    player.duration ?? Duration.zero;

                return Column(
                  children: [

                    Slider(
                      min: 0,
                      max: duration.inSeconds
                          .toDouble()
                          .clamp(1, double.infinity),
                      value: position.inSeconds
                          .toDouble()
                          .clamp(
                            0,
                            duration.inSeconds
                                .toDouble()
                                .clamp(1, double.infinity),
                          ),
                      onChanged: (value) {
                        player.seek(
                          Duration(
                            seconds: value.toInt(),
                          ),
                        );
                      },
                    ),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          format(position),
                        ),

                        Text(
                          format(duration),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),

            const Spacer(),

            StreamBuilder<PlayerState>(
              stream: player.playerStateStream,
              builder: (context, snapshot) {

                final playing =
                    snapshot.data?.playing ?? false;

                if (loading) {
                  return const CircularProgressIndicator();
                }

                return Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,

                  children: [

                    IconButton(
                      iconSize: 42,
                      icon: const Icon(
                        Icons.replay_10,
                      ),
                      onPressed: () {
                        final newPosition =
                            player.position -
                                const Duration(
                                  seconds: 10,
                                );

                        player.seek(newPosition);
                      },
                    ),

                    FloatingActionButton(
                      heroTag: "play",

                      onPressed: () {
                        if (playing) {
                          player.pause();
                        } else {
                          player.play();
                        }
                      },

                      child: Icon(
                        playing
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 42,
                      ),
                    ),

                    IconButton(
                      iconSize: 42,
                      icon: const Icon(
                        Icons.forward_10,
                      ),
                      onPressed: () {
                        final newPosition =
                            player.position +
                                const Duration(
                                  seconds: 10,
                                );

                        player.seek(newPosition);
                      },
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}