import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_gst/core/resourses/color_manager.dart';
import 'package:weather_app_gst/core/resourses/strings_manager.dart';

import '../../../../core/resourses/values_manager.dart';
import '../bloc/five_days/five_days_cubit.dart';
import '../bloc/weather/weather_cubit.dart';

// ignore: must_be_immutable
class SearchWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: AppPadding.p100,
          left: AppPadding.p20,
          right: AppPadding.p20,
          bottom: AppPadding.p20),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: AppColor.white,
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          context.read<WeatherCubit>().getCurrentWeatherData(value);
          context.read<FiveDaysCubit>().getFiveDaysData(value);
          controller.clear();
        },
        decoration: InputDecoration(
          suffix: Icon(
            Icons.search,
            color: AppColor.white,
          ),
          hintStyle: TextStyle(color: AppColor.white),
          hintText: AppStrings.search.toUpperCase(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
            borderSide: BorderSide(color: AppColor.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
            borderSide: BorderSide(color: AppColor.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
            borderSide: BorderSide(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
