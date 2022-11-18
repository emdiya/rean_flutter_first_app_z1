import 'package:first_app/screen/learn_flutter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svg/menu_icon.svg',
            height: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/notification_icon.svg',
              height: 25,
            ),
          ),
        ],
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.brown,
        title: const Center(
            child: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return const LearnFlutterPage();
              }),
            );
          },
          child: const Text("Learn Flutter"),
        ),
      ),
    );
  }
}
