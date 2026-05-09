import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Change this IP to your computer's local IP when running on a physical device
  // Run `hostname -I` in your terminal to find it (e.g., 10.5.216.132)
  static const String _baseUrl = 'http://10.0.2.2:3000/api'; // Use 10.0.2.2 for emulator, or your local IP for physical device

  // ─────────────────────────────────────────────
  //  CROPS
  // ─────────────────────────────────────────────

  /// Fetch all crops with optional search, type filter, status, and sort
  static Future<List<dynamic>> getCrops({
    String? search,
    String? type,
    bool? isHarvested,
    String? sortBy,
  }) async {
    final queryParams = <String, String>{};
    if (search != null && search.isNotEmpty) queryParams['search'] = search;
    if (type != null) queryParams['type'] = type;
    if (isHarvested != null) queryParams['is_harvested'] = isHarvested.toString();
    if (sortBy != null) queryParams['sort_by'] = sortBy;

    final uri = Uri.parse('$_baseUrl/crops').replace(queryParameters: queryParams);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    throw Exception('Failed to load crops: ${response.body}');
  }

  /// Register a new crop
  static Future<Map<String, dynamic>> createCrop(Map<String, dynamic> cropData) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/crops'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cropData),
    );
    if (response.statusCode == 201) return jsonDecode(response.body);
    throw Exception('Failed to create crop: ${response.body}');
  }

  /// Update a crop
  static Future<void> updateCrop(int id, Map<String, dynamic> cropData) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/crops/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cropData),
    );
    if (response.statusCode != 200) throw Exception('Failed to update crop: ${response.body}');
  }

  /// Delete a crop
  static Future<void> deleteCrop(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/crops/$id'));
    if (response.statusCode != 200) throw Exception('Failed to delete crop: ${response.body}');
  }

  /// Mark a crop as watered today
  static Future<void> waterCrop(int id) async {
    final response = await http.post(Uri.parse('$_baseUrl/crops/$id/water'));
    if (response.statusCode != 200) throw Exception('Failed to water crop: ${response.body}');
  }

  /// Record a harvest for a crop
  static Future<void> harvestCrop(int id, Map<String, dynamic> harvestData) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/crops/$id/harvest'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(harvestData),
    );
    if (response.statusCode != 200) throw Exception('Failed to record harvest: ${response.body}');
  }

  // ─────────────────────────────────────────────
  //  JOURNAL
  // ─────────────────────────────────────────────

  /// Fetch all journal entries with optional filters
  static Future<List<dynamic>> getJournalEntries({
    String? search,
    String? category,
    int? cropId,
  }) async {
    final queryParams = <String, String>{};
    if (search != null && search.isNotEmpty) queryParams['search'] = search;
    if (category != null) queryParams['category'] = category;
    if (cropId != null) queryParams['crop_id'] = cropId.toString();

    final uri = Uri.parse('$_baseUrl/journal').replace(queryParameters: queryParams);
    final response = await http.get(uri);
    if (response.statusCode == 200) return jsonDecode(response.body)['data'];
    throw Exception('Failed to load journal: ${response.body}');
  }

  /// Add a new journal entry
  static Future<void> createJournalEntry(Map<String, dynamic> entryData) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/journal'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(entryData),
    );
    if (response.statusCode != 201) throw Exception('Failed to create entry: ${response.body}');
  }

  /// Delete a journal entry
  static Future<void> deleteJournalEntry(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/journal/$id'));
    if (response.statusCode != 200) throw Exception('Failed to delete entry: ${response.body}');
  }

  // ─────────────────────────────────────────────
  //  DASHBOARD
  // ─────────────────────────────────────────────

  /// Fetch all dashboard stats and summaries
  static Future<Map<String, dynamic>> getDashboard() async {
    final response = await http.get(Uri.parse('$_baseUrl/dashboard'));
    if (response.statusCode == 200) return jsonDecode(response.body);
    throw Exception('Failed to load dashboard: ${response.body}');
  }

  // ─────────────────────────────────────────────
  //  CALENDAR
  // ─────────────────────────────────────────────

  /// Fetch all calendar events for a given year and month
  static Future<List<dynamic>> getCalendarEvents(int year, int month) async {
    final uri = Uri.parse('$_baseUrl/calendar').replace(
      queryParameters: {'year': year.toString(), 'month': month.toString()},
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) return jsonDecode(response.body)['data'];
    throw Exception('Failed to load calendar: ${response.body}');
  }

  // ─────────────────────────────────────────────
  //  EXPORT
  // ─────────────────────────────────────────────

  /// Returns the URL for each CSV export (to be opened/shared by Flutter)
  static String getExportUrl(String type) {
    // type: 'crops', 'harvests', or 'journal'
    return '$_baseUrl/export/$type';
  }
}
