import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:storyboost/src/screens/info_screen.dart';
import 'package:storyboost/src/utils/colors.dart';
import 'package:storyboost/src/widgets/icons.dart';
import 'package:storyboost/src/widgets/info_widget.dart';
import 'package:storyboost/src/widgets/next_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/controllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headline1!;
    return GetBuilder<PlayerController>(
      builder: (controller) {
        return YoutubePlayerBuilder(
          player: controller.player,
          builder: (context, player) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'StoryBoost: Stories for english study',
                  style: headline.copyWith(
                    color: grey,
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 7.w),
                    child: GestureDetector(
                      child: TopIcons.info(),
                      onTap: () async {
                        await controller.deactivate();
                        Get.to(() => InfoScreen());
                      },
                    ),
                  ),
                ],
              ),
              body: SizedBox(
                height: context.height,
                width: context.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.h,
                      child: Padding(
                        padding: EdgeInsets.all(15.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: TopIcons.autoPlay(controller.autoPlay),
                                onTap: () => controller.onOffAutoplay(),
                              ),
                              SizedBox(width: 15.w),
                              GestureDetector(
                                child: TopIcons.mute(controller.mute),
                                onTap: () => controller.onOffVolume(),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: context.width,
                      height: context.width / 16 * 9,
                      child: controller.isLoaded
                          ? player
                          : const Center(
                              // child: Loader(),
                              ),
                    ),
                    Expanded(
                      child: controller.isLoaded
                          ? InfoWidget(
                              title: controller.data!.title,
                              chaneelName: controller.data!.channelName,
                              views: (controller.data!.views).toString(),
                              duration: (controller.data!.duration / 60)
                                  .round()
                                  .toString(),
                            )
                          : const SizedBox(),
                    ),
                    NextButton(
                      onTap: () async => await controller.goNext(),
                      isActive: controller.isLoaded,
                      child: Text(
                        'Next Story',
                        style: headline.copyWith(color: white),
                      ),
                    ),
                    SizedBox(height: 55.h),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
