import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Matched the soft greenish-beige background
      backgroundColor: const Color(0xFFF5F6F1), 
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            // Added horizontal padding for the entire screen content
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                
                // Top Header Titles
                const Text(
                  'FarmKeeper',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1B5E20), // Dark green
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Cultivate your digital harvest.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Rounded Illustration
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/createAccount.png',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Create Account Heading
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                
                // NAME Field
                _buildInputField(
                  label: 'NAME',
                  hint: 'Full name',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 16),
                
                // EMAIL Field
                _buildInputField(
                  label: 'EMAIL',
                  hint: 'your@farm.com',
                  icon: Icons.mail_outline,
                ),
                const SizedBox(height: 16),
                
                // PASSWORD Field
                _buildInputField(
                  label: 'PASSWORD',
                  hint: '........',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 32),
                
                // Create Account Button
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                  onPressed: () {
                    context.go('/onboarding2_screen');
                  },
                     style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32), // Match button green
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'OR CONTINUE WITH',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
                  ],
                ),
                const SizedBox(height: 24),
                
                // Social Login Buttons
                Row(
                  children: [
                    Expanded(
                      child: _buildSocialButton(
                        text: 'Google',
                        // Using an asset for the colored Google logo is best. 
                        // You can replace this NetworkImage with Image.asset('assets/icons/google.png')
                        iconWidget: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.svg', 
                          height: 20,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.g_mobiledata, color: Colors.black, size: 28),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSocialButton(
                        text: 'Apple',
                        iconWidget: const Icon(Icons.apple, color: Colors.black, size: 24),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                
                // Sign In Link
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.go('/login_screen');
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                        children: [
                          TextSpan(
                            text: 'Sign In',
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
                const SizedBox(height: 40),
                
                // Footer Links
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('PRIVACY POLICY', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
                    Text('TERMS OF SERVICE', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
                    Text('SUPPORT', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for input fields
  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: Color(0xFF9E6D42), // Matched brown label color
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
            suffixIcon: Icon(icon, color: Colors.grey.shade600, size: 20),
            filled: true,
            fillColor: const Color(0xFFEBEBE1), // Grayish-beige input box
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  // Helper method for social buttons
  Widget _buildSocialButton({required String text, required Widget iconWidget}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}