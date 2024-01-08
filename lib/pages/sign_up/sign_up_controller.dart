import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaning_app_bloc/common/routes/names.dart';
import 'package:uleaning_app_bloc/common/values/constant.dart';
import 'package:uleaning_app_bloc/common/widgets/flutter_toast.dart';
import 'package:uleaning_app_bloc/pages/sign_up/bloc/sign_up_blocs.dart';

class SignUpController{
  final BuildContext context;
  const SignUpController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<SignUpBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if(userName.isEmpty){
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if(email.isEmpty){
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if(rePassword.isEmpty){
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }
    if(rePassword != password){
      toastInfo(msg: "Your password and password confirmation is not match");
      return;
    }

    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user != null){
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(msg: "An email has been send to your registered email. To activate is please check your email box and click on the link");
        await credential.user?.sendEmailVerification();
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
      }
    }
    on FirebaseAuthException catch(e){
      if(e.code == "weak-password"){
        toastInfo(msg: "The password provided is too weak");
      }
      if(e.code == "email-already-in-use"){
        toastInfo(msg: "The email already exists an account with the given email address");
      }
      if(e.code == "invalid-email"){
        toastInfo(msg: "The email address is invalid");
      }
      if(e.code == "operation-not-allowed"){
        toastInfo(msg: "Email/password accounts are not enabled");
      }
    }
  }
}