// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseAuth/users_service.dart';
import 'package:flutter_job/database/firebaseFirestore/profile_colllection.dart';
import 'package:flutter_job/themes/colors.dart';
import 'package:toast/toast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController patronymicController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  AuthService authService = AuthService();
  ProfileCollection profileCollection = ProfileCollection();
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Регистрация",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: deepColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: surnameController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.face,
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
                    labelText: 'Фамилия',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Фамилия',
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
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.face,
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
                    labelText: 'Имя',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Имя',
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
                  controller: patronymicController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.face,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'Отчество',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Отчество',
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
                  controller: phoneController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone,
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
                    labelText: 'Телефон',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Телефон',
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
                    labelText: 'Почта',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Почта',
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
                      color: Colors.white,
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
                width: MediaQuery.of(context).size.width * 0.5,
                child: OutlinedButton(
                  onPressed: () async {
                    if (surnameController.text.isEmpty ||
                        nameController.text.isEmpty ||
                        patronymicController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passController.text.isEmpty) {
                      Toast.show("Заполните все поля!");
                    } else {
                      var user = await authService.signUp(
                          emailController.text, passController.text);
                      if (user == null) {
                        Toast.show("Проверьте правильность данных!");
                      } else {
                        await profileCollection.addProfile(
                          user.id!,
                          surnameController.text,
                          nameController.text,
                          patronymicController.text,
                          phoneController.text,
                          emailController.text,
                          passController.text,
                          ''
                        );
                        Toast.show("Вы успешно зарегистрировались!");
                        Navigator.popAndPushNamed(context, '/');
                      }
                    }
                  },
                  child: const Text('Зарегистрироваться'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child: const Text(
                  'Есть аккаунт? Войти',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => Navigator.popAndPushNamed(context, '/'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
