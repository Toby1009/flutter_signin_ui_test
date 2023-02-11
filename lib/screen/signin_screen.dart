import 'package:flutter/gestures.dart'; //手勢的包
import 'package:flutter/material.dart'; //material的包

import 'package:fluttertoast/fluttertoast.dart'; //吐司的包

//引入客製化widget
import 'package:flutter_signin_ui_test/widget/toast_widget.dart';
import 'package:flutter_signin_ui_test/widget/button_widget.dart';
import 'package:flutter_signin_ui_test/widget/textfield_widget.dart';

//statfulWidget 代表有狀態的widget
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //有controller 才能監控文字
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //手勢
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

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
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  _isOk() {
    fToast.showToast(
      child: const ToastWidget(
          text: "Sign In Success",
          color: Colors.greenAccent,
          icon: Icons.check),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  _notOk() {
    fToast.showToast(
      child: const ToastWidget(
          text: "Email or Password is Empty",
          color: Colors.redAccent,
          icon: Icons.error),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  bool infIsOk() {
    // 用.text 獲取輸入的字串
    final String email = emailController.text;
    final String passwd = passwordController.text;
    //email或password都不能為空
    if (email.isEmpty || passwd.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final heigh = screenSize.height;

    return Scaffold(
      //防止超出大小
      body: SafeArea(
        child: Container(
          //寬度最大
          width: double.maxFinite,
          //高度最大
          height: double.maxFinite,
          //內距
          padding: EdgeInsets.only(left: width / 20, right: width / 20),
          //水平widgets
          child: Column(
            //主軸
            mainAxisAlignment: MainAxisAlignment.center,
            //副軸
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //裝圖片
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/apple.png'),
                )),
              ),
              //留空裝置高度/14
              SizedBox(
                height: heigh / 14,
              ),
              const Text(
                'Hello World',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'We are very missing you',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: heigh / 20,
              ),
              TextFieldWidget(
                textEditingController: emailController,
                hintText: "Email",
                iconData: Icons.person,
              ),
              SizedBox(
                height: heigh / 90,
              ),
              TextFieldWidget(
                textEditingController: passwordController,
                hintText: "Password",
                obscureText: true,
                iconData: Icons.key,
              ),
              SizedBox(
                height: heigh / 90,
              ),
              //登入按鈕
              InkWell(
                onTap: (){
                  if (infIsOk()) {
                    _isOk();
                  } else {
                    _notOk();
                  }
                },
                  child: const ButtonWidget(text: "Sign In")
              ),
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
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Register now",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
