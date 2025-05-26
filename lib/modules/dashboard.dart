import 'package:flutter/material.dart';
import 'package:sunday/utils/app_color.dart';

import '../utils/app_font_family.dart';
import 'account/my_account.dart';
import 'trips/all_trips.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // const Center(child: Text("Search Screen")),
    // CustomizeScreen(),
    AllTrips(),
    MyAccount(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavItem(Widget icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 0),
            height: 2,
            width: 101,
            decoration: BoxDecoration(
              color:
                  _selectedIndex == index ? AppColors.pink : Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(1),
                topRight: Radius.circular(1),
              ),
            ),
          ),
          const SizedBox(height: 8),
          icon,
          const SizedBox(height: 5),
        ],
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory, // optional, to remove ripple
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.pink,
          unselectedItemColor: AppColors.blueLight,
          selectedLabelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: AppFontFamily.Regular,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: AppFontFamily.Regular,
          ),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: [
            /*  _buildNavItem(
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? AppColors.pink : AppColors.blueLight,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                "assets/images/inspire.png",
                width: 18,
                height: 15,
              ),
            ),
            'Inspire',
            0,
          ),
          _buildNavItem(
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? AppColors.pink : AppColors.blueLight,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                "assets/images/customize.png",
                width: 18,
                height: 15,
              ),
            ),
            'Customize',
            1,
          ),*/
            _buildNavItem(
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0 ? AppColors.pink : AppColors.blueLight,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  "assets/images/Frame.png",
                  width: 28,
                  height: 28,
                ),
              ),
              'Trips',
              0,
            ),
            _buildNavItem(
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ? AppColors.pink : AppColors.blueLight,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  "assets/images/account.png",
                  width: 23,
                  height: 23,
                ),
              ),
              'My Account',
              1,
            ),
          ],
        ),
      ),
    );
  }
}
