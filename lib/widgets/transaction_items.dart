import 'package:first_app/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      // color: Colors.blue,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          GlassmorphicContainer(
            height: 50,
            width: 50,
            borderRadius: 50,
            blur: 15,
            alignment: Alignment.center,
            border: 1,
            linearGradient: LinearGradient(colors: [
              Colors.white.withOpacity(0.2),
              Colors.white38.withOpacity(0.2)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderGradient: LinearGradient(colors: [
              Colors.white24.withOpacity(0.2),
              Colors.white70.withOpacity(0.2)
            ]),
            child: Center(
              child: SvgPicture.asset(
                'assets/icon/${transaction.logo}.svg',
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
          ),
          const Text('Test'),
        ],
      ),
    );
  }
}
