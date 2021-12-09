import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/pages/main_page.dart';
import 'package:kost_z/pages/sign_up_page.dart';
import 'package:kost_z/widgets/custom_button.dart';
import 'package:kost_z/widgets/custom_text_from_field.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/sign_in_page';
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Sign In with your\nexisting account',
          style: titleTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email Address',
          hintText: 'Your email address',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Your password',
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget submitButton() {
        return CustomButton(
          title: 'Sign In',
          onPressed: () {
            Navigator.pushNamed(context, MainPage.routeName);
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            24,
          ),
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            SignUpPage.routeName,
          );
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            'Don\'t have an account? Sign Up',
            style: titleTextStyle.copyWith(
              color: kGreyColor,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            title(),
            inputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
