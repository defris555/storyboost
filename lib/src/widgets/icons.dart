import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

abstract class TopIcons {
  static Widget autoPlay(bool autoPlay) => Container(
        alignment: Alignment.center,
        height: 35.h,
        width: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: !autoPlay ? grey : black),
        ),
        child: !autoPlay
            ? const Icon(
                EvaIcons.minus,
                color: grey,
              )
            : const Text(
                'Auto',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
      );

  static Widget back() => SizedBox(
        height: 35.h,
        width: 35.h,
        child: const Icon(
          EvaIcons.arrowIosBack,
          color: grey,
        ),
      );

  static Widget info() => SizedBox(
        height: 35.h,
        width: 35.h,
        child: const Icon(
          EvaIcons.infoOutline,
          color: grey,
        ),
      );

  static Widget mute(bool mute) => Container(
        height: 35.h,
        width: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: mute ? grey : black),
        ),
        child: mute
            ? const Icon(
                EvaIcons.volumeOffOutline,
                color: grey,
              )
            : const Icon(
                EvaIcons.volumeUpOutline,
                color: black,
              ),
      );
}
