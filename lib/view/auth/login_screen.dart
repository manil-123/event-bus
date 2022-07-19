import 'package:flutter/material.dart';
import 'package:saral_urja/config/size_config.dart';
import 'package:saral_urja/widgets/custom_text_form_field.dart';

import '../../constants/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obsecure = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final size = Ssize(context);
    return Scaffold(
      // backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: size.width,
            width: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(backgroundImage),
              ),
            ),
          ),
          _loginWidget(),
        ],
      ),
    );
  }

  Widget _loginWidget() {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.085,
      top: MediaQuery.of(context).size.height * 0.13,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 28.0),
                  child: Text(
                    appTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                _formWidget(),
                SizedBox(
                  height: 12,
                ),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            textEditingController: _emailController,
            hintText: "Username",
            suffixIcon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          CustomTextField(
            textEditingController: _passwordController,
            hintText: "Enter password",
            validate: (val) {
              return val!.isEmpty ? 'Password must not be empty' : null;
            },
            obsecure: obsecure,
            isPassword: true,
            showPassword: () {
              obsecure = !obsecure;
              setState(() {});
            },
          ),
          SizedBox(
            height: 12,
          ),
          _forgotPassword(),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return ButtonTheme(
      minWidth: 200,
      child: MaterialButton(
        onPressed: () {},
        height: 35.0,
        minWidth: 100.0,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text('Login'),
      ),
    );
  }

  Widget _forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: (bool? value) {
                setState(() {
                  rememberMe = value!;
                });
              },
            ),
            Text(rememberme),
          ],
        ),
        Text(forgotPassword),
      ],
    );
  }
}
