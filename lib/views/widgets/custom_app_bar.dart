import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notesapp/utils/app_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xff3B3B3B)),
            child: SvgPicture.asset(
              'assets/images/info.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(width: 12),
           Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xff3B3B3B)),
            child: SvgPicture.asset(
              'assets/images/search.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
          const Spacer(),
          Text(
            'ملاحظاتي',
            style: AppFontsStyle.expoBold,
          ),
        ],
      ),
    );
  }
}
