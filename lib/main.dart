import 'package:first_app/screen/about.dart';
import 'package:first_app/screen/profile_info.dart';
import 'package:first_app/screen/scan_qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currrentPage = 0;

  final pages = [
    const HomePage(),
    const ScanQR(),
    const ScanQR(),
    const ProfileInfo(),
    const About(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currrentPage),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.lightBlue,
      //   elevation: 1,
      //   onPressed: () {
      //     debugPrint("Test FLoatingActionButton");
      //   },
      //   child: SvgPicture.asset(
      //     'assets/svg/add_icon.svg',
      //     height: 25,
      //     width: 25,
      //   ),
      // ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.amberAccent,
        backgroundColor: Colors.white,
        height: 55,
        elevation: 0,
        destinations: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/home_icon.svg',
                height: 24,
              ),
              label: '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/svg/search_icon.svg',
                  height: 24,
                ),
                label: ''),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/svg/scan_qr.svg',
                  height: 24,
                ),
                label: ''),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/svg/user_icon.svg',
                  height: 24,
                ),
                label: ''),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/svg/setting_icon.svg',
                  height: 24,
                ),
                label: ''),
          ),
        ],
        onDestinationSelected: (int indext) {
          setState(() {
            currrentPage = indext;
          });
        },
        selectedIndex: currrentPage,
      ),
    );
  }
}
