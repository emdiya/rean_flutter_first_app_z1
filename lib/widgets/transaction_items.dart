import 'package:first_app/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 10,
      child: Row(
        children: [
          Container(
            child: Center(
              child: SvgPicture.asset(
                'assets/icon/${transaction.logo}.svg',
                fit: BoxFit.cover,
                height: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
