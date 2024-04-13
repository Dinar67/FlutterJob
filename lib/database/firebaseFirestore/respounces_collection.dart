import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResponseCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addResponses(dynamic docsVac) async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid.toString();
      await _firebaseFirestore.collection('responsrses').add({
        'uid': uid,
        'post': docsVac['post'],
        'description': docsVac['description'],
        'salary': docsVac['salary'],
        'dataPublication': docsVac['dataPublication'],
        'workSchedule': docsVac['workSchedule'],
        'nameOrganization': docsVac['nameOrganization']
      });
    } catch (e) {
      return;
    }
  }

  Future<void> deleteResponses(dynamic docs) async {
    try {
      await _firebaseFirestore.collection('responses').doc(docs.id).delete();
    } catch (e) {
      return;
    }
  }
}
