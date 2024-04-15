import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ResponsesPage extends StatelessWidget {
  const ResponsesPage({super.key});
  Widget responsesCard(BuildContext context, dynamic docs){
    ToastContext().init(context);
    return Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Должность',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                  ),
                  const Text(
                    "50000 - 100000",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Divider(color: Colors.white),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                  "щ4кцпрщцхууууууупкуовсотчипутапджуцкапуджщцлркджарвыптлочорсрауктвгрпоува",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  const Text(
                    "Статус:",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  const Text(
                    "Отказ",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  const Text(
                    "Дата отклика:",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  const Text(
                    "19.09.2005",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseFirestore.instance.collection('responses').snapshots(),
     builder: (context, snapshot){
      if(!snapshot.hasData){
        return const Center(
          child: CircularProgressIndicator(color: Colors.white,),
        );
      }else{
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index){
            return responsesCard(context, snapshot.data!.docs[index]);
          });
      }
     });
    
    
  }
  
}
