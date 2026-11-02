import 'package:assignment_7/core/app_colors.dart';
import 'package:assignment_7/core/image_paths.dart';
import 'package:flutter/material.dart';

class PostCreationWidget extends StatelessWidget {
  const PostCreationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(ImagePaths.profileImg),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                hintStyle: TextStyle(color: AppColors.grey, fontSize: 16),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              ImagePaths.photoLibIcon,
              width: 24,
              height: 24,
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
