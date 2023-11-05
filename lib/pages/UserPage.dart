import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_account_ui/pages/accountPage.dart';
import 'package:user_account_ui/service/prefs_service.dart';

import '../service/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = '';
    _passwordController.text = '';
  }

  void _saveCredentialsToSharedPreferences() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  AccountPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 60),
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/account.gif",),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              const Center(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
              ),
              Text(
                "Log in to your existing account of Q allure",
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
              const SizedBox(height: 30,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      labelText: 'Email ...',
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.person_outline),
                    ),

                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      labelText: 'Password ...',
                      hintText: 'Enter your secure password',
                      prefixIcon: const Icon(Icons.lock_open),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: _saveCredentialsToSharedPreferences,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 55),
                  primary: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "LOG IN",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30,),
              const Text("or connect using"),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(110, 45),
                      primary: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Facebook",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(110, 45),
                      primary: Colors.red[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: Image.asset(
                      'assets/images/google_logo.png',
                      width: 34,
                      height: 34,
                    ),
                    label: const Text(
                      "Google",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(color: Colors.black),),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AccountPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      "Sign In",
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