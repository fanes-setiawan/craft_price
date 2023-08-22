import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:craft_product/core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;
  bool obscureState = true;
  bool isLoading = false; // Status loading

  visibilitySt() {
    obscureState = !obscureState;
    setState(() {});
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String? email;
  String? password;

  Future<void> doEmailLogin() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Get.offAll(NavbarView());
    } on FirebaseAuthException catch (err) {
      print("Login error: ${err.code} - ${err.message}");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> doGoogleLogin() async {
    try {
      setState(() {
        isLoading = true;
      });
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );

      try {
        await googleSignIn.disconnect();
      } catch (_) {}

      try {
        GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        var userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint("userCredential: $userCredential");
        //TODO: on login success
        //------------------
        final user = userCredential.user;
        final String? name = user?.displayName;
        final String? email = user?.email;
        final String? id = user?.uid;

        final FirebaseFirestore db = FirebaseFirestore.instance;
        try {
          await db.collection('users').doc(id).set({
            'name': name,
            'email': email,
            'photo': user?.photoURL,
            'id': id,
          });
        } on Exception catch (err) {
          print(err);
        }
        Get.offAll(NavbarView());
      } catch (err) {
        print("Google login error: $err");
        // TODO: Handle Google login error, show error message to the user
      }
    } on Exception catch (err) {
      print("Google login error: $err");
      // TODO: Handle Google login error, show error message to the user
    } finally {
      setState(() {
        isLoading =
            false; // Set status loading menjadi false setelah login selesai
      });
    }
  }
}
