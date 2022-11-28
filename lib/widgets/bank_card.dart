// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:first_app/model/card_detail.dart';

import '../data/constant.dart';

class BankCard extends StatelessWidget {
  final CardDetail cardDetail;
  const BankCard({
    Key? key,
    required this.cardDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10).copyWith(bottom: kSpacingUnit * 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(cardDetail.background!),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: kSpacingUnit * 2,
              offset: const Offset(
                  1, kSpacingUnit * 0.5), // changes position of shadow
            ),
          ]),
    );
  }
}
