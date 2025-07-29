import 'package:deep_vid/features/app_bar/app_bar.dart';
import 'package:deep_vid/features/community/widget/community_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:deep_vid/features/community/widget/widget_previewer.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = [
      {'img': 'assets/images/com 1.jpg', 'isVideo': true},
      {'img': 'assets/images/com 2.jpg', 'isVideo': false},
      {'img': 'assets/images/com 3.jpg', 'isVideo': false},
      {'img': 'assets/images/com 4.jpg', 'isVideo': true},
      {'img': 'assets/images/com 5.jpg', 'isVideo': false},
      {'img': 'assets/images/com 6.jpg', 'isVideo': false},
      {'img': 'assets/images/com 7.jpg', 'isVideo': false},
      {'img': 'assets/images/com 1.jpg', 'isVideo': true},
      {'img': 'assets/images/com 2.jpg', 'isVideo': false},
      {'img': 'assets/images/com 3.jpg', 'isVideo': false},
      {'img': 'assets/images/com 4.jpg', 'isVideo': true},
      {'img': 'assets/images/com 5.jpg', 'isVideo': false},
      {'img': 'assets/images/com 6.jpg', 'isVideo': false},
      {'img': 'assets/images/com 7.jpg', 'isVideo': false},
      {'img': 'assets/images/com 3.jpg', 'isVideo': false},
      {'img': 'assets/images/com 4.jpg', 'isVideo': true},
      {'img': 'assets/images/com 5.jpg', 'isVideo': false},
      {'img': 'assets/images/com 6.jpg', 'isVideo': false},
      {'img': 'assets/images/com 7.jpg', 'isVideo': false},
      {'img': 'assets/images/com 1.jpg', 'isVideo': true},
      {'img': 'assets/images/com 2.jpg', 'isVideo': false},
      {'img': 'assets/images/com 3.jpg', 'isVideo': false},
      {'img': 'assets/images/com 4.jpg', 'isVideo': true},
      {'img': 'assets/images/com 5.jpg', 'isVideo': false},
    ];
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: "Community"),
      ),
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 4.0, bottom: 12.0),
              child: Text(
                "Popular Creations",
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: items.length,
                itemBuilder: (context, i) {
                  // Alternate tile heights for a staggered effect
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        transitionAnimationController: AnimationController(
                          duration: const Duration(milliseconds: 350),
                          vsync: Navigator.of(context),
                        ),
                        builder: (context) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          child: DraggableScrollableSheet(
                            initialChildSize: 0.87,
                            minChildSize: 0.5,
                            maxChildSize: 0.87,
                            expand: false,
                            builder: (context, scrollController) => Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                              ),
                              child: WidgetPreviewer(
                                previewWidget: Image.asset(
                                  items[i]['img'] as String,
                                  fit: BoxFit.cover,
                                ),
                                userName: 'Guest User',
                                userInitial: 'G',
                                description: 'The house, after several days of heavy rain, the interior became damp and water started leakin...',
                                actions: [
                                  IconButton(
                                    icon: const Icon(Icons.favorite, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.share, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.download, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.flag, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.more_horiz, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      // The CommunityGridItem already has rounded corners and stack
                      // We wrap it in a SizedBox to control the height
                      child: SizedBox(
                        height: (i % 4 == 0 || i % 4 == 3) ? 100 : 250, // mimic the image's tall/short pattern
                        child: CommunityGridItem(
                          imagePath: items[i]['img'] as String,
                          isVideo: items[i]['isVideo'] as bool,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
