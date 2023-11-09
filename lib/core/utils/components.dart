import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Components {
  static Widget background({required Widget child}) {
    return Container(
      width: 423.w,
      height: 858.h,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.22, -0.98),
          end: Alignment(-0.22, 0.98),
          colors: [Color(0xFF29B1DD), Color(0xFF33AADD), Color(0xFF2DC7E9)],
        ),
      ),
      child: child,
    );
  }
}
