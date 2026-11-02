import 'package:assignment_7/core/app_colors.dart';
import 'package:assignment_7/core/image_paths.dart';
import 'package:flutter/material.dart';

class StoryCardWidget extends StatelessWidget {
  final bool isCreateStory;

  const StoryCardWidget({super.key, this.isCreateStory = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: isCreateStory ? Border.all(color: AppColors.grey) : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: isCreateStory ? _buildCreateStory() : _buildStandardStory(),
      ),
    );
  }

  Widget _buildCreateStory() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                ImagePaths.profileImg,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Create a\nStory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 40,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 2.5),
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }

  Widget _buildStandardStory() {
    return Stack(
      children: [
        Image.asset(
          ImagePaths.storyImg,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.blue, width: 2.5),
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(ImagePaths.profileImg),
            ),
          ),
        ),
      ],
    );
  }
}
