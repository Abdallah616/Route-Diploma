import 'package:assignment_7/core/app_colors.dart';
import 'package:assignment_7/core/image_paths.dart';
import 'package:assignment_7/core/modules/login/widgets/custom_auth_button.dart';
import 'package:assignment_7/core/modules/login/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:assignment_7/core/modules/home/view/home_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid Email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password Should Contain Special Characters';
    }
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    if (!passwordRegex.hasMatch(value)) {
      return 'Password Should Contain Special Characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                Image.asset(ImagePaths.appRoundedLogo, width: 150, height: 150),
                const SizedBox(height: 40),

                CustomTextField(
                  controller: _emailController,
                  hintText: 'Mobile Number or Email Address',
                  validator: _validateEmail,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  validator: _validatePassword,
                ),

                const SizedBox(height: 24),

                CustomAuthButton(
                  text: 'Login',
                  backgroundColor: AppColors.blue,
                  foregroundColor: AppColors.white,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 24),
                const Text(
                  'Forgotten Password ?',
                  style: TextStyle(color: AppColors.grey),
                ),

                const Spacer(),

                CustomAuthButton(
                  text: 'Create Account',
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.blue,
                  side: const BorderSide(color: AppColors.blue, width: 1.5),
                  onPressed: () {},
                ),

                const SizedBox(height: 24),
                Image.asset(ImagePaths.metaLogometaLogoWithoutFrom, height: 40),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
