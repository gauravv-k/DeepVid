import 'package:flutter/material.dart';

class WidgetPreviewer extends StatelessWidget {
  final Widget previewWidget;
  final String userName;
  final String userInitial;
  final String description;
  final List<Widget> actions;

  const WidgetPreviewer({
    Key? key,
    required this.previewWidget,
    required this.userName,
    required this.userInitial,
    required this.description,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 46, 45, 40),
        body: Column(
          children: [
            // Centered short line at the top
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 0.5),
              child: Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            // Top bar with user info
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[800],
                    radius: 20,
                    child: Text(
                      userInitial,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert,
                        color: Colors.white, size: 22),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Previewed widget (image/video)
            Expanded(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.93,
                  heightFactor: 1.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: previewWidget,
                  ),
                ),
              ),
            ),
            // Description
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle
                      .normal, // "Medium" is not a valid FontStyle, use normal
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Action buttons
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 16.0, left: 16.0, right: 16.0, top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...actions
                      .sublist(0, actions.length - 1)
                      .map(
                        (action) => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 66, 65, 65),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 35,
                            height: 35,
                            child: Center(
                              child: action is IconButton
                                  ? IconTheme(
                                      data: const IconThemeData(
                                        size: 20, // Make icon small
                                        color: Colors.white,
                                      ),
                                      child: (action.icon),
                                    )
                                  : action,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  const Spacer(),
                  Builder(
                    builder: (context) {
                      final screenWidth = MediaQuery.of(context).size.width;
                      final screenHeight = MediaQuery.of(context).size.height;
                      final containerHeight = screenHeight * 0.052; // ~40px on 770px height
                      final containerWidth = screenWidth * 0.21; // ~80px on 375px width
                      final horizontalPadding = screenWidth * 0.032; // ~12px on 375px width
                      final fontSize = screenWidth * 0.032; // ~12px on 375px width

                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF232323),
                          borderRadius: BorderRadius.circular(screenWidth * 0.021), // ~8px on 375px width
                        ),
                        height: containerHeight,
                        width: containerWidth,
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Center(
                          child: DefaultTextStyle(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Regular',
                            ),
                            child: actions.last is IconButton
                                ? const Text("More")
                                : actions.last,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
