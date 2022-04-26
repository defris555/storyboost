import 'dart:developer';

import 'package:get/get.dart';
import 'package:storyboost/src/controllers/api_service.dart';
import 'package:storyboost/src/utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/data_model.dart';

class PlayerController extends GetxController {
  final apiService = Get.find<ApiService>();
  late YoutubePlayerController _controller;
  late YoutubePlayer player;
  DataModel? data;
  bool autoPlay = true;
  bool mute = false;
  bool loop = false;
  bool isLoaded = false;

  @override
  void onInit() async {
    super.onInit();
    await _fetchData();
    _updatePlayerController();
    player = YoutubePlayer(
      controller: _controller,
      progressColors:
          const ProgressBarColors(playedColor: orange, handleColor: orange),
      onReady: () => _controller.addListener(() {
        //?go to next video if ended
        if (_controller.value.playerState == PlayerState.ended) {
          goNext();
        }
      }),
    );
    isLoaded = true;
    update();
  }

  Future<void> _fetchData() async {
    data = await apiService.fetchData();
  }

  void _updatePlayerController() {
    if (data != null) {
      _controller = YoutubePlayerController(
        initialVideoId: data!.videoId,
        flags: YoutubePlayerFlags(
          mute: mute,
          autoPlay: autoPlay,
          disableDragSeek: false,
          loop: loop,
          isLive: false,
          forceHD: false,
          enableCaption: false,
        ),
      );
    }
  }

  Future<void> goNext() async {
    isLoaded = false;
    deactivate();
    update();
    await _fetchData();
    _updatePlayerController();
    player = YoutubePlayer(
      controller: _controller,
      progressColors:
          const ProgressBarColors(playedColor: orange, handleColor: orange),
      onReady: () => _controller.addListener(() {
        //?go to next video if ended
        if (_controller.value.playerState == PlayerState.ended) {
          goNext();
        }
      }),
    );
    isLoaded = true;
    update();
  }

  void onOffVolume() {
    mute = !mute;
    log('MUTE: ' + mute.toString());
    if (mute) {
      _controller.mute();
      update();
    } else {
      _controller.unMute();
      update();
    }
  }

  void onOffAutoplay() {
    autoPlay = !autoPlay;
    log('AUTOPLAY: ' + autoPlay.toString());
    update();
  }

  Future<void> deactivate() async {
    _controller.pause();
    update();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
