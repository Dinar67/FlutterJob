// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseAuth/users_service.dart';
import 'package:flutter_job/pages/bottom/profile.dart';
import 'package:flutter_job/pages/bottom/responses.dart';
import 'package:flutter_job/pages/bottom/vacancy.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  String? title = "Вакансии";
  int index = 0;
  bool search = false;
  final pages = [
    const VacancyPage(),
    const ResponsesPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    AppBar appBarSearch = AppBar(
      title: const TextField(
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          // border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: 'Поиск...',
          hintStyle: TextStyle(
            color: Colors.white38,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              search = false;
            });
          },
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        ),
      ],
    );
    AppBar appBar = AppBar(
      title: Text(title!),
      leading: IconButton(
        icon: const Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
        onPressed: () async {
          await authService.logOut();
          Navigator.popAndPushNamed(context, '/');
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              search = true;
            });
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        )
      ],
    );
    return Scaffold(
      floatingActionButton: index == 2
          ? FloatingActionButton(
              onPressed: () =>
                  Navigator.popAndPushNamed(context, '/add_resumes'),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
      appBar: search ? appBarSearch : appBar,
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            if (index == 0) {
              title = "Вакансии";
            }
            if (index == 1) {
              title = 'Отклики';
            }
            if (index == 2) {
              title = 'Профиль';
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Вакансии'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Отклики'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Профиль'),
        ],
      ),
    );
  }
}
