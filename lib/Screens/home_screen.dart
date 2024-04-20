
import 'package:flutter/material.dart';
import 'package:talent_bridge/CandidateScreen/candidate_screen.dart';
import 'package:talent_bridge/PostScreen/feed_screen.dart';

import '../PostScreen/create_post_screen.dart';
import 'job_listing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;

  switchPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  final List<Widget> _pages = [
    const FeedScreen(),
    const CandidatesScreen(),
    const JobListingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talent Bridge'),
        elevation: 5,
      ),
      body: _pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: switchPage,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.brown,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Candidates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreatePostScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}