import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travenor/core/storage/token_storage.dart';
import 'package:travenor/core/utils/AppConfigs.dart';

class GroupService {
  Future<void> createGroup({
    required String groupName,
    required List<String> memberEmails,
  }) async {
    final accessToken = await TokenStorage.getAccessToken();

    if (accessToken == null) {
      throw Exception('User not authenticated');
    }

    // STEP 1: Create Group
    final createGroupResponse = await http.post(
      Uri.parse('${AppConfigs.baseUrl}/groups/create'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({'name': groupName}),
    );

    if (createGroupResponse.statusCode != 201) {
      throw Exception(createGroupResponse.body);
    }

    final groupData = jsonDecode(createGroupResponse.body);

    final String groupId = groupData['id'];

    // STEP 2: Add Members
    if (memberEmails.isNotEmpty) {
      final addMembersResponse = await http.post(
        Uri.parse('${AppConfigs.baseUrl}/groups/$groupId/members'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({'emails': memberEmails}),
      );

      if (addMembersResponse.statusCode != 200 &&
          addMembersResponse.statusCode != 201) {
        throw Exception(addMembersResponse.body);
      }
    }
  }

  Future<List<dynamic>> getMyGroups() async {
    final accessToken = await TokenStorage.getAccessToken();

    final response = await http.get(
      Uri.parse('${AppConfigs.baseUrl}/groups/my'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return jsonDecode(response.body);
  }
}
