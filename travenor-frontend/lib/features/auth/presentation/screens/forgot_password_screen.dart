import 'package:flutter/material.dart';
import 'package:travenor/features/auth/data/services/auth_service.dart';
import 'package:travenor/features/auth/presentation/screens/login_screen.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_button.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_screen_layout.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:travenor/features/auth/presentation/widgets/email_sent_dialog.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final emailController = TextEditingController();

  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return AuthScreenLayout(
      title: "Forgot password",
      subtitle: "Enter your email account to reset your password",
      children: [
        AuthTextField(hintText: "Email", controller: emailController),

        const SizedBox(height: 30),

        AuthButton(
          text: "Reset Password",
          onTap: () async {
            try {
              await authService.forgotPassword(
                email: emailController.text.trim(),
              );

              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => const EmailSentDialog(),
              );

              Future.delayed(const Duration(seconds: 3), () {
                if (context.mounted) {
                  Navigator.pop(context); // close dialog

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                    (route) => false,
                  );
                }
              });
            } catch (e) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(e.toString())));
            }
          },
        ),
      ],
    );
  }
}
