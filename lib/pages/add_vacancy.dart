
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseFirestore/vacancy_collection.dart';
import 'package:flutter_job/pages/bottom/profile.dart';
import 'package:toast/toast.dart';

class AddVacancyPage extends StatefulWidget {
  const AddVacancyPage({super.key});
  @override
  State<AddVacancyPage> createState() => _AddVacancyPageState();
}

class _AddVacancyPageState extends State<AddVacancyPage> {
  TextEditingController positionController = TextEditingController();
  TextEditingController sallaryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController grafficController = TextEditingController();
  TextEditingController nameCompanyController = TextEditingController();
  VacancyCollection resumeCollection = VacancyCollection();

  dynamic vacancyDoc;
  
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/home'),
          icon: const Icon(
            Icons.arrow_left,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Добавление/Изменение вакансий',
          textScaler: TextScaler.linear(1.2),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: positionController,
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
                  labelText: 'Должность',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'Должность',
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
                controller: sallaryController,
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
                  labelText: 'Заработная плата',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'Заработная плата',
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
                controller: descriptionController,
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
                  labelText: 'Описание:',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'Описание:',
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
                controller: grafficController,
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
                  labelText: 'График работы:',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'График работы:',
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
                controller: nameCompanyController,
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
                  labelText: 'Название организации:',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'Название организации:',
                  hintStyle: const TextStyle(color: Colors.white38),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            /////Доделать добавление в Firebase
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () async {
                  if(nameCompanyController.text.isEmpty || sallaryController.text.isEmpty 
                  || positionController.text.isEmpty || descriptionController.text.isEmpty 
                  || grafficController.text.isEmpty){
                    Toast.show("Заполните все поля!");
                  }
                  else{
                    await VacancyCollection().addVacancy(positionController.text,
                     descriptionController.text, sallaryController.text, grafficController.text, 
                     nameCompanyController.text);
                     Toast.show("Вакансия успешно добавлена!");
                    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                  }
                },
                child: 
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Добавить"),
                    SizedBox(width: 10),
                    Icon(Icons.add)
                  ],
                 )
                ),
              ),
          ],
        ),
      ),
    );
  }
}