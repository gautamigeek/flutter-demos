import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/models/models.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

  final List<SideMenuIconTabModel> iconTabList = [
    SideMenuIconTabModel(iconData: Icons.home, title: "Home", onTab: () {}),
    SideMenuIconTabModel(iconData: Icons.search, title: "Search", onTab: () {}),
    SideMenuIconTabModel(
        iconData: Icons.audiotrack, title: "Redio", onTab: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/spotify_logo.png",
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          ...iconTabList.map(
            (e) => _SideMenuIconTab(
              iconData: e.iconData,
              title: e.title,
              onTap: e.onTab,
            ),
          ),
          const SizedBox(height: 12.0),
          const _LibraryPlaylist(),
        ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    required this.iconData,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylist extends StatefulWidget {
  const _LibraryPlaylist({Key? key}) : super(key: key);

  @override
  _LibraryPlaylistState createState() => _LibraryPlaylistState();
}

class _LibraryPlaylistState extends State<_LibraryPlaylist> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            libraryAndPlaylist(
              context: context,
              title: "YOUR LIBRARY",
              list: yourLibrary,
              onTab: () {},
            ),
            const SizedBox(height: 24.0),
            libraryAndPlaylist(
              context: context,
              title: "PLAYLIST",
              list: playlists,
              onTab: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Column libraryAndPlaylist({
  required BuildContext context,
  required List<String> list,
  required String title,
  required VoidCallback onTab,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      ...list
          .map(
            (e) => ListTile(
              dense: true,
              title: Text(
                e,
                style: Theme.of(context).textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: onTab,
            ),
          )
          .toList(),
    ],
  );
}
