import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_elevated_button.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_text_field.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({super.key});

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    occupationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
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
                controller: nameController,
                hintText: 'Full Name',
                obscureText: false,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                label: 'Full Name',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
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
              const SizedBox(height: 20),
              CustomTextField(
                controller: phoneController,
                hintText: 'Phone Number',
                obscureText: false,
                keyboardType: TextInputType.phone,
                textCapitalization: TextCapitalization.none,
                label: 'Phone Number',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: occupationController,
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
