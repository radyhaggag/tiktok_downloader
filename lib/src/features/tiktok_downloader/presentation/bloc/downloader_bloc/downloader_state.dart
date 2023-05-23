part of 'downloader_bloc.dart';

abstract class DownloaderState extends Equatable {
  const DownloaderState();
}

class DownloaderInitial extends DownloaderState {
  @override
  List<Object> get props => [];
}

class DownloaderGetVideoLoading extends DownloaderState {
  const DownloaderGetVideoLoading();

  @override
  List<Object?> get props => [];
}

class DownloaderGetVideoSuccess extends DownloaderState {
  final TikTokVideo tikTokVideo;

  const DownloaderGetVideoSuccess(this.tikTokVideo);

  @override
  List<Object?> get props => [tikTokVideo];
}

class DownloaderGetVideoFailure extends DownloaderState {
  final String message;

  const DownloaderGetVideoFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class DownloaderSaveVideoLoading extends DownloaderState {
  const DownloaderSaveVideoLoading();

  @override
  List<Object?> get props => [];
}

class DownloaderSaveVideoSuccess extends DownloaderState {
  final String message;
  final String path;

  const DownloaderSaveVideoSuccess({required this.message, required this.path});

  @override
  List<Object?> get props => [message, path];
}

class DownloaderSaveVideoFailure extends DownloaderState {
  final String message;

  const DownloaderSaveVideoFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class OldDownloadsLoading extends DownloaderState {
  const OldDownloadsLoading();

  @override
  List<Object?> get props => [];
}

class OldDownloadsLoadingSuccess extends DownloaderState {
  final List<VideoItem> downloads;

  const OldDownloadsLoadingSuccess({required this.downloads});

  @override
  List<Object?> get props => [downloads];
}

class OldDownloadsLoadingFailure extends DownloaderState {
  final String message;

  const OldDownloadsLoadingFailure(this.message);

  @override
  List<Object?> get props => [message];
}
