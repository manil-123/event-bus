import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class FileHandler {
  Future<Map<String, dynamic>?> parseJsonFromAssets(String assetsPath) async {
    final String jsonString = await rootBundle.loadString(assetsPath);
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
}
