import 'package:assignment_7/core/app_colors.dart';
import 'package:assignment_7/core/image_paths.dart';
import 'package:assignment_7/core/modules/home/widgets/post_card_widget.dart';
import 'package:assignment_7/core/modules/home/widgets/post_creation_widget.dart';
import 'package:assignment_7/core/modules/home/widgets/story_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          title: SvgPicture.asset(ImagePaths.faceBookLogo, height: 25),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                ImagePaths.plusIcon,
                width: 22,
                height: 22,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                ImagePaths.searchIcon,
                width: 22,
                height: 22,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                ImagePaths.messengerIcon,
                width: 22,
                height: 22,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.blue,
            indicatorWeight: 3,
            labelColor: AppColors.blue,
            unselectedLabelColor: AppColors.grey,
            tabs: [
              Tab(icon: SvgPicture.asset(ImagePaths.homeIcon)),
              Tab(icon: SvgPicture.asset(ImagePaths.videoIcon)),
              Tab(icon: SvgPicture.asset(ImagePaths.marketPlaceIcon)),
              Tab(icon: SvgPicture.asset(ImagePaths.profileIcon)),
              Tab(icon: SvgPicture.asset(ImagePaths.notificationIcon)),
              Tab(
                icon: CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage(ImagePaths.profileImg),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const PostCreationWidget(),
                  Divider(height: 2, thickness: 1, color: AppColors.grey),
                  const SizedBox(height: 8),

                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemBuilder: (context, index) {
                        return StoryCardWidget(isCreateStory: index == 0);
                      },
                    ),
                  ),

                  const SizedBox(height: 8),
                  Divider(height: 1, thickness: 1, color: AppColors.grey),
                  const SizedBox(height: 8),

                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const PostCardWidget();
                    },
                  ),
                ],
              ),
            ),
            Center(child: Text('Video Screen')),
            Center(child: Text('Marketplace Screen')),
            Center(child: Text('Profile Screen')),
            Center(child: Text('Notifications Screen')),
            Center(child: Text('Menu Screen')),
          ],
        ),
      ),
    );
  }
}
