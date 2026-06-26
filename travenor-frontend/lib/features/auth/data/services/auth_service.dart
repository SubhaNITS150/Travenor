import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travenor/core/storage/token_storage.dart';
import 'package:travenor/core/utils/AppConfigs.dart';
import 'package:http/http.dart' as http;
import 'package:travenor/features/auth/presentation/screens/login_screen.dart';

class AuthService {
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('${AppConfigs.baseUrl}/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception(response.body);
    }

    final data = jsonDecode(response.body);

    print(data);

    await TokenStorage.saveTokens(
      accessToken: data['tokens']['access']['token'],
      refreshToken: data['tokens']['refresh']['token'],
    );

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('userId', data['user']['id']);
  }

  Future<void> login({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('${AppConfigs.baseUrl}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final data = jsonDecode(response.body);
    print(data);
    await TokenStorage.saveTokens(
      accessToken: data['tokens']['access']['token'],
      refreshToken: data['tokens']['refresh']['token'],
    );

    print(await TokenStorage.getAccessToken());

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('userId', data['user']['id']);
  }

  Future<void> logout(BuildContext context) async {
    await TokenStorage.clear();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
  }

  Future<bool> refreshSession() async {
    final refreshToken = await TokenStorage.getRefreshToken();

    if (refreshToken == null) {
      return false;
    }

    final response = await http.post(
      Uri.parse('${AppConfigs.baseUrl}/auth/refresh-tokens'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refreshToken': refreshToken}),
    );

    if (response.statusCode != 200) {
      return false;
    }

    final data = jsonDecode(response.body);

    await TokenStorage.saveTokens(
      accessToken: data['access']['token'],
      refreshToken: data['refresh']['token'],
    );

    return true;
  }

  Future<void> forgotPassword({required String email}) async {
    final response = await http.post(
      Uri.parse('${AppConfigs.baseUrl}/auth/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email}),
    );

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception(response.body);
    }

    // await Future.delayed(const Duration(seconds: 2));

    return;
  }

  Future<void> verifyOtp({required String email, required String otp}) async {
    // final response = await http.post(
    //   Uri.parse('${AppConfigs.baseUrl}/auth/verify-otp'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode({
    //     'email': email,
    //     'otp': otp,
    //   }),
    // );

    // if (response.statusCode != 200) {
    //   throw Exception(response.body);
    // }

    await Future.delayed(const Duration(seconds: 1));
  }
}
