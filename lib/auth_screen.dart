import 'package:catalyst/auth_bloc.dart';
import 'package:catalyst/auth_event.dart';
import 'package:catalyst/auth_state.dart';
import 'package:catalyst/service/database.dart';
//import 'package:catalyst/login_event.dart';
import 'package:catalyst/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './service/database.dart';
import 'dart:math';
import "package:random_string/random_string.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  bool isLogin = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appTitle,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorState) {
              Fluttertoast.showToast(msg: state.errorMessage);
            }
          },
          child: Container(
            padding: MediaQuery.of(context).padding,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    isLogin ? Strings.login : Strings.register,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonWidget.textFieldWidget(
                    label: 'Email',
                    textInputType: TextInputType.emailAddress,
                    isPassword: false,
                    textEditingController: _emailController,
                    suffixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonWidget.textFieldWidget(
                    label: 'Password',
                    textInputType: TextInputType.text,
                    isPassword: true,
                    textEditingController: _passwordController,
                    suffixIcon: Icons.password,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!isLogin)
                    Column(
                      children: [
                        CommonWidget.textFieldWidget(
                          label: 'Name',
                          textInputType: TextInputType.name,
                          isPassword: false,
                          textEditingController: _nameController,
                          suffixIcon: Icons.abc,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonWidget.textFieldWidget(
                          label: 'Roll No.',
                          textInputType: TextInputType.text,
                          isPassword: false,
                          textEditingController: _rollController,
                          suffixIcon: Icons.edit,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonWidget.textFieldWidget(
                          label: 'Current Semester',
                          textInputType: TextInputType.number,
                          isPassword: false,
                          textEditingController: _semesterController,
                          suffixIcon: Icons.abc,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin
                          ? Strings.createAnAccount
                          : Strings.alreadyHaveAnAccount,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: OutlinedButton(
                      onPressed: () async {
                        if (isLogin) {
                          context.read<AuthBloc>().add(LoginEvent(
                              email: _emailController.text,
                              password: _passwordController.text));
                        } else {
                          String Id = randomAlphaNumeric(10);
                          context.read<AuthBloc>().add(RegisterEvent(
                              email: _emailController.text,
                              password: _passwordController.text));
                          Map<String, dynamic> studentInfoMap = {
                            "Email": _emailController.text,
                            "Name": _nameController.text,
                            "Roll": _rollController.text,
                            "Id": Id,
                            "semester": _semesterController.text,
                          };
                          await DatabaseMethods()
                              .addStudentDetails(studentInfoMap, Id);
                        }
                        if (!isLogin) {
                          Fluttertoast.showToast(
                              msg: "Your Account has been created",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(5),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.transparent,
                        ),
                      ),
                      child: Text(
                        isLogin ? Strings.login : Strings.register,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
