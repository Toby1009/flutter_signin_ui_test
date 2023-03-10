//pub
import 'package:flutter/material.dart'; //material的包
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_ui_test/auth/auth_repositories/repository.dart';
import 'package:flutter_signin_ui_test/auth/form_submission_status.dart';
import 'package:flutter_signin_ui_test/auth/signin/sign_in_cubit.dart';

import 'package:fluttertoast/fluttertoast.dart'; //吐司的包

//引入客製化widget
import 'package:flutter_signin_ui_test/widget/toast_widget.dart';
import 'package:flutter_signin_ui_test/widget/button_widget.dart';
import 'package:flutter_signin_ui_test/widget/textFormfield_widget.dart';

//routes

import '../auth/signin/sign_in_bloc.dart';
import '../routes/routes.dart';

//statefulWidget 代表有狀態的widget
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //有controller 才能監控文字
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //flutter toast
  late FToast fToast;

  //flutter toast 初始化
  @override
  void initState() {
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

  signInSuccess() {
    fToast.showToast(
      child: const ToastWidget(
          text: "Sign In Success",
          color: Colors.greenAccent,
          icon: Icons.check),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
    Navigator.pushNamed(context, Routes.loadingScreen);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final heigh = screenSize.height;

    final formKey = GlobalKey<FormState>();

    Widget mainHeadline() {
      return const Text(
        'Hello World',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    Widget subHeadline() {
      return const Text(
        'We are very missing you',
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
      );
    }

    Widget imageWidget() {
      return Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/apple.png'),
        )),
      );
    }

    Widget emailField() {
      return BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          return TextFormFieldWidget(
            textEditingController: emailController,
            hintText: "Email",
            iconData: Icons.person,
            validator: (email) =>
                state.isValidEmail ? null : 'email is too short',
            onChanged: (email) =>
                context.read<SignInCubit>().onEmailChange(email),
          );
        },
      );
    }

    Widget passwordField() {
      return BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          return TextFormFieldWidget(
            textEditingController: passwordController,
            hintText: "Password",
            obscureText: true,
            iconData: Icons.key,
            validator: (password) =>
                state.isValidPassword ? null : 'password is too short',
            onChanged: (password) =>
                context.read<SignInCubit>().onPasswordChange(password),
          );
        },
      );
    }

    Widget signInButton() {
      return BlocConsumer<SignInCubit, SignInState>(listener: (context, state) {
        if (state.formStatus is SubmittionSuccess) {
          signInSuccess();
        } else if (state.formStatus is SubmittionFailed) {}
      }, builder: (context, state) {
        return InkWell(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                await context.read<SignInCubit>().onSubmitted();
              }
            },
            child: const ButtonWidget(text: "Sign In"));
      });
    }

    Widget registerButton() {
      return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.registerScreen);
        },
        child: const Text(
          "Register now",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      );
    }

    Widget signInForm() {
      return Form(
        key: formKey,
        child: SafeArea(
          child: Container(
            //寬度最大
            width: double.maxFinite,
            //高度最大
            height: double.maxFinite,
            //內距
            padding: EdgeInsets.only(left: width / 20, right: width / 20),
            //垂直widgets
            child: Column(
              //主軸
              mainAxisAlignment: MainAxisAlignment.center,
              //副軸
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //裝圖片
                imageWidget(),
                //留空裝置高度/14
                SizedBox(
                  height: heigh / 14,
                ),
                mainHeadline(),
                subHeadline(),
                SizedBox(
                  height: heigh / 20,
                ),
                emailField(),
                SizedBox(
                  height: heigh / 90,
                ),
                passwordField(),
                SizedBox(
                  height: heigh / 90,
                ),
                //登入按鈕
                signInButton(),
                SizedBox(
                  height: heigh / 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a member?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    registerButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      //防止超出大小
      body: BlocProvider(
        create: (context) => SignInCubit(
          context.read<AuthRepository>(),
        ),
        child: signInForm(),
      ),
    );
  }
}
