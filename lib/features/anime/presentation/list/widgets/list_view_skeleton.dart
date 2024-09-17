import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:kraken_animelist/core/extensions/media_query_extension.dart';

class ListViewSkeleton extends StatelessWidget {
  final ScrollController scrollController;
  const ListViewSkeleton({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: 10,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1.5,
          margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  shape: BoxShape.rectangle,
                  height: context.calculateHeight(7),
                  width: context.calculateWidth(5),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SkeletonLine(
                        style: SkeletonLineStyle(height: 12),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SkeletonLine(
                            style: SkeletonLineStyle(height: 12, width: 50),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(height: 12, width: 50),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
