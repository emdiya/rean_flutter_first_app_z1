// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(kSpacingUnit * 0.3)
            .copyWith(right: 15, left: 15, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/svg/visa_icon.svg',
                  fit: BoxFit.cover,
                  height: 45,
                ),
                SvgPicture.asset(
                  'assets/svg/more_icon.svg',
                  fit: BoxFit.cover,
                  height: 10,
                  //color: Colors.white,
                )
              ],
            ),
            Text(
              cardDetail.numner!,
              style: const TextStyle(
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Colors.blue,
                    spreadRadius: 1,
                    blurRadius: kSpacingUnit * 8,
                    offset: Offset(1, kSpacingUnit * 0.5), // cha
                  )
                ],
              ).copyWith(
                fontSize: 20,
              ),
            ),
            Row(
              children: <Widget>[
                BankCardField(
                  label: 'Card Holder',
                  value: cardDetail.name!,
                ),
                const Spacer(),
                BankCardField(
                  label: 'Expiry',
                  value: cardDetail.expiry!,
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BankCardField extends StatelessWidget {
  final String label;
  final String value;

  const BankCardField({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label\n',
            style: const TextStyle(color: Colors.white).copyWith(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(color: Colors.white).copyWith(
              height: 1.5,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
