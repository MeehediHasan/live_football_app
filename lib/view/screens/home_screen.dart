import 'package:flutter/material.dart';
import 'package:live_football_score/controller/home_screen_controller.dart';
import 'package:live_football_score/view/widgets/live_list_item_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController _homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                appBarWidget(),
                _homeScreenController.matchList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _homeScreenController.matchList.length,
                        itemBuilder: (context, index) {
                          return LiveListItemWidget(
                            football: _homeScreenController.matchList[index],
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///------App bar widget------///
  Widget appBarWidget() {
    return Container(
      width: double.maxFinite,
      height: 50,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            padding: const EdgeInsets.only(left: 15, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withAlpha(80),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
          const Text(
            "Live Football Score",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withAlpha(80),
            ),
            child: const Icon(
              Icons.notifications,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
