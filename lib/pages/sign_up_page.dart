import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/domain/entities/user.dart';
import 'package:kost_z/pages/main_page.dart';
import 'package:kost_z/pages/sign_in_page.dart';
import 'package:kost_z/providers/auth_notifier.dart';
import 'package:kost_z/widgets/custom_button.dart';
import 'package:kost_z/widgets/custom_text_from_field.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/sign_up_page';
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get\nyour comfortable kost',
          style: titleTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextFormField(
          title: 'Full Name',
          hintText: 'Your full name',
          controller: nameController,
          onChanged: (value) => nameController.text = value,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email Address',
          hintText: 'Your email address',
          controller: emailController,
          onChanged: (value) => emailController.text = value,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Your password',
          obscureText: true,
          controller: passwordController,
          onChanged: (value) => passwordController.text = value,
        );
      }

      Widget addressInput() {
        return CustomTextFormField(
          title: 'Hobby',
          hintText: 'Your hobby',
          controller: addressController,
          onChanged: (value) => addressController.text = value,
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
            nameInput(),
            emailInput(),
            passwordInput(),
            addressInput(),
            Consumer<AuthNotifer>(
              builder: (context, state, _) {
                if (state.userSignUpState == RequestState.Loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.userSignUpState == RequestState.Error) {
                  return Text(
                    state.msg!,
                    style: titleTextStyle.copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            _isLoading
                ? SizedBox()
                : CustomButton(
                    title: 'Sign Up',
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      Users user = Users(
                        email: emailController.text,
                        name: nameController.text,
                        address: addressController.text,
                      );

                      var isSignUp =
                          await Provider.of<AuthNotifer>(context, listen: false)
                              .registerUser(
                        user,
                        passwordController.text,
                      );

                      if (isSignUp) {
                        Navigator.pop(context);
                        setState(() {
                          _isLoading = false;
                        });
                      }

                      setState(() {
                        _isLoading = false;
                      });
                    },
                  ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            SignInPage.routeName,
          );
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            'Have an account? Sign In',
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
            signInButton(),
          ],
        ),
      ),
    );
  }
}
