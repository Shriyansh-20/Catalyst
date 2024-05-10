import 'package:flutter/material.dart';

class Strings {
  static String appTitle = "Catalyst";
  static String login = "Login";
  static String alreadyHaveAnAccount = 'Already have an account? Login';
  static String createAnAccount = 'Create Account';
  static String register = 'Register';
}

class CommonWidget {
  static Widget textFieldWidget({
    required String label,
    required bool isPassword,
    required TextEditingController textEditingController,
    required IconData suffixIcon,
    Function(String)? onChanged,
    Key? key,
    Widget? suffix,
    required TextInputType textInputType,
  }) {
    return TextField(
      key: key,
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffix: suffix,
        focusColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        suffixIcon: Icon(suffixIcon),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        label: Text(
          label,
        ),
      ),
    );
  }
}
