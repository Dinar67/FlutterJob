import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseFirestore/response_collection.dart';
import 'package:toast/toast.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
  
}

class _VacancyPageState extends State<VacancyPage> {
  
  ResponseCollection responseCollection = ResponseCollection();
  Widget vacanciesCard(BuildContext context, dynamic docs){
    ToastContext().init(context);
        return Card(
          child: Column(
            children: [
              Row(
                
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                  Container(width: MediaQuery.of(context).size.width * 0.04,),
                  Text(
                  
                   docs['post'],
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  Text(
                    docs['sallary'],
                    style: TextStyle(color: Colors.white),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Описание: " + docs['description'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Грфик работы" + docs['workSchedule'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(
                    "24.10.2005" + docs['workSchedule'],
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                    await responseCollection.addResponses(docs);
                    Toast.show('Откликнулся!');
                  },
                    child: const Text(
                      "Откликнуться",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseFirestore.instance.collection('vacancy').snapshots(),
     builder: (context, snapshot){
      if(!snapshot.hasData){
        return const Center(
          child: CircularProgressIndicator(color: Colors.white,),
        );
      }else{
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index){
            return vacanciesCard(context, snapshot.data!.docs[index]);
          });
      }
     });
    
    
  }
}
