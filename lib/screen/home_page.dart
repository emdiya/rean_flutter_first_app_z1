import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_app/data/card_data.dart';
import 'package:first_app/data/transactions_data.dart';
import 'package:first_app/widgets/bank_card.dart';
import 'package:first_app/widgets/drawer_style.dart';
import 'package:first_app/widgets/transaction_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cardIndex = 1;
  int _scrollIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: SvgPicture.asset(
                'assets/svg/menu_icon.svg',
                height: 24,
              ),
            );
          }),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/svg/notification_icon.svg',
                  height: 24,
                ),
              ),
            ),
          ],
          elevation: 0,
          //foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          title: const Center(
              child: Text(
            "TestApp",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Cards',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Add New',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 18,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(builder: (BuildContext context) {
            //         return const LearnFlutterPage();
            //       }),
            //     );
            //   },
            //   child: const Text("Learn Flutter"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(builder: (BuildContext context) {
            //         return const TestAPI();
            //       }),
            //     );
            //   },
            //   child: const Text("Test API"),
            // ),
            Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    onPageChanged: (index, _) {
                      _scrollIndex = index;
                      setState(() {});
                    },
                    height: 220,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.75,
                    initialPage: 1,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  itemCount: cardMockData.length,
                  itemBuilder: (_, index, __) => BankCard(
                    cardDetail: cardMockData[index],
                  ),
                ),
                Positioned(
                  bottom: kSpacingUnit * 2.5,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: cardMockData
                        .asMap()
                        .entries
                        .map(
                          (card) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.symmetric(
                                horizontal: kSpacingUnit * 0.3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _scrollIndex == card.key
                                    ? kPrimaryColor
                                    : Colors.transparent,
                                border: Border.all(
                                  color: kPrimaryColor,
                                  width: 1.5,
                                )),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tansactions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                    ),
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: transactionsMockData.length,
                itemBuilder: ((context, index) =>
                    TransactionItem(transaction: transactionsMockData[index])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
