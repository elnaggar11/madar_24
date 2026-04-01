import 'package:madar_24/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentlySearchedService {
  static const String _key = 'recent_searches';
  static const int _maxItems = 10;

  List<String> getRecentSearches() {
    final jsonString = prefs.getStringList(_key) ?? [];
    final List<String> jsonList = jsonString;
    return jsonList;
  }

  Future<void> addSearch(String query) async {
    if (query.length < 3) return;
    final prefs = await SharedPreferences.getInstance();
    final recentSearches = getRecentSearches();

    // Avoid duplicates
    final filteredSearches = recentSearches
        .where((other) => other != query && other.contains(query))
        .toList();

    // Add new search at the top
    filteredSearches.insert(0, query);

    // Trim to max items
    if (filteredSearches.length > _maxItems) {
      filteredSearches.removeLast();
    }

    await prefs.setStringList(_key, filteredSearches);
  }

  Future<void> clearSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
