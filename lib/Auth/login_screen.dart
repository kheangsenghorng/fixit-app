import 'package:flutter/material.dart';
import 'widgets/auth_header.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/social_button.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(),

              const SizedBox(height: 30),

              Text(
                "Enter your email and password to\nlogin",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onBackground,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              const CustomTextField(
                hint: "Enter your email",
                icon: Icons.email_outlined,
              ),

              const CustomTextField(
                hint: "Enter your password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.6),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUpScreen(),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "New to FixIt? ",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onBackground.withOpacity(0.6),
                          ),
                        ),
                        TextSpan(
                          text: "Sign up now",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  "Or log in with",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.5),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Expanded(
                    child: SocialButton(
                      label: "Google",
                      iconPath: "assets/images/google_logo.png",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SocialButton(
                      label: "Apple",
                      iconPath: isDarkMode
                          ? "assets/images/apple.png"          // 🌙 Dark mode
                          : "assets/images/apple_logo.png",    // 🌞 Light mode
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
