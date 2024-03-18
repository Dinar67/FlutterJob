// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseAuth/users_service.dart';
import 'package:toast/toast.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool visibility = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/mountains.jpg'),
              radius: MediaQuery.of(context).size.height * 0.15,
            ),
            // Image.asset(
            //   'images/icon.png',
            //   height: MediaQuery.of(context).size.height * 0.15,
            //   width: MediaQuery.of(context).size.width * 0.32,
            //   fit: BoxFit.cover,
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white70,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Colors.white38),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: passController,
                obscureText: !visibility,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: !visibility
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.white70,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.white70,
                          ),
                  ),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.white70,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelText: 'Пароль',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'Пароль',
                  hintStyle: const TextStyle(color: Colors.white38),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.5,
              child: OutlinedButton(
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passController.text.isEmpty) {
                    Toast.show('Зполните все поля!');
                  } else {
                    var user = await authService.signIn(
                        emailController.text, passController.text);
                    if (user == null) {
                      Toast.show("Неправильный Email/Пароль!");
                    } else {
                      Navigator.popAndPushNamed(context, '/');
                      Toast.show("Вы вошли!");
                    }
                  }
                },
                child: const Text('Войти'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
              child: const Text(
                'Нет аккаунта? Зарегистрируйтесь!',
                style: TextStyle(color: Colors.white54),
              ),
              onTap: () => Navigator.popAndPushNamed(context, '/reg'),
            ),
          ],
        ),
      ),
    );
  }
}
