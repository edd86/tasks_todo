import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_elevated_button.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_text_field.dart';
import 'package:tasks_todo/features/authentication/presentation/providers/obscure_provider.dart';
import 'package:tasks_todo/features/authentication/presentation/providers/theme_provider.dart';
import 'package:tasks_todo/features/user_management/presentation/pages/new_user_page.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(obscureProvider);
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 35),
            const Text(
              'Hello there.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Stay organized and productive today!',
              style: TextStyle(fontSize: 19),
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: emailIdController,
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              suffixIcon: const Icon(Icons.person, color: Colors.brown),
              label: 'User Id or Email',
            ),
            SizedBox(height: 18, width: double.infinity),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: obscureText,
              keyboardType: TextInputType.visiblePassword,
              textCapitalization: TextCapitalization.none,
              label: 'Password',
              suffixIcon: IconButton(
                icon: obscureText
                    ? Icon(Icons.visibility, color: Colors.brown)
                    : Icon(Icons.visibility_off, color: Colors.brown),
                onPressed: () {
                  //Update obscureText by a provider in legacy
                  // ref.read(obscureProvider.notifier).state = !obscureText;
                  //Update obscureText by a provider in new
                  ref.read(obscureProvider.notifier).toggleObscure();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
              child: TextButton(
                onPressed: () {},
                child: Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 28),
            CustomElevatedButton(text: 'Login', onPressed: () {}),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.brown,
                      height: 10,
                      thickness: 0.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR CONTINUE WITH',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.brown,
                      height: 10,
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata),
                  label: Text('Google'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.apple),
                  label: Text('Apple'),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewUserPage(),
                      ),
                    );
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/* class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  void dispose() {
    emailIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 35),
            const Text(
              'Hello there.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Stay organized and productive today!',
              style: TextStyle(fontSize: 19),
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: emailIdController,
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              suffixIcon: const Icon(Icons.person, color: Colors.brown),
              label: 'User Id or Email',
            ),
            SizedBox(height: 18, width: double.infinity),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: obscureText,
              keyboardType: TextInputType.visiblePassword,
              textCapitalization: TextCapitalization.none,
              label: 'Password',
              suffixIcon: IconButton(
                icon: obscureText
                    ? Icon(Icons.visibility, color: Colors.brown)
                    : Icon(Icons.visibility_off, color: Colors.brown),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
              child: TextButton(
                onPressed: () {},
                child: Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 28),
            CustomElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewUserPage()),
                );
              },
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.brown,
                      height: 10,
                      thickness: 0.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR CONTINUE WITH',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.brown,
                      height: 10,
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata),
                  label: Text('Google'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.apple),
                  label: Text('Apple'),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(onPressed: () {}, child: Text('Register')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 */