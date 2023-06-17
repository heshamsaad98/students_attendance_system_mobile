import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/student_attendance.dart';
import '../../shared/components/custom_awesome_dialog.dart';
import '../../shared/components/custom_elevated_button.dart';
import '../../shared/components/custom_material_button.dart';
import '../../shared/components/custom_text_form.dart';
import '../../shared/components/navigate_to.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/login.png',
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          CustomTextForm(
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your username';
                              }
                              return null;
                            },
                            controller: usernameController,
                            textInputAction: TextInputAction.next,
                            type: TextInputType.text,
                            prefix: Icons.email,
                            hintText: 'username',
                          ),
                          const SizedBox(height: 15),
                          CustomTextForm(
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'password must not be empty';
                              }
                              return null;
                            },
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            type: TextInputType.visiblePassword,
                            prefix: Icons.vpn_key,
                            suffix: AppCubit.get(context).suffix,
                            isPassword: AppCubit.get(context).isPassword,
                            suffixPressed: () {
                              AppCubit.get(context).changePasswordVisibility();
                            },
                            hintText: 'password',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomMaterialButton(
                      function: () {
                        customAwesomeDialog(
                          context: context,
                          title: 'Warning',
                          desc: 'Please see the administration for assistance.',
                          showCloseIcon: true,
                        );
                      },
                      text: 'Forgot Password?',
                    ),
                    const SizedBox(height: 25),
                    CustomElevatedButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          navigateTo(
                            context,
                            const StudentAttendance(),
                          );
                        }
                      },
                      text: 'Sign In',
                      isUpperCase: false,
                    ),
                    const SizedBox(
                      height: 180.0,
                    ),
                    const Center(
                      child: Text(
                        'By: SAS team',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
