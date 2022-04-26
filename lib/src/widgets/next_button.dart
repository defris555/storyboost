import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class NextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool isActive;

  const NextButton({
    Key? key,
    required this.onTap,
    required this.child,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : () {},
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 65.h,
        width: 325.w,
        decoration: BoxDecoration(
          color: isActive ? orange : grey,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(child: child),
      ),
    );
  }
}
