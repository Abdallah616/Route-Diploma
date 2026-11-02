import 'package:assignment_7/core/app_colors.dart';
import 'package:assignment_7/core/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(ImagePaths.profileImg),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Route',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          '8h . ',
                          style: TextStyle(color: AppColors.grey, fontSize: 12),
                        ),
                        Icon(Icons.public, size: 12, color: AppColors.grey),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(ImagePaths.moreIcon),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Post Body Image
          Image.asset(
            ImagePaths.postImg,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 8),

          // Post Actions Footer
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(ImagePaths.loveIcon),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(ImagePaths.commentIcon),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(ImagePaths.shareIcon),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(ImagePaths.saveIcon),
                ),
              ],
            ),
          ),

          const Divider(height: 2, thickness: 1, color: AppColors.grey),
        ],
      ),
    );
  }
}
