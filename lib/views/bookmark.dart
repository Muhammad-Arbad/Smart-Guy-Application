import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../constants/consts.dart';
import '../widgets/image_icon.dart';

class Bookmark extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<Bookmark> {
  // List of YouTube video URLs
  final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=2jsaXyRkvaY',
    'https://www.youtube.com/watch?v=-XJYf6S5SPA',
    'https://www.youtube.com/watch?v=cn_jNosW58E',
    'https://www.youtube.com/watch?v=A_oI_-1pDDE',
    'https://www.youtube.com/watch?v=CaRM0FRBCc4'
  ];

  // Convert URL to video ID
  String? _getVideoId(String url) => YoutubePlayer.convertUrlToId(url);

  // Open video player in a dialog/modal
  void _openPlayer(BuildContext context, String videoId) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: CustomAppColors.primaryColor,

              bottomActions: [
                const SizedBox(width: 10),
                CurrentPosition(),
                const SizedBox(width: 10),
                ProgressBar(isExpanded: true),
                const SizedBox(width: 10),
                // FullScreenButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return

       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Bookmarked Videos", style: CustomTextStyles.pagetitle16Bold700),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: videoUrls.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:  2 , // Responsive grid
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 16/9,

              ),
              itemBuilder: (context, index) {
                String? videoId = _getVideoId(videoUrls[index]);
                if (videoId == null) return const SizedBox();

                // Try to get the highest resolution thumbnail first
                String thumbnailUrl = 'https://img.youtube.com/vi/$videoId/0.jpg';

                return GestureDetector(
                  onTap: () => _openPlayer(context, videoId),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                      child: Stack(
                        children: [
                          // YouTube thumbnail (centered crop)
                          Positioned.fill(
                            child: Image.network(
                              thumbnailUrl,
                              fit: BoxFit.cover,

                              errorBuilder: (context, error, stackTrace) => Container(
                                color: Colors.grey[300],
                                child: Center(child: Icon(Icons.broken_image)),
                              ),
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(child: CircularProgressIndicator());
                              },
                            ),

                          ),
                          // Play button overlay
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              child: IconImage(
                                path: 'assets/images/play_icon.png',
                                color: CustomAppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                  ),
                );
              },
            ),
          ),
        ],
      );

  }
}
