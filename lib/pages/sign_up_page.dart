import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/data/models/user_model.dart';
import 'package:kost_z/pages/home_page.dart';
import 'package:kost_z/pages/main_page.dart';
import 'package:kost_z/pages/sign_in_page.dart';
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
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController secondNameController =
      new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmationpasswordController =
      new TextEditingController();

  bool isHiddenPassword = true;
  bool isHiddenConfPassword = true;

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name (Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        // ignore: unused_local_variable
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Second Name cannot be empty");
        }
        return null;
      },
      onSaved: (value) {
        secondNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Second Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }

        //req expression for email  validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: isHiddenPassword,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password (Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: InkWell(
          onTap: _togglePasswordView,
          child: Icon(Icons.visibility),
        ),
      ),
    );

    final confirmationpasswordField = TextFormField(
      autofocus: false,
      obscureText: isHiddenConfPassword,
      controller: confirmationpasswordController,
      validator: (value) {
        if (confirmationpasswordController.text != passwordController.text) {
          return "Password don't match ";
        }
        return null;
      },
      onSaved: (value) {
        confirmationpasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: InkWell(
          onTap: _toggleConfPasswordView,
          child: Icon(Icons.visibility),
        ),
      ),
    );

    final SignUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueGrey,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            //kembali ke page login
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          width: 200,
                          child: Image.asset(
                            "images/logo_app.png",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(height: 20),
                      firstNameField,
                      SizedBox(height: 20),
                      secondNameField,
                      SizedBox(height: 20),
                      emailField,
                      SizedBox(height: 20),
                      passwordField,
                      SizedBox(height: 20),
                      confirmationpasswordField,
                      SizedBox(height: 20),
                      SignUpButton,
                      SizedBox(height: 15),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailToFirestore() async {
    //calling our firestore
    //calling our user model
    //sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.secondName = secondNameController.text;

    await firebaseFirestore
        .collection("user")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :)");

    Navigator.pushReplacementNamed(context, MainPage.routeName);
  }

  void _togglePasswordView() {
    // if (isHiddenPassword == true) {
    //   isHiddenPassword = false;
    // } else {
    //   isHiddenPassword = true;
    // }
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _toggleConfPasswordView() {
    // if (isHiddenPassword == true) {
    //   isHiddenPassword = false;
    // } else {
    //   isHiddenPassword = true;
    // }
    setState(() {
      isHiddenConfPassword = !isHiddenConfPassword;
    });
  }
}
