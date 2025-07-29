import 'package:deep_vid/features/app_bar/app_bar.dart';
import 'package:deep_vid/features/favorite/widgets/all_fav_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:deep_vid/features/community/widget/widget_previewer.dart';

class AllFavPage extends StatelessWidget {
  const AllFavPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = [
      {'img': 'assets/images/com 1.jpg', 'isVideo': true},
      {'img': 'assets/images/com 2.jpg', 'isVideo': false},
      {'img': 'assets/images/com 3.jpg', 'isVideo': false},
      {'img': 'assets/images/com 4.jpg', 'isVideo': true},
      {'img': 'assets/images/com 5.jpg', 'isVideo': false},
      {'img': 'assets/images/com 6.jpg', 'isVideo': false},
      {'img': 'assets/images/com 1.jpg', 'isVideo': true},
      {'img': 'assets/images/com 2.jpg', 'isVideo': false},
      {'img': 'assets/images/com 3.jpg', 'isVideo': false},
      {'img': 'assets/images/com 4.jpg', 'isVideo': true},
      {'img': 'assets/images/com 5.jpg', 'isVideo': false},
      {'img': 'assets/images/com 6.jpg', 'isVideo': false},
      {'img': 'assets/images/com 7.jpg', 'isVideo': false},      
      {'img': 'assets/images/com 7.jpg', 'isVideo': false},
    ];
    return Scaffold(      
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, i) => GestureDetector(
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
                        description: 'Preview of your favorite Collections',
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
            child: AllFavGridItem(
              imagePath: items[i]['img'] as String,
              isVideo: items[i]['isVideo'] as bool,
            ),
          ),
        ),
      ),
    );
  }
}
