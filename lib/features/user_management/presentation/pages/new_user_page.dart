import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_elevated_button.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_text_field.dart';
import 'package:tasks_todo/features/authentication/presentation/providers/theme_provider.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _occupationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textFieldSpace = const SizedBox(height: 50);
    final theme = ref.watch(themeProvider);
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

              // Save Button
              CustomElevatedButton(
                text: 'Save Changes',
                icon: const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  // TODO: Implement save logic
                  if (_formKey.currentState!.validate()) {
                    print('Form is valid');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
