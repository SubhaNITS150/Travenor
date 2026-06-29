import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travenor/core/storage/token_storage.dart';
import 'package:travenor/core/utils/AppConfigs.dart';
import 'package:travenor/features/meetanalysis/data/models/discussed_destination_model.dart';
import 'package:travenor/features/meetings/data/models/meeting_models.dart';

class MeetingService {
  Future<Map<String, dynamic>> createMeeting({
    required String meetingName,
  }) async {
    final accessToken = await TokenStorage.getAccessToken();
    if (accessToken == null || accessToken.isEmpty) {
      throw Exception("User is not authenticated.");
    }
    final response = await http.post(
      Uri.parse('${AppConfigs.baseUrl}/meetings/create'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'meetingName': meetingName}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    final body = jsonDecode(response.body);
    throw Exception(body['message'] ?? 'Failed to create meeting.');
  }

  Future<List<MeetingResponseModel>> getMyMeetings({int? limit}) async {
    final accessToken = await TokenStorage.getAccessToken();

    if (accessToken == null || accessToken.isEmpty) {
      throw Exception("User is not authenticated.");
    }

    final uri = Uri.parse('${AppConfigs.baseUrl}/meetings/my-meetings').replace(
      queryParameters: limit != null ? {'limit': limit.toString()} : null,
    );

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List<dynamic>;
      return body
          .map(
            (meeting) =>
                MeetingResponseModel.fromJson(meeting as Map<String, dynamic>),
          )
          .toList();
    }

    final body = jsonDecode(response.body);
    throw Exception(body['message'] ?? 'Failed to fetch meetings.');
  }

  Future<MeetingResponseModel> getMeetingById({
    required String meetingId,
  }) async {
    final accessToken = await TokenStorage.getAccessToken();

    if (accessToken == null || accessToken.isEmpty) {
      throw Exception("User is not authenticated.");
    }

    final response = await http.get(
      Uri.parse('${AppConfigs.baseUrl}/meetings/$meetingId'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('📦 Raw response: ${response.body}');
      return MeetingResponseModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    final body = jsonDecode(response.body);
    throw Exception(body['message'] ?? 'Failed to fetch meeting.');
  }

  Future<void> processMeeting({required String meetingId}) async {
    final accessToken = await TokenStorage.getAccessToken();

    if (accessToken == null || accessToken.isEmpty) {
      throw Exception("User is not authenticated.");
    }

    final response = await http.post(
      Uri.parse('${AppConfigs.baseUrl}/meetings/$meetingId/process'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) return;

    final body = jsonDecode(response.body);
    throw Exception(body['message'] ?? 'Failed to start meeting processing.');
  }

  Future<List<DiscussedDestinationModel>> getDiscussedDestinations({
    required String meetingId,
  }) async {
    final accessToken = await TokenStorage.getAccessToken();

    if (accessToken == null || accessToken.isEmpty) {
      throw Exception("User is not authenticated.");
    }

    final response = await http.get(
      Uri.parse(
        '${AppConfigs.baseUrl}/meetings/$meetingId/discussed-destinations',
      ),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List<dynamic>;
      return body
          .map(
            (d) =>
                DiscussedDestinationModel.fromJson(d as Map<String, dynamic>),
          )
          .toList();
    }

    final body = jsonDecode(response.body);
    throw Exception(
      body['message'] ?? 'Failed to fetch discussed destinations.',
    );
  }
}
