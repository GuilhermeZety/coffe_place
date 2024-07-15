import 'package:coffee_place/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';

class PlayerItem extends StatefulWidget {
  const PlayerItem({super.key, required this.title, required this.player});

  final String title;
  final AudioPlayer player;

  @override
  State<PlayerItem> createState() => _PlayerItemState();
}

class _PlayerItemState extends State<PlayerItem> {
  @override
  void initState() {
    widget.player.playingStream.listen((event) {
      if (mounted) setState(() {});
    });
    widget.player.volumeStream.listen((event) {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.title,
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (widget.player.playing) {
                  widget.player.pause();
                } else {
                  widget.player.play();
                }
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: widget.player.playing ? const AlwaysStoppedAnimation(1.0) : const AlwaysStoppedAnimation(0.0),
                color: AppColors.title,
                size: 24,
              ),
            ),
          ],
        ),
        //volume
        Row(
          children: [
            GestureDetector(
              onTap: () {
                widget.player.setVolume(widget.player.volume == 0 ? 0.7 : 0);
              },
              child: Icon(
                widget.player.volume == 0 ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                color: AppColors.title,
              ),
            ),
            const Gap(15),
            Slider(
              value: widget.player.volume,
              onChanged: (value) {
                widget.player.setVolume(value);
              },
            ),
          ],
        ),
      ],
    );
  }
}
