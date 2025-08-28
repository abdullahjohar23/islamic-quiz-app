
import 'package:flutter/material.dart';
import 'package:islamic_quiz_app/pages/home_page.dart';
import 'package:islamic_quiz_app/pages/quran_page.dart';
import 'package:islamic_quiz_app/pages/contest_page.dart';
import 'package:islamic_quiz_app/pages/profile_page.dart';
import 'package:islamic_quiz_app/pages/leaderboard_page.dart';

class MainPage extends StatefulWidget {
    const MainPage({super.key});

    @override
    State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    int selectedIndex = 0; // HomePage() is in the 0th index, which means HomePage will be displayed as default
    late PageController _pageController;

    @override
    void initState() {
        super.initState();
        _pageController = PageController(initialPage: selectedIndex);
    }

    @override
    void dispose() {
        _pageController.dispose();
        super.dispose();
    }

    final List<Widget> pages = [
        HomePage(), // index 0
        QuranPage(),
        LeaderboardPage(),
        ContestPage(),
        ProfilePage(),
    ];

    final List<BottomNavigationBarItem> navItems = const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Quran'),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Leaderborad'),
        BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'Contest'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];

    void onTabTapped(int index) {
        setState(() {
            selectedIndex = index;
        });

        _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: PageView(
                controller: _pageController,
                children:
                    pages,
                    onPageChanged: (index) {
                        setState(() {
                            selectedIndex = index;
                        });
                    },
            ),

            bottomNavigationBar: BottomNavigationBar(
                items: navItems,
                currentIndex: selectedIndex,
                selectedItemColor: Color(0xFF675496),
                unselectedItemColor: Color.fromARGB(255, 206, 186, 255),
                onTap: onTabTapped,
                type: BottomNavigationBarType.fixed,
            ),
        );
    }
}
