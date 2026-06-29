import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travenor/core/storage/token_storage.dart';
import 'package:travenor/core/utils/AppConfigs.dart';
import 'package:http_parser/http_parser.dart';


class AudioUploadService {
  Future<void> uploadAudio({
    required String meetingId,
    required PlatformFile file,
  }) async {

    final prefs = await SharedPreferences.getInstance();
    final accessToken = await TokenStorage.getAccessToken();

    if (accessToken == null) {
      throw Exception("User not authenticated");
    }

    final request = http.MultipartRequest(
      "POST",
      Uri.parse(
        "${AppConfigs.baseUrl}/meetings/$meetingId/upload-audio",
      ),
    );

    request.headers["Authorization"] = "Bearer $accessToken";

    request.files.add(
      http.MultipartFile.fromBytes(
        "audio",
        file.bytes!,
        filename: file.name,
        contentType: MediaType("audio", "mpeg"),
      ),
    );

    final response = await request.send();

    final body = await response.stream.bytesToString();

    if (response.statusCode != 200) {
      throw Exception(body);
    }

    print(jsonDecode(body));
  }
}