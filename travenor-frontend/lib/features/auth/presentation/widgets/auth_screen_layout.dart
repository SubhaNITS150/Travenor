import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_color.dart';

class AuthScreenLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  const AuthScreenLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.07,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.02),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xfff7f7f9),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xff1B1E28),),
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.06),

                      Text(
                        title,
                        style: TextStyle(
                          fontSize: size.width * 0.08,
                          fontWeight: FontWeight.bold,
                          color: AppColor.headTextBlack,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.paragraphTextBlack,
                          fontSize: size.width * 0.04,
                        ),
                      ),

                      SizedBox(height: size.height * 0.05),

                      ...children,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}