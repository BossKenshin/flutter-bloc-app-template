import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../shared/models/api_result.dart';

class ApiService {
  ApiService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  String get baseUrl => dotenv.maybeGet('API_BASE_URL', fallback: '') ?? '';

  Future<ApiResult<Map<String, dynamic>>> getJson(String path) async {
    final uri = Uri.parse('$baseUrl$path');

    try {
      final response = await _client.get(uri);
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResult.success(body, statusCode: response.statusCode);
      }

      return ApiResult.failure(
        body['message']?.toString() ?? 'Request failed',
        statusCode: response.statusCode,
      );
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
