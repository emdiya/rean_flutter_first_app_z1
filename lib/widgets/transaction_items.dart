import 'package:first_app/data/constant.dart';
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
    return GlassmorphicContainer(
      height: 80,
      width: 400,
      borderRadius: 12,
      blur: 15,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(colors: [
        Colors.white.withOpacity(0.2),
        Colors.blue.withOpacity(0.1),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      borderGradient: LinearGradient(colors: [
        Colors.white10.withOpacity(0.9),
        Colors.white70.withOpacity(0.9),
      ]),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GlassmorphicContainer(
              height: 50,
              width: 50,
              borderRadius: 50,
              blur: 15,
              alignment: Alignment.center,
              border: 1,
              linearGradient: LinearGradient(colors: [
                Colors.blue.withOpacity(0.2),
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
            const SizedBox(
              width: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${transaction.title}\n',
                    style: const TextStyle(
                      color: Colors.blue,
                      shadows: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: kSpacingUnit * 2,
                          offset: Offset(2, kSpacingUnit * 0.2), // cha
                        )
                      ],
                    ).copyWith(
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: transaction.description,
                    style: const TextStyle(color: Colors.grey).copyWith(
                      height: 1.5,
                      fontSize: 14,
                      shadows: [
                        const BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: kSpacingUnit * 2,
                          offset: Offset(2, kSpacingUnit * 0.2), // cha
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        '${transaction.value!.isNegative ? '' : '+'}${transaction.value}\$ \n',
                    style: const TextStyle(
                      // color: Colors.red,
                      shadows: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: kSpacingUnit * 2,
                          offset: Offset(2, kSpacingUnit * 0.2), // cha
                        )
                      ],
                    ).copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: transaction.value!.isNegative
                          ? kRedColor
                          : kGreenColor,
                    ),
                  ),
                  TextSpan(
                    text: transaction.date,
                    style: const TextStyle(color: Colors.grey).copyWith(
                      height: 1.5,
                      fontSize: 14,
                      shadows: [
                        const BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: kSpacingUnit * 2,
                          offset: Offset(2, kSpacingUnit * 0.2), // cha
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
