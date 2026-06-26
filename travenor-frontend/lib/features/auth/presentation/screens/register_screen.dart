import 'package:flutter/material.dart';
import 'package:travenor/features/auth/data/services/auth_service.dart';
import 'package:travenor/features/auth/presentation/screens/login_screen.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_bottom_text.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_button.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_screen_layout.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_social_buttons.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:travenor/features/home/presentation/screens/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return AuthScreenLayout(
      title: "Sign up now",
      subtitle: "Please fill the details and create account",
      children: [
        AuthTextField(hintText: "First Name", controller: firstNameController),

        const SizedBox(height: 20),

        AuthTextField(hintText: "Last Name", controller: lastNameController),

        const SizedBox(height: 20),

        AuthTextField(hintText: "Email", controller: emailController),

        const SizedBox(height: 20),

        AuthTextField(
          hintText: "Password",
          controller: passwordController,
          isPassword: true,
        ),

        const SizedBox(height: 30),

        AuthButton(
          text: "Sign Up",
          onTap: () async {
            try {
              await authService.register(
                firstName: firstNameController.text.trim(),
                lastName: lastNameController.text.trim(),
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registration Successful')),
              );

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
          normalText: "Already have an account?",
          actionText: "Sign in",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
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
