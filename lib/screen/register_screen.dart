import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_signin_ui_test/auth/form_submission_status.dart';
import 'package:flutter_signin_ui_test/auth/models/user_model.dart';
import 'package:flutter_signin_ui_test/auth/register/register_cubit.dart';
import 'package:flutter_signin_ui_test/widget/textField_widget.dart';
import 'package:flutter_signin_ui_test/widget/textFormfield_widget.dart';
import 'package:flutter_signin_ui_test/widget/toast_widget.dart';

import '../auth/auth_repositories/repository.dart';
import '../routes/routes.dart';
import '../widget/button_widget.dart';

import 'package:fluttertoast/fluttertoast.dart'; //吐司的包

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late FToast fToast;

  @override
  initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  //關掉
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  registerSuccess() {
    Navigator.pushNamed(context, Routes.signInScreen);
  }

  registerFailed() {
    fToast.showToast(
      child: const ToastWidget(
          text: "Register Failed", color: Colors.red, icon: Icons.error),
      gravity: ToastGravity.BOTTOM,
      fadeDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final formKey = GlobalKey<FormState>();

    final size = MediaQuery
        .of(context)
        .size;
    final height = size.height;
    final width = size.width;

    Widget mainHeadline() {
      return const Text(
        'Register',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    Widget nameField() {
      return BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return TextFieldWidget(
            textEditingController: nameController,
            hintText: 'name',
            iconData: Icons.accessibility,
            onChanged: (name) =>
                context.read<RegisterCubit>().onNameChange(name),
          );
        },
      );
    }

    Widget emailField() {
      return BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return TextFieldWidget(
            textEditingController: emailController,
            hintText: 'email',
            iconData: Icons.person,
            onChanged: (email) =>
                context.read<RegisterCubit>().onEmailChange(email),
          );
        },
      );
    }

    Widget passwordField() {
      return BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return TextFieldWidget(
            textEditingController: passwordController,
            hintText: 'password',
            obscureText: true,
            iconData: Icons.password,
            onChanged: (password) =>
                context.read<RegisterCubit>().onPasswordChange(password),
          );
        },
      );
    }

    Widget confirmButton() {
      return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          // if (state.formStatus is SubmittionSuccess) {
          //   registerSuccess();
          // } else {
          //  // registerFailed();
          // }
        },
        builder: (context, state) {
          return InkWell(
              onTap: () {
                  context.read<RegisterCubit>().registerFormSubmitted(UserModel(
                    id: null,
                    name: state.name,
                    email: state.email,
                    password: state.password,
                  ));

              },
              child: const ButtonWidget(text: "Confirm Now"));
        },
      );
    }
    Widget gogo(){
      return InkWell(
        onTap: (){
          Navigator.pushNamed(context, Routes.signInScreen);
        },
          child: ButtonWidget(text: "gogo"));
    }

    Widget registerForm() {
      return BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: SafeArea(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            //內距
            padding: EdgeInsets.only(left: width / 20, right: width / 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mainHeadline(),
                SizedBox(
                  height: height / 10,
                ),
                nameField(),
                SizedBox(
                  height: height / 90,
                ),
                emailField(),
                SizedBox(
                  height: height / 90,
                ),
                passwordField(),
                SizedBox(
                  height: height / 90,
                ),
                confirmButton(),
                SizedBox(
                  height: height / 90,
                ),
                gogo(),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: BlocProvider<RegisterCubit>(
        create: (_) => RegisterCubit(context.read<AuthRepository>()),
        child: registerForm(),
      ),
    );
  }
}
