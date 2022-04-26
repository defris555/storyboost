import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/api_service.dart';
import '../utils/colors.dart';
import '../widgets/icons.dart';

class InfoScreen extends StatelessWidget {
  final apiService = Get.find<ApiService>();

  InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodytext = Theme.of(context).textTheme.bodyText1!;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: TopIcons.back(),
          onTap: () async {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(22.w),
        child: Column(children: [
          Row(
            children: [
              Text(
                'Developed by ',
                style: bodytext.copyWith(color: grey),
              ),
              GestureDetector(
                onTap: () => apiService.gotoLink(url: apiService.mikesUrl),
                child: Text('DevProduct', style: bodytext),
              ),
            ],
          ),
          SizedBox(height: 22.w),
          Row(
            children: [
              Text(
                'Flutter fork ',
                style: bodytext.copyWith(color: grey),
              ),
              GestureDetector(
                onTap: () => apiService.gotoLink(url: apiService.dmitrysUrl),
                child: Text('Dmitry Dyachenko ', style: bodytext),
              ),
            ],
          ),
          SizedBox(height: 22.w),
          Row(
            children: [
              Text(
                'Inspired by the best english teacher ',
                style: bodytext.copyWith(color: grey),
              ),
              GestureDetector(
                onTap: () => apiService.gotoLink(url: apiService.annasUrl),
                child: Text('Anna', style: bodytext),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
