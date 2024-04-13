import 'package:flutter_job/landing.dart';
import 'package:flutter_job/pages/add_vacancy.dart';
import 'package:flutter_job/pages/auth.dart';
import 'package:flutter_job/pages/edit_password.dart';
import 'package:flutter_job/pages/home.dart';
import 'package:flutter_job/pages/profile_resumes/add_resumes.dart';
import 'package:flutter_job/pages/reg.dart';

final routes = {
  '/': (context) => const LandingPage(),
  '/auth': (context) => const AuthPage(),
  '/reg': (context) => const RegistrationPage(),
  '/home': (context) => const HomePage(),
  '/add_resumes': (context) => const AddResumesPage(),
  '/add_vacancy': (context) => const AddVacancyPage(),
  '/edit_password': (context) => const EditPasswordPage(),
};
