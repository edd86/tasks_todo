import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_elevated_button.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_snack_bar.dart';
import 'package:tasks_todo/features/user_management/presentation/providers/user_management_providers.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_text_field.dart';
import 'package:tasks_todo/features/authentication/presentation/providers/theme_provider.dart';

import 'package:tasks_todo/features/user_management/domain/entities/user_entity.dart';

class NewUserPage extends ConsumerStatefulWidget {
  const NewUserPage({super.key});

  @override
  ConsumerState<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends ConsumerState<NewUserPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _occupationController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textFieldSpace = const SizedBox(height: 50);
    final theme = ref.watch(themeProvider);
    final registrationState = ref.watch(userRegistrationProvider);

    ref.listen(userRegistrationProvider, (previous, next) {
      next.when(
        data: (data) {
          if (data.isSuccess) {
            _navigate();
            _showMessage(data.message!);
          }
        },
        error: (error, stackTrace) {
          _showMessage(error.toString());
        },
        loading: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/login'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
            icon: Icon(
              theme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar Section
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme == ThemeMode.light
                            ? const Color.fromARGB(255, 87, 87, 87)
                            : Colors.white,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://i.pravatar.cc/300?img=5',
                        ), // Placeholder
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFD35400), // Burnt orange color
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'PERSONAL INFO',
                style: TextStyle(
                  color: Color(0xFFD35400),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 30, width: double.infinity),
              // Form Fields
              CustomTextField(
                controller: _nameController,
                hintText: 'Full Name',
                obscureText: false,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                label: 'Full Name',
              ),
              textFieldSpace,
              CustomTextField(
                controller: _emailController,
                hintText: 'Email Address',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                label: 'Email Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              textFieldSpace,
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: !_isPasswordVisible,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.none,
                label: 'Password',
                suffixIcon: IconButton(
                  icon: _isPasswordVisible
                      ? const Icon(Icons.visibility_off_rounded)
                      : const Icon(Icons.visibility_rounded),
                  onPressed: () {
                    setState(() => _isPasswordVisible = !_isPasswordVisible);
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              textFieldSpace,
              CustomTextField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: !_isConfirmPasswordVisible,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.none,
                label: 'Confirm Password',
                suffixIcon: IconButton(
                  icon: _isConfirmPasswordVisible
                      ? Icon(Icons.visibility_off_rounded)
                      : Icon(Icons.visibility_rounded),
                  onPressed: () => setState(
                    () =>
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              textFieldSpace,
              CustomTextField(
                controller: _phoneController,
                hintText: 'Phone Number',
                obscureText: false,
                keyboardType: TextInputType.phone,
                textCapitalization: TextCapitalization.none,
                label: 'Phone Number',
              ),
              textFieldSpace,
              CustomTextField(
                controller: _occupationController,
                hintText: 'Occupation',
                obscureText: false,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                label: 'Occupation',
              ),
              const SizedBox(height: 40),
              registrationState.isLoading
                  ? const CircularProgressIndicator()
                  : CustomElevatedButton(
                      text: 'Save Changes',
                      icon: const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final user = UserEntity(
                            id: 0,
                            fullName: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            phoneNumber: _phoneController.text,
                            occupation: _occupationController.text,
                          );
                          await ref
                              .read(userRegistrationProvider.notifier)
                              .registerUser(user);
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigate() {
    context.go('/login');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(CustomSnackBar(message: message, context: context));
  }
}
