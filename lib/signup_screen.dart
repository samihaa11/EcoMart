import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'home_page.dart';
import 'auth_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (name == "" || email == "" || password == "") {
      _showMessage("Please fill in all fields");
      return;
    }

    if (password.length < 6) {
      _showMessage("Password should be at least 6 characters");
      return;
    }

    setState(() => _isLoading = true);

    try {
      var newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      newUser.user?.updateDisplayName(name);
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showMessage("This email already has an account, try logging in");
      } else if (e.code == 'weak-password') {
        _showMessage("Password is too weak");
      } else {
        _showMessage("Sign up failed, try again");
      }
    }

    setState(() => _isLoading = false);
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0B3D1F), Color(0xFF8FE38F), Color(0xFF3FAE55)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B3D1F),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo2.png', width: 40, fit: BoxFit.contain),
                        const SizedBox(height: 20),
                        const Text(
                          'Create an account',
                          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Already have an account? ", style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 14)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        AuthTextField(controller: _nameController, hintText: 'Name', icon: Icons.person_outline),
                        const SizedBox(height: 14),
                        AuthTextField(controller: _emailController, hintText: 'Email address', icon: Icons.mail_outline),
                        const SizedBox(height: 14),
                        AuthTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: Icons.lock_outline,
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: Colors.white54,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() => _obscurePassword = !_obscurePassword);
                            },
                          ),
                        ),
                        const SizedBox(height: 22),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _signUp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF34C759),
                              foregroundColor: const Color(0xFF0B3D1F),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              elevation: 0,
                            ),
                            child: _isLoading
                                ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF0B3D1F)),
                            )
                                : const Text('Sign-up', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
                  },
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(color: Color(0xFF34C759), shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_back, color: Color(0xFF0B3D1F), size: 21),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}