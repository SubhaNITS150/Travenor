import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travenor/core/utils/AppConfigs.dart';

class ProfileService {
  Future<Map<String, dynamic>> getProfileInfo({
    required String userId,
    required String accessToken
  }) async {
    final data = await http.get(
      Uri.parse('${AppConfigs.baseUrl}/users/$userId'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (data.statusCode == 200) {
      return jsonDecode(data.body);
    }

    throw Exception(data.body);
  }
}