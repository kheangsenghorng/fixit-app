import 'package:flutter/material.dart';
import 'widgets/auth_header.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/social_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(),

                const SizedBox(height: 30),

                Text(
                  "Create your account",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onBackground,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 30),

                const CustomTextField(
                  hint: "Full name",
                  icon: Icons.person_outline,
                ),

                const CustomTextField(
                  hint: "Enter your email",
                  icon: Icons.email_outlined,
                ),

                const CustomTextField(
                  hint: "Enter password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),

                const SizedBox(height: 8),

                // TERMS & CONDITIONS
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (_) {},
                      activeColor: colorScheme.primary,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "I agree with FixIt's ",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color:
                                colorScheme.onBackground.withOpacity(0.6),
                              ),
                            ),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // SIGN UP BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Center(
                  child: Text(
                    "Or sign up with",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onBackground.withOpacity(0.5),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                 Row(
                  children: [
                    Expanded(
                      child: SocialButton(
                        label: "Google",
                        iconPath: "assets/images/google_logo.png",
                      ),
                    ),
                    SizedBox(width: 16),
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
      ),
    );
  }
}
