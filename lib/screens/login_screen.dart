import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Matching the soft greenish-beige theme [cite: 50, 51]
      backgroundColor: const Color(0xFFF5F6F1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Brand Icon and Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B5E20),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.eco, // Placeholder for the leaf logo
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'FarmKeeper',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Login Heading
                  const Text(
                    'Login to your\ndashboard',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Enter your credentials to access your harvest data.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // EMAIL ADDRESS Field
                  _buildLoginInputField(
                    label: 'EMAIL ADDRESS',
                    hint: 'name@farmkeeper.com',
                    icon: Icons.mail_outline,
                  ),
                  const SizedBox(height: 20),

                  // PASSWORD Field with "Forgot Password?"
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'PASSWORD',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF9E6D42),
                              letterSpacing: 1.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1B5E20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '........',
                          prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade400, size: 20),
                          suffixIcon: Icon(Icons.visibility_outlined, color: Colors.grey.shade400, size: 20),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Login Button
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/splash_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF236B27),
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR CONTINUE WITH',
                          style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Social Buttons
                  Row(
                    children: [
                      Expanded(child: _buildSocialButton('Google', Icons.g_mobiledata)),
                      const SizedBox(width: 16),
                      Expanded(child: _buildSocialButton('Apple', Icons.apple)),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // New User Link
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.go('/create_account_screen');
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'New to FarmKeeper? ',
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                          children: [
                            TextSpan(
                              text: 'Create an account',
                              style: TextStyle(
                                color: Color(0xFF1B5E20),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginInputField({required String label, required String hint, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: Color(0xFF9E6D42),
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 20),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String text, IconData icon) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 24),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}