import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notesapp/utils/app_fonts.dart';
import 'package:notesapp/views/screens/search_screen.dart';
import 'package:notesapp/views/widgets/custom_svg_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomSvgContainer(
            imagepath: 'assets/images/info.svg',
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen(),));
            },
            child: const CustomSvgContainer(
              imagepath: 'assets/images/search.svg',
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
