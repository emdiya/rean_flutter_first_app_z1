// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:first_app/model/card_detail.dart';

class BankCard extends StatelessWidget {
  final CardDetail cardDetail;
  const BankCard({
    Key? key,
    required this.cardDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(cardDetail.background!),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
            )
          ]),
    );
  }
}
