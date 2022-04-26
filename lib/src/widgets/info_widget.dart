import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String chaneelName;
  final String duration;
  final String views;

  const InfoWidget({
    Key? key,
    required this.title,
    required this.chaneelName,
    required this.duration,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headline1!;
    final bodytext = Theme.of(context).textTheme.bodyText1!;
    return Padding(
      padding: EdgeInsets.only(left: 22.w, top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: headline,
            ),
          ),
          SizedBox(height: 25.h),
          Text(
            'Source: ' + chaneelName,
            style: bodytext.copyWith(color: grey),
          ),
          SizedBox(height: 15.h),
          Text(
            'Duration: ' + duration + ' min',
            style: bodytext.copyWith(color: grey),
          ),
          SizedBox(height: 15.h),
          Text(
            views + ' views',
            style: bodytext.copyWith(color: grey),
          ),
        ],
      ),
    );
  }
}
