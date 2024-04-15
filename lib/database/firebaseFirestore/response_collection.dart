
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ResponseCollection{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void>addResponses(dynamic docs)async{
    try{
      final String uid = FirebaseAuth.instance.currentUser!.uid.toString();

      await _firebaseFirestore.collection('responses').add({
        'uid':uid,
        
      });
    }
    catch(e){
      return;
    }
  }
}
