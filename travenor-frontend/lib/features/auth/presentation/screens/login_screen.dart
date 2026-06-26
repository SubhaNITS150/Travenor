import 'package:flutter/material.dart';
import 'package:travenor/features/auth/data/services/auth_service.dart';
import 'package:travenor/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:travenor/features/auth/presentation/screens/register_screen.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_bottom_text.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_button.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_screen_layout.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_social_buttons.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:travenor/features/home/presentation/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return AuthScreenLayout(
      title: "Sign in now",
      subtitle: "Please sign in to continue our app",
      children: [
        AuthTextField(hintText: "Email", controller: emailController),

        const SizedBox(height: 20),

        AuthTextField(
          hintText: "Password",
          controller: passwordController,
          isPassword: true,
        ),

        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ForgotPasswordScreen()),
              );
            },
            child: const Text("Forgot Password?"),
          ),
        ),

        const SizedBox(height: 20),

        AuthButton(
          text: "Sign In",
          onTap: () async {
            try {
              await authService.login(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Login successful')));

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            } catch (e) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(e.toString())));
            }
          },
        ),

        const SizedBox(height: 30),

        AuthBottomText(
          normalText: "Don't have an account?",
          actionText: "Sign up",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => RegisterScreen()),
            );
          },
        ),

        const SizedBox(height: 20),

        const Text("Or connect"),

        const SizedBox(height: 30),

        const AuthSocialButtons(),
      ],
    );
  }
}
