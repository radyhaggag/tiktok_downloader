part of 'downloader_bloc.dart';

abstract class DownloaderEvent extends Equatable {
  const DownloaderEvent();
}

class DownloaderGetVideo extends DownloaderEvent {
  final String videoLink;

  const DownloaderGetVideo(this.videoLink);

  @override
  List<Object?> get props => [videoLink];
}

class DownloaderSaveVideo extends DownloaderEvent {
  final TikTokVideo tikTokVideo;

  const DownloaderSaveVideo({required this.tikTokVideo});

  @override
  List<Object?> get props => [tikTokVideo];
}

class LoadOldDownloads extends DownloaderEvent {
  @override
  List<Object?> get props => [];
}
