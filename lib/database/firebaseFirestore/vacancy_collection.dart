import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class VacancyCollection{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addVacancy(
    String post, 
    String description,
    String salary,
    String workSchedule,
    String nameCompany,
  )async {
    final uid = FirebaseAuth.instance.currentUser!.uid.toString();
      final DateTime now = DateTime.now();
      final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      final String formatted = dateFormat.format(now);
    
      await _firebaseFirestore.collection("vacancy").add({
       'uid' : uid,
       'post' : post,
        'description': description,
        'sallary': salary,
        'workSchedule' : workSchedule,
        'nameCompany' : nameCompany,
      });
  }

  Future<void> editVacancy(
    dynamic docs, 
    String post,
    String description,
    String salary,
    String workSchedule,
  ) async {
      await _firebaseFirestore.collection("vacancy")
      .doc(docs.position)
      .delete();

    }
  }