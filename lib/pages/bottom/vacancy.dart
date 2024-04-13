import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {

  Widget vacanciesCard(BuildContext context, dynamic docs){
    return ListView(
      children: [
        Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  "Описание" + docs['description'],
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
                    "тут должен быть date => " + docs['workSchedule'],
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                  await responsesCollection.addResponses(docs);
                  Toast.show('Откликнулся!');},
                    child: const Text(
                      "Откликнуться",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
