import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  static const String _storageKey = "favoriteStories";

  final List<String> _favoriteIds = [];

  List<String> get favorites => List.unmodifiable(_favoriteIds);

  FavoritesProvider() {
    loadFavorites();
  }

  bool isFavorite(String storyId) {
    return _favoriteIds.contains(storyId);
  }

  Future<void> toggleFavorite(String storyId) async {
    if (_favoriteIds.contains(storyId)) {
      _favoriteIds.remove(storyId);
    } else {
      _favoriteIds.add(storyId);
    }

    notifyListeners();
    await saveFavorites();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      _storageKey,
      _favoriteIds,
    );
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getStringList(_storageKey);

    if (data != null) {
      _favoriteIds
        ..clear()
        ..addAll(data);
    }

    notifyListeners();
  }

  Future<void> clearFavorites() async {
    _favoriteIds.clear();

    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}