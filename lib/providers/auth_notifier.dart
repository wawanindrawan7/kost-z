
import 'package:flutter/material.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/domain/entities/user.dart';
import 'package:kost_z/domain/usecases/sign_in_user.dart';
import 'package:kost_z/domain/usecases/sign_up_user.dart';
import 'package:logger/logger.dart';

class AuthNotifer extends ChangeNotifier {
  late Users? _usersSignIn;
  Users? get usersSignIn => _usersSignIn;

  late Users? _usersSignUp;
  Users? get usersSignUp => _usersSignUp;

  RequestState? _userSignInState = RequestState.Empty;
  RequestState? get userSignInState => _userSignInState;

  RequestState? _userSignUpState = RequestState.Empty;
  RequestState? get userSignUpState => _userSignUpState;

  String? _msg = "";

  Logger _logger = Logger();

  String? get msg => _msg;

  final SignInUser signInUser;
  final SignUpUser signUpUser;

  AuthNotifer({
    required this.signInUser,
    required this.signUpUser,
  });

  Future<bool> logInUsers(String email, String password) async {
    _userSignInState = RequestState.Loading;
    notifyListeners();

    final result = await signInUser.execute(email, password);

    result.fold((l) {
      _userSignInState = RequestState.Error;
      _msg = l.message;
      notifyListeners();
    }, (r) {
      _userSignInState = RequestState.HasData;
      _usersSignIn = r;
      _msg = "";
      notifyListeners();
    });

    if (_msg == "") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> registerUser(Users user, password) async {
    _userSignUpState = RequestState.Loading;
    notifyListeners();

    final result = await signUpUser.execute(user, password);

    result.fold((l) {
      _userSignUpState = RequestState.Error;
      _msg = l.message;
      notifyListeners();
    }, (r) {
      _userSignUpState = RequestState.HasData;
      _usersSignUp = r;
      _msg = "";
      notifyListeners();
    });

    if (_msg == "") {
      return true;
    } else {
      return false;
    }
  }
}
