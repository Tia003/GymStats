import 'package:flutter/material.dart';
import 'package:gymstats/globalStyle.dart';
import 'package:gymstats/pages/account.dart';
import 'package:gymstats/pages/workout.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBar();
}

class _bottomNavigationBar extends State<bottomNavigationBar> {
  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    Workout(),
    Text(
      'Dashboard2',
      style: TextStyle(color: Colors.deepOrangeAccent[400], fontSize: 40),
    ),
    Account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.titlePage,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 30,
        enableFeedback: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex != 0
                ? Image.asset(
                    'assets/icon/iconAllenamenti.png', // Assicurati che il percorso sia corretto
                    width: 30,
                    height: 30,
                  )
                : Image.asset(
                    'assets/icon/iconAllenamentiWhite.png', // Assicurati che il percorso sia corretto
                    width: 30,
                    height: 30,
                  ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex != 2
                ? Image.asset(
                    'assets/icon/iconProgressi.png', // Assicurati che il percorso sia corretto
                    width: 30,
                    height: 30,
                  )
                : Image.asset(
                    'assets/icon/iconProgressiWhite.png', // Assicurati che il percorso sia corretto
                    width: 30,
                    height: 30,
                  ),
            label: '',
          ),
        ],
      ),
    );
  }
}
