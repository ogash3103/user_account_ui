import 'package:flutter/material.dart';
import 'package:user_account_ui/service/secure_service.dart';

import 'UserPage.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _createAccount() async {
  String name = _nameController.text;
  String email = _emailController.text;
  String phone = _phoneController.text;
  String password = _passwordController.text;
  String confirmPassword = _confirmPasswordController.text;
  await SecureService.storeApiKey(name);
  await SecureService.storeApiKey(email);
  await SecureService.storeApiKey(phone);
  await SecureService.storeApiKey(password);
  await SecureService.storeApiKey(confirmPassword);
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const UserPage()),
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70, left: 10, right: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child:InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPage()),
                  );
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
               ),
              ),

              const SizedBox(height: 30,),
              const Center(
                child: Text(
                  "Let's Get Started!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
              ),
              Text(
                "Create an account to Q Allure to get all features",
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
              const SizedBox(height: 30,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      labelText: 'Name...',
                      hintText: 'Enter your name',
                      prefixIcon: const Icon(Icons.person_outline),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
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
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                ),
              ),
              const SizedBox(height:5,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      labelText: 'Phone',
                      hintText: 'Enter your phone',
                      prefixIcon: const Icon(Icons.phone_android_outlined),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
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
              const SizedBox(height: 5,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      labelText: 'confirm password...',
                      hintText: 'Enter your confirm password',
                      prefixIcon: const Icon(Icons.person_outline),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: _createAccount,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 55),
                  primary: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "CREATE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have account?", style: TextStyle(color: Colors.black),),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserPage()),
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
                      "Login here",
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
