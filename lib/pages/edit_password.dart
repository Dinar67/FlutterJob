import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseAuth/users_service.dart';
import 'package:toast/toast.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    TextEditingController surnameController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController patronymicController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    AuthService _authService = AuthService();
    bool visibility = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Смена пароля'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: OutlinedButton(
                    onPressed: () async {
                      await _authService.editPassword(emailController.text);
                      Toast.show("Сообщение отправлено на почту");
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    },
                    child: const Text('Отправить сообщение'),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}