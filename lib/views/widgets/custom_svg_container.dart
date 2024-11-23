import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomSvgContainer extends StatelessWidget {
   const CustomSvgContainer({super.key, required this.imagepath, });
  final String imagepath;
 

  @override
  Widget build(BuildContext context) {
    return  Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff3B3B3B)),
          child: SvgPicture.asset(
            imagepath,
            color: Colors.white,
            fit: BoxFit.scaleDown,
          ),
        );
  }
}