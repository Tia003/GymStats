import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymstats/globalStyle.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
        print(_user?.uid ?? '???');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_user?.photoURL ?? ''),
          ),
          Text(_user?.email ?? '???'),
          Text(_user?.uid ?? '???'),
          MaterialButton(
            color: AppColors.titlePage,
            textColor: AppColors.whiteText,
            child: const Text('Disconnetti'),
            onPressed: () async {
              // Effettua il logout e attendi il completamento
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
