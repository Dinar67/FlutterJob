import 'package:flutter/material.dart';

class ResponsesPage extends StatelessWidget {
  const ResponsesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
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
        ),
      ],
    );
  }
}
