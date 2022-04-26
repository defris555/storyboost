class DataModel {
  final String channelName;
  final String channelUrl;
  final String videoId;
  final String title;
  final int duration;
  final int views;

  const DataModel({
    required this.channelName,
    required this.channelUrl,
    required this.videoId,
    required this.title,
    required this.duration,
    required this.views,
  });
}
