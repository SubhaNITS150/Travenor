import 'package:flutter/material.dart';
import 'package:travenor/features/auth/data/services/auth_service.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_button.dart';
import 'package:travenor/features/auth/presentation/widgets/auth_screen_layout.dart';
import 'package:travenor/features/auth/presentation/widgets/otp_input_buttons.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({
    super.key,
    required this.email,
  });

  final String email;

  final otp1Controller = TextEditingController();
  final otp2Controller = TextEditingController();
  final otp3Controller = TextEditingController();
  final otp4Controller = TextEditingController();

  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();

  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return AuthScreenLayout(
      title: "OTP Verification",
      subtitle:
          "Please check your email $email to see the verification code",
      children: [
        const SizedBox(height: 20),

        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "OTP Code",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OtpInputField(
              controller: otp1Controller,
              focusNode: focus1,
              nextFocusNode: focus2,
            ),
            OtpInputField(
              controller: otp2Controller,
              focusNode: focus2,
              previousFocusNode: focus1,
              nextFocusNode: focus3,
            ),
            OtpInputField(
              controller: otp3Controller,
              focusNode: focus3,
              previousFocusNode: focus2,
              nextFocusNode: focus4,
            ),
            OtpInputField(
              controller: otp4Controller,
              focusNode: focus4,
              previousFocusNode: focus3,
            ),
          ],
        ),

        const SizedBox(height: 40),

        AuthButton(
          text: "Verify",
          onTap: () async {
            final otp =
                otp1Controller.text +
                otp2Controller.text +
                otp3Controller.text +
                otp4Controller.text;

            try {
              await authService.verifyOtp(
                email: email,
                otp: otp,
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('OTP Verified'),
                ),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                ),
              );
            }
          },
        ),

        const SizedBox(height: 20),

        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Resend code to",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              "01:26",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}