// auth repo - handles the possible methods in auth features!
// promt - write a methodshere like loginWithEmailPass, registerWithEmailPass , logout , getcurrentUser


import 'package:deep_vid/features/auth/domain/entities/app_user.dart';
import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPass(
       String email,  String password, BuildContext context);
  Future<AppUser?> registerWithEmailPass(
       String email,  String password, String name);
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}
