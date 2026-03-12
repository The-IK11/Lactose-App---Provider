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
   FavoriteItem(
      id: '1',
      title: 'Morning Run',
      subtitle: 'Health & Fitness',
      icon: getIconForCategory('Health & Fitness'),
    ),
 FavoriteItem(
      id: '2',
      title: 'Flutter Docs',
      subtitle: 'Development',
      icon: getIconForCategory( 'Development'),
    ),
 FavoriteItem(
      id: '3',
      title: 'Chill Playlist',
      subtitle: 'Music',
      icon: getIconForCategory('Music'),
    ),
 FavoriteItem(
      id: '4',
      title: 'Travel Plans',
      subtitle: 'Lifestyle',
      icon: getIconForCategory('Lifestyle'),
    ),
   FavoriteItem(
      id: '5',
      title: 'Book List',
      subtitle: 'Reading',
      icon: getIconForCategory('Reading'),
    ),
  ];
   String  ?  _selectedCategory;



   String get selectedCategory => _selectedCategory ?? '';
  List<FavoriteItem> get items => List.unmodifiable(_items);

  bool isFavorite(String id) => _items.any((item) => item.id == id);

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

void addItem(FavoriteItem item){
  _items.add(item);
  notifyListeners();
}

void setCategory(String category){
  _selectedCategory = category;
   notifyListeners();

}}

IconData getIconForCategory(String category){

  switch(category){
    case 'Health & Fitness':
      return Icons.directions_run_rounded;
    case 'Development':
      return Icons.code_rounded;
    case 'Music':
      return Icons.music_note_rounded;
    case 'Lifestyle':
      return Icons.flight_rounded;
    case 'Reading':
      return Icons.menu_book_rounded;
    default:
      return Icons.star_rounded; // default icon for unknown categories
  }
}