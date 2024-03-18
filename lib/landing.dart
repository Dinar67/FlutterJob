import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseAuth/user.dart';
import 'package:flutter_job/pages/auth.dart';
import 'package:flutter_job/pages/home.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? userModel = Provider.of<UserModel?>(context);
    final bool check = userModel != null;
    return check ? const HomePage() : const AuthPage();
  }
}
