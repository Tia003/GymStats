import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymstats/globalStyle.dart';
import 'package:gymstats/widget/bottomNavigationBar.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _user == null ? _loginTemeplatePage() : const bottomNavigationBar(),
    );
  }

  Widget _loginTemeplatePage() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/img/logo.jpg',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 15.0),
                const Text(
                  'GymStats',
                  style: TextStyle(
                    fontSize: 40,
                    color: AppColors.titlePage,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 199, 199, 199), // Sfondo grigio medio scuro
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                  style: TextStyle(color: Colors.black), // Testo bianco
                ),
                SizedBox(height: 10.0), // Spazio tra i campi
                TextField(
                  obscureText: true, // Per mascherare la password
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 199, 199, 199), // Sfondo grigio medio scuro
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                  style: TextStyle(color: Colors.black), // Testo bianco
                ),
                SizedBox(height: 14.0),
                Container(
                  width: double
                      .infinity, // Per occupare l'intera larghezza disponibile
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: AppColors.titlePage, // Colore del bottone
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors
                        .transparent, // Assicura che il materiale sia trasparente
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30.0),
                      onTap: () {
                        // Azione da eseguire quando viene premuto il bottone
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Accedi',
                          style: TextStyle(
                            color: Colors.white, // Colore del testo
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18.0),
                const Text(
                  'Oppure',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18.0),
                _googleSignInButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _googleSignInButton() {
    return SizedBox(
      height: 50,
      child: SignInButton(
        Buttons.google,
        text: 'Accedi con Google',
        onPressed: _handleGoogleSignIn,
      ),
    );
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print('Errore: ' + error.toString());
    }
  }
}
