import 'package:wasq/features/auth/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/ui/navigation_screen.dart';
import '../data/providers/auth_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return ref.watch(authNotifierProvider.select((value) => value.isLogin)) ==
              true
          ? const NavigationScreen()
          : const LoginScreen();
    });
  }
}
