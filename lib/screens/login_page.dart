import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_ai/screens/change_password.dart';
import 'package:todo_ai/screens/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    'lib/assets/images/logo.png',
                    height: 170,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                child: Text("SIGN IN FOR SAVED TASKS",
                    style: TextStyle(
                      color: HexColor("A694E1"),
                      fontFamily: "BebasNeue",
                      fontSize: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.grey),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChangePassword(),
                    ));
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Sign in action
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 145, vertical: 12),
                  backgroundColor: HexColor("A694E1"),
                ),
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: HexColor("A694E1"),
                      ),
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
