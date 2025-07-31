import 'package:flutter/material.dart';

class AiCreationCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final String backgroundImage;
  final String statusTag;
  final Color statusColor;
  final Color shadowColor;
  final VoidCallback? onTap;

  const AiCreationCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.backgroundImage,
    required this.statusTag,
    required this.statusColor,
    required this.shadowColor,
    this.onTap,
  });

  @override
  State<AiCreationCard> createState() => _AiCreationCardState();
}

class _AiCreationCardState extends State<AiCreationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    // Start the fade-in animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    
    // Calculate dynamic dimensions based on screen size
    final cardHeight = screenHeight * 0.22; // 22% of screen height
    final cardPadding = screenWidth * 0.03; // 3% of screen width
    final iconContainerSize = screenWidth * 0.12; // 12% of screen width
    final iconSize = screenWidth * 0.065; // 6.5% of screen width
    final arrowContainerSize = screenWidth * 0.09; // 9% of screen width
    final arrowIconSize = screenWidth * 0.06; // 6% of screen width
    final statusPaddingHorizontal = screenWidth * 0.025; // 2.5% of screen width
    final statusPaddingVertical = screenHeight * 0.006; // 0.6% of screen height
    final statusBorderRadius = screenWidth * 0.025; // 2.5% of screen width
    final statusFontSize = screenWidth * 0.025; // 2.5% of screen width
    final titleFontSize = screenWidth * 0.038; // 3.8% of screen width
    final descriptionFontSize = screenWidth * 0.028; // 2.8% of screen width
    final spacingBetweenElements = screenWidth * 0.04; // 4% of screen width
    final iconBorderRadius = screenWidth * 0.03; // 3% of screen width
    final arrowBorderRadius = screenWidth * 0.033; // 3.3% of screen width

    return FadeTransition(
      opacity: _fadeAnimation,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor.withOpacity(0.4),
                blurRadius: 12.0,
                offset: const Offset(0, 8),
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.85),
                            Colors.transparent,
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(cardPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: statusPaddingHorizontal,
                            vertical: statusPaddingVertical,
                          ),
                          decoration: BoxDecoration(
                            color: widget.statusColor,
                            borderRadius: BorderRadius.circular(statusBorderRadius),
                          ),
                          child: Text(
                            widget.statusTag,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: statusFontSize,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist',
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            width: iconContainerSize,
                            height: iconContainerSize,
                            decoration: BoxDecoration(
                              color: widget.iconColor.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(iconBorderRadius),
                              border: Border.all(
                                color: widget.iconColor,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: widget.iconColor.withOpacity(0.3),
                                  blurRadius: 10.0,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              widget.icon,
                              color: Colors.white,
                              size: iconSize,
                            ),
                          ),
                          SizedBox(width: spacingBetweenElements),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Urbanist',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                SizedBox(height: screenHeight * 0.005), // 0.5% of screen height
                                Text(
                                  widget.description,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: descriptionFontSize,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Urbanist',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: spacingBetweenElements),
                          Container(
                            width: arrowContainerSize,
                            height: arrowContainerSize,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(arrowBorderRadius),
                            ),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: arrowIconSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 