
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void>createUserAuth({required String email,required String password})async{
    emit(SignUPLoading());
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseAuth.instance.currentUser!.sendEmailVerification();

      emit(SignUPSccuess());
    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
       emit(SignUPFailure(err: "The password provided is too weak."));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit( SignUPFailure(err: "The account already exists for that email."));
        print('The account already exists for that email.');
      }

    }
  }

  Future<void> loginUser({required String email,required String password}) async {
    emit(AuthLoading());
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(AuthSccuess());
    } on FirebaseAuthException catch (ex) {
      emit(const AuthFailure(err: "Please Check your email & password"));
      if (ex.code == 'user-not-found') {
        emit( const AuthFailure(err: "user not found"));
      } else if (ex.code == 'wrong-password') {
        emit(const AuthFailure(err:"Wrong password"));
      }
    }
      catch(e){
      emit(const AuthFailure(err: "something wrong"));
      print("============================$e====================");
    }
  }
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    emit(GoogleLoading());
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      emit(const GoogleFailure("SomeThing Wrong"));
      return;
    }
    else{
      emit(GoogleSccuess());
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
  Future<void> addUser({required String name,required String email,}) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'full_name': name, // John Doe
      'email': email, // Stokes and Sons

    });
  }
}
