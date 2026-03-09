import 'package:flutter/material.dart';

class FavoriteItem {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;

  const FavoriteItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class FavoriteProvider with ChangeNotifier {
  final List<FavoriteItem> _items = [
    const FavoriteItem(
      id: '1',
      title: 'Morning Run',
      subtitle: 'Health & Fitness',
      icon: Icons.directions_run_rounded,
    ),
    const FavoriteItem(
      id: '2',
      title: 'Flutter Docs',
      subtitle: 'Development',
      icon: Icons.code_rounded,
    ),
    const FavoriteItem(
      id: '3',
      title: 'Chill Playlist',
      subtitle: 'Music',
      icon: Icons.music_note_rounded,
    ),
    const FavoriteItem(
      id: '4',
      title: 'Travel Plans',
      subtitle: 'Lifestyle',
      icon: Icons.flight_rounded,
    ),
    const FavoriteItem(
      id: '5',
      title: 'Book List',
      subtitle: 'Reading',
      icon: Icons.menu_book_rounded,
    ),
  ];

  List<FavoriteItem> get items => List.unmodifiable(_items);

  bool isFavorite(String id) => _items.any((item) => item.id == id);

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
