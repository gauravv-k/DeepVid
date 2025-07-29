import 'package:deep_vid/features/app_bar/app_bar.dart';
import 'package:deep_vid/features/favorite/all_favourite.dart';
import 'package:deep_vid/features/favorite/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedTabIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: "Favourite"),
      ),
      body: Column(
        children: [
          TabBar_Widget(
            tabController: _tabController,
            onTap: (label) {
              int index = 0;
              switch (label) {
                case 'All':
                  index = 0;
                  break;
                case 'Images':
                  index = 1;
                  break;
                case 'Videos':
                  index = 2;
                  break;
                case 'Audio':
                  index = 3;
                  break;
              }
              setState(() {
                _selectedTabIndex = index;
                _tabController.animateTo(index);
              });
            },
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                switch (_selectedTabIndex) {
                  case 0:
                    return AllFavPage();
                  case 1:
                    return Center(child: Text('Images Page', style: TextStyle(color: Colors.white)));
                  case 2:
                    return Center(child: Text('Videos Page', style: TextStyle(color: Colors.white)));
                  case 3:
                    return Center(child: Text('Audio Page', style: TextStyle(color: Colors.white)));
                  default:
                    return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
