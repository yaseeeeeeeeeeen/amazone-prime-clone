import 'package:amazon_prime/screens/home_screen.dart';
import 'package:amazon_prime/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    //List of widgets for btm nav bar
    HomeScreen(),
    Text(
      'No Downloads',
      style: GoogleFonts.robotoCondensed(fontSize: 25),
    ),
    SearchPage()
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/Amazon_Prime1-removebg-preview.png'))),
        ),
        actions: const [
          Icon(Icons.cast, size: 25),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
      ),
    );
  }
}
