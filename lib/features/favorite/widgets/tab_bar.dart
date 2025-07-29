import 'package:flutter/material.dart';

class TabBar_Widget extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final void Function(String) onTap;
  const TabBar_Widget({
    required this.tabController,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.tertiary,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        controller: tabController,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        isScrollable: true,
        tabs: [
          Tab(
            child: GestureDetector(
              onTap: () => onTap('All'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.grid_view_rounded, size: 16),
                  SizedBox(width: 8),
                  Text(
                    'All',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Tab(
            child: GestureDetector(
              onTap: () => onTap('Images'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.image_outlined, size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Images',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Tab(
            child: GestureDetector(
              onTap: () => onTap('Videos'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.video_library_outlined, size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Videos',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Tab(
            child: GestureDetector(
              onTap: () => onTap('Audio'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.music_note_outlined, size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Audio',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight - 10);
}
