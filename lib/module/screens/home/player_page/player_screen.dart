import 'package:abook/core/services/audio_service.dart';
import 'package:abook/data/models/book_model.dart';
import 'package:abook/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({
    super.key,
    required this.selectedBook,
  });
  final BookModel selectedBook;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final PageManager _pageManager;

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          widget.selectedBook.title,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? Colors.white
                : AppColors.audioBlack,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        iconTheme: IconThemeData(
          color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
              ? Colors.white
              : AppColors.audioBlack,
        ),
        backgroundColor:
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.darkbgColor
                : Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  height: 319.0,
                  width: 319.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.selectedBook.coverImageUrl),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 44.0,
              ),
              Text(
                widget.selectedBook.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                widget.selectedBook.author,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? AppColors.audioGrey
                          : const Color(0xFF010104),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Narrated By: ${widget.selectedBook.narrator}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? AppColors.audioGrey
                          : const Color(0xFF010104),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ValueListenableBuilder<ProgressBarState>(
                valueListenable: _pageManager.progressNotifier,
                builder: (_, value, __) {
                  return ProgressBar(
                    progress: value.current,
                    buffered: value.buffered,
                    total: value.total,
                    progressBarColor: AppColors.primaryPurple,
                    baseBarColor: AppColors.primaryPurple,
                    bufferedBarColor: Colors.white.withOpacity(0.24),
                    thumbColor: AppColors.primaryPurple,
                    onSeek: _pageManager.seek,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.volume_up_outlined,
                    color: AppColors.audioBlack,
                    size: 40.0,
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.audioBlack),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: AppColors.audioBlack,
                        size: 40.0,
                      ),
                    ),
                  ),
                  ValueListenableBuilder<ButtonState>(
                    valueListenable: _pageManager.buttonNotifier,
                    builder: (_, value, __) {
                      switch (value) {
                        case ButtonState.loading:
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            width: 32.0,
                            height: 32.0,
                            child: const CircularProgressIndicator(),
                          );
                        case ButtonState.paused:
                          return GestureDetector(
                            onTap: _pageManager.play,
                            child: Container(
                              height: 72.0,
                              width: 72.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondaryOrange,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: AppColors.cardBackground,
                                  size: 55.0,
                                ),
                              ),
                            ),
                          );
                        // return IconButton(
                        //   icon: const Icon(
                        //     Icons.play_arrow,
                        //     color: AppColors.audioBlack,
                        //   ),
                        //   iconSize: 55.0,
                        //   onPressed: _pageManager.play,
                        // );
                        case ButtonState.playing:
                          return GestureDetector(
                            onTap: _pageManager.pause,
                            child: Container(
                              height: 72.0,
                              width: 72.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondaryOrange,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.pause,
                                  color: AppColors.cardBackground,
                                  size: 55.0,
                                ),
                              ),
                            ),
                          );
                        // return IconButton(
                        //   icon: const Icon(
                        //     Icons.pause,
                        //     color: AppColors.audioBlack,
                        //   ),
                        //   iconSize: 55.0,
                        //   onPressed: _pageManager.pause,
                        // );
                      }
                    },
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.audioBlack)),
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.audioBlack,
                        size: 40.0,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.volume_down_outlined,
                    color: AppColors.audioBlack,
                    size: 40.0,
                  ),
                  // const Icon(
                  //   Icons.mobile_screen_share_outlined,
                  //   color: AppColors.audioBlack,
                  //   size: 55.0,
                  // ),
                ],
              ),
              const SizedBox(
                height: 35.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.book_outlined,
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark
                            ? const Color.fromARGB(255, 113, 113, 227)
                            : AppColors.audioBlack,
                      ),
                      Text(
                        'Chapter 2',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? const Color.fromARGB(255, 113, 113, 227)
                              : AppColors.audioBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.bookmark_add_outlined,
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark
                            ? const Color.fromARGB(255, 113, 113, 227)
                            : AppColors.audioBlack,
                      ),
                      Text(
                        'Bookmark',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? const Color.fromARGB(255, 113, 113, 227)
                              : AppColors.audioBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.speed_outlined,
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark
                            ? const Color.fromARGB(255, 113, 113, 227)
                            : AppColors.audioBlack,
                      ),
                      Text(
                        '2x Speed',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? const Color.fromARGB(255, 113, 113, 227)
                              : AppColors.audioBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.download_outlined,
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark
                            ? const Color.fromARGB(255, 113, 113, 227)
                            : AppColors.audioBlack,
                      ),
                      Text(
                        'Download',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? const Color.fromARGB(255, 113, 113, 227)
                              : AppColors.audioBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
