import 'package:driftbottlediary/components/snackbars.dart';
import 'package:driftbottlediary/shared_module/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared_module/auth_service.dart';

class LoginController extends GetxController {
  final FirebaseAuthService authService = Get.find<FirebaseAuthService>();
  final RxBool isLoading = false.obs;
  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      await authService.signInWithEmailAndPassword(email, password);
      Get.back();
    } catch (e) {
      if (e is PasswordExceptions) {
        CustomSnackBar(Get.context!, Text('PasswordExceptions'));
      } else if (e is InvalidEmailException) {
        CustomSnackBar(Get.context!, Text('InvalidEmailException'));
      } else if (e is UserNotFoundException) {
        CustomSnackBar(Get.context!, Text('UserNotFoundException'));
      } else {
        print('signIn error: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      isLoading.value = true;
      if (name.isEmpty) {
        CustomSnackBar(Get.context!, Text('請輸入名稱'));
        return;
      }
      if (password != confirmPassword) {
        CustomSnackBar(Get.context!, Text('密碼不一致'));
        return;
      }

      await authService.signUpWithEmailAndPassword(email, password);
      await authService.updateUserName(name);
      String? userId = authService.user.value?.uid;
      await FirebaseRepository.instance.addNewUser(userId, name);
      //成功進入首頁
      Get.back();
    } catch (e) {
      if (e is WeakPasswordException) {
        CustomSnackBar(Get.context!, Text('WeakPasswordException'));
      } else if (e is EmailAlreadyInUseException) {
        CustomSnackBar(Get.context!, Text('EmailAlreadyInUseException'));
      } else {
        print('signUp error: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
