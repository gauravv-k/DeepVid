import 'package:deep_vid/features/app_bar/app_bar.dart';
import 'package:deep_vid/features/favorite/all_favourite.dart';
import 'package:deep_vid/features/favorite/widgets/not_found_page.dart';
import 'package:deep_vid/features/favorite/widgets/tab_bar.dart';
import 'package:deep_vid/features/my_creation/all_my_creation_page.dart';
import 'package:flutter/material.dart';

class MyCreationPage extends StatefulWidget {
  const MyCreationPage({super.key});

  @override
  State<MyCreationPage> createState() => _MyCreationPageState();
}

class _MyCreationPageState extends State<MyCreationPage>
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
        child: CustomAppBar(title: "My Creation"),
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
                    return AllMyCreationPage();
                  case 1:
                    return NotFoundPage();
                  case 2:
                    return NotFoundPage();
                  case 3:
                    return NotFoundPage();
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
