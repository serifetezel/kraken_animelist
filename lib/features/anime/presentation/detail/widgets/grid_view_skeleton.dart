import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

class GridViewSkeleton extends StatelessWidget {
  const GridViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: true,
      shrinkWrap: true,
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 20.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                shape: BoxShape.circle,
                width: 90,
                height: 90,
              ),
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                height: 12,
                width: double.infinity,
              ),
            )
          ],
        );
      },
    );
  }
}
