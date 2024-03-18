import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseFirestore/resume_collection.dart';
import 'package:flutter_job/pages/bottom/profile.dart';
import 'package:toast/toast.dart';

class AddResumesPage extends StatefulWidget {
  const AddResumesPage({super.key});

  @override
  State<AddResumesPage> createState() => _AddResumesPageState();
}

class _AddResumesPageState extends State<AddResumesPage> {
  TextEditingController positionController = TextEditingController();
  TextEditingController sallaryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final String userId = FirebaseAuth.instance.currentUser!.uid.toString();
  dynamic userDoc;
  ResumeCollection resumeCollection = ResumeCollection();
  dynamic resumeDoc;

  getUserById() async {
    final DocumentSnapshot documentSnapshot = await colRef.doc(userId).get();
    setState(() {
      userDoc = documentSnapshot;
    });
  }

  @override
  void initState() {
    
    getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    resumeDoc = ModalRoute.of(context)?.settings.arguments as dynamic;
    positionController.text = resumeDoc['position'];
    sallaryController.text = resumeDoc['sallary'];
    descriptionController.text = resumeDoc['description'];
    ToastContext().init(context);


    Future<void> addResumes() async {
                  if (sallaryController.text.isEmpty ||
                      descriptionController.text.isEmpty ||
                      positionController.text.isEmpty) {
                    Toast.show('Заполните поля');
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                    await resumeCollection.addResumeProfile(
                        positionController.text,
                        sallaryController.text,
                        descriptionController.text,
                        userDoc);
                        Navigator.pop(context);
                        Toast.show('Добавлено успешно');
                        Navigator.popAndPushNamed(context, '/home');
                  }
    }
    Future<void> editResumes() async {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ));
      await resumeCollection.editResumeProfile(positionController.text,
       sallaryController.text,
      descriptionController.text,
       resumeDoc);
       Navigator.pop(context);
       Toast.show('Изменено успешно');
       Navigator.popAndPushNamed(context, '/home');
       return;
    }
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
          'Добавление/Изменение резюме',
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
                  labelText: 'Обо мне:',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'Обо мне:',
                  hintStyle: const TextStyle(color: Colors.white38),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            /////Доделать добавление в Firebase
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () async {
                  if(resumeDoc == null){
                    addResumes();
                  }
                  else{
                    editResumes();
                  }

                },
                child: resumeDoc == null?
                 const Text('Добавить'):
                 const Text('Изменить'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
