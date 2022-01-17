import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;
  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PLAYLIST",
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        ?.copyWith(fontSize: 12.0),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Created by ${playlist.creator} • ${playlist.songs.length} song, ${playlist.duration}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        _playlistButtons(followers: playlist.followers),
      ],
    );
  }
}

// ignore: camel_case_types
class _playlistButtons extends StatelessWidget {
  final String followers;
  const _playlistButtons({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 48.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            primary: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context).textTheme.caption?.copyWith(
                  fontSize: 12.0,
                  letterSpacing: 2.0,
                ),
          ),
          child: const Text("PLAY"),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
        const Spacer(),
        Text(
          "FOLLOWER\n$followers",
          style: Theme.of(context).textTheme.overline?.copyWith(fontSize: 12.0),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
