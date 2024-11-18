import 'package:flutter/material.dart';
import 'home_page.dart';
import 'history_page.dart';
import 'profil_page.dart';

void main() {
  runApp(OVOApp());
}

class OVOApp extends StatefulWidget {
  @override
  _OVOAppState createState() => _OVOAppState();
}

class _OVOAppState extends State<OVOApp> {
  int _selectedIndex = 0; // Menyimpan index tab yang dipilih

  final List<Widget> _pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        body: SingleChildScrollView(
          // Menambahkan SingleChildScrollView
          child: Column(
            children: [
              // SafeArea digunakan untuk mengatur header agar berada di area yang aman
              SafeArea(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Teks di sebelah kiri
                      Text(
                        'OVO',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[800],
                        ),
                      ),
                      // Teks Promo di sebelah kanan
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple.shade400,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(10),
                        child: Text('PROMO',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              // Bagian utama dari halaman, sesuai tab yang dipilih
              Container(
                height: MediaQuery.of(context).size.height -
                    150, // Menjaga agar body tetap berada di bawah SafeArea
                child: _pages[_selectedIndex],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
