import 'package:deep_vid/features/favorite/widgets/not_found_page.dart';
import 'package:flutter/material.dart';
import '../../app_bar/app_bar.dart';

class AiImageCreatorPage extends StatefulWidget {
  const AiImageCreatorPage({Key? key}) : super(key: key);

  @override
  State<AiImageCreatorPage> createState() => _AiImageCreatorPageState();
}

class _AiImageCreatorPageState extends State<AiImageCreatorPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool makePublic = true;
  int selectedDimension = 1;
  final List<String> dimensions = ['1:1', '9:16', '16:9', 'More'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: 'Creator'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.purpleAccent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Urbanist',
              ),
              tabs: const [
                Tab(text: 'Create Image'),
                Tab(text: 'My Images'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCreateImageTab(context),
                NotFoundPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateImageTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF232323),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Urbanist'),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Generate an image of spaceship...',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontFamily: 'Urbanist'),
                      ),
                    ),
                  ),
                  Icon(Icons.image_outlined, color: Colors.grey[400]),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text('Select a model:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF232323),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Flux 1.1 Pro',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Change',
                        style: TextStyle(
                            color: Colors.purpleAccent,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text('Image Dimensions',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              children: List.generate(dimensions.length, (index) {
                final isSelected = selectedDimension == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDimension = index;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.purpleAccent.withOpacity(0.15)
                            : const Color(0xFF232323),
                        border: Border.all(
                          color: isSelected
                              ? Colors.purpleAccent
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: index < 3
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    index == 0
                                        ? Icons.crop_square
                                        : index == 1
                                            ? Icons.stay_current_portrait
                                            : Icons.stay_current_landscape,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(dimensions[index],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w600)),
                                ],
                              )
                            : const Icon(Icons.add,
                                color: Colors.white, size: 28),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Make Public',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600)),
                    const SizedBox(width: 120),
                    Switch(
                      value: makePublic,
                      onChanged: (val) {
                        setState(() {
                          makePublic = val;
                        });
                      },
                      activeColor: Colors.purpleAccent,
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(213, 223, 64, 251),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: const Text('Generate Image (10 Credits)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
