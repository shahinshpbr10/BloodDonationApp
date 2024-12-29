import 'package:blood_donation_app/view/requestpage/bloodrequestpage.dart';
import 'package:flutter/material.dart';

import '../../common/apptextstyle.dart';
import '../donatePage/eligibilityques_page.dart';
import 'home_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    const HomePage(),
    EligibilityQuestionScreen(),
    BloodRequestForm(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', _selectedIndex == 0, 0),
            _buildNavItem(Icons.search, 'Donate', _selectedIndex == 1, 1),
            _buildNavItem(Icons.favorite_border, 'Request', _selectedIndex == 2, 2),
            _buildNavItem(Icons.person_outline, 'Profile', _selectedIndex == 3, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.purple : Colors.grey,
          ),
          Text(
            label,
            style: AppTextStyles.smallBodyText.copyWith(
              color: isSelected ? Colors.purple : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}




class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Saved Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}