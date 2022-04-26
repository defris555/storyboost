import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:storyboost/src/controllers/controllers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/data_model.dart';
import '../utils/constants.dart';

class ApiService extends GetxService {
  bool allDone = false;
  DataModel? data;

  final Uri mikesUrl = Uri.parse('https://devproduct.io/en');
  final Uri dmitrysUrl = Uri.parse('https://github.com/defris555/');
  final Uri annasUrl = Uri.parse('https://www.italki.com/teacher/4178797');

  Future<void> startApp() async {
    Get.put(PlayerController());
    await Future.delayed(requestDuration);
    allDone = true;
  }

  Future<DataModel?> fetchData() async {
    await _makeGetRequest();
    return data;
  }

  Future<void> _makeGetRequest() async {
    var url = Uri.parse(api);
    var response = await http.get(url);
    Map<String, dynamic> dataMap = await jsonDecode(response.body);
    data = DataModel(
      channelName: dataMap['channelName'],
      channelUrl: dataMap['channelUrl'].first,
      videoId: dataMap['videoID'],
      title: dataMap['title'],
      duration: dataMap['duration'],
      views: dataMap['intViews'],
    );
    if (data != null) {
      log('Channel Name: ' + data!.channelName);
      log('Channel Url: ' + data!.channelUrl);
      log('Title: ' + data!.title);
      log('Video ID: ' + data!.videoId);
      log('Duration: ' + data!.duration.toString() + 'sec');
      log('Views: ' + data!.views.toString());
    } else {
      log('data == null');
    }
  }

  void gotoLink({required Uri url}) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}
