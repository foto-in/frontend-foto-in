import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class PinnedSearchBar extends StatelessWidget {
  const PinnedSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: PinnedHeaderDelegate(),
      pinned: true,
    );
  }
}

class PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  bool _needsRebuild = false;
  void markNeedsRebuild() {
    _needsRebuild = true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 88,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: AppColor.backgroundPrimary,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari fotografer, kategori...',
          hintStyle: FotoInLabelTypography.small(color: AppColor.textSecondary),
          prefixIcon: const Icon(Icons.search),
          fillColor: AppColor.backgroundSecondary,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 88; // Height of the pinned widget

  @override
  double get minExtent => 88; // Height of the pinned widget

  bool get overLapsContent => false;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return _needsRebuild;
  }
}
