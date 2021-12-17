import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kost_z/data/models/user_model.dart';
import 'package:logger/logger.dart';

abstract class AuthRemotDataSource {
  Future<UsersModel> signInUser(String email, String password);
  Future<UsersModel> signUpUser(UsersModel usersModel, String password);
  Future<void> setUser(UsersModel usersModel);
  Future<UsersModel> getUserById(String id);
}

class AuthRemotDataSourceImpl implements AuthRemotDataSource {
  FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("users");

  Logger _logger = Logger();

  @override
  Future<UsersModel> signInUser(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    UsersModel user = await getUserById(userCredential.user!.uid);

    return user;
  }

  @override
  Future<UsersModel> signUpUser(UsersModel usersModel, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: usersModel.email!,
      password: password,
    );

    UsersModel user = UsersModel(
      id: userCredential.user!.uid,
      name: usersModel.name,
      email: usersModel.email,
      address: usersModel.address,
    );

    _logger.d(user.toMap());
    await setUser(user);

    return user;
  }

  @override
  Future<void> setUser(UsersModel usersModel) async {
    await _collectionReference.doc(usersModel.id).set({
      "id": usersModel.id,
      "name": usersModel.name,
      "email": usersModel.email,
      "address": usersModel.address,
    });
  }

  @override
  Future<UsersModel> getUserById(String id) async {
    DocumentSnapshot snapshot = await _collectionReference.doc(id).get();

    return UsersModel(
      id: id,
      name: snapshot["name"],
      email: snapshot["email"],
      address: snapshot["address"],
    );
  }
}
