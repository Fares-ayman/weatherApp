import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resourses/color_manager.dart';
import '../../../../core/resourses/values_manager.dart';

class MyCardLoadingWidget extends StatelessWidget {
  const MyCardLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s300,
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p15, vertical: AppPadding.p20),
      child: Shimmer.fromColors(
        baseColor: AppColor.grey,
        highlightColor: AppColor.white,
        child: Card(
          color: AppColor.white,
          elevation: AppSize.s5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s25),
          ),
          child: Container(
            height: AppSize.s300,
          ),
        ),
      ),
    );
  }
}
