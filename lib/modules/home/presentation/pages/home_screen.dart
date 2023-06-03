import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_gst/core/resourses/assets_manager.dart';
import 'package:weather_app_gst/modules/home/presentation/bloc/five_days/five_days_cubit.dart';
import 'package:weather_app_gst/modules/home/presentation/bloc/weather/weather_cubit.dart';
import 'package:weather_app_gst/modules/home/presentation/widgets/my_card_widget.dart';
import 'package:weather_app_gst/modules/home/presentation/widgets/my_chart_loading_widget.dart';

import '../../../../core/component/dialog/error_dialog.dart';
import '../../../../core/resourses/color_manager.dart';
import '../../../../core/resourses/strings_manager.dart';
import '../../../../core/resourses/values_manager.dart';
import '../widgets/my_card_loading_widget.dart';
import '../widgets/my_chart_widget.dart';
import '../widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(AppColor.black38, BlendMode.darken),
                  image: const AssetImage(
                    AppImageAssets.cloudInBlue,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.s25),
                  bottomRight: Radius.circular(AppSize.s25),
                ),
              ),
              child: Column(
                children: [
                  SearchWidget(),
                  BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoading) {
                        return const MyCardLoadingWidget();
                      } else if (state is WeatherSuccess) {
                        return MyCardWidget(
                            currentWeatherData: state.currentWeatherDataEntity);
                      } else if (state is WeatherError) {
                        showErrorDialog(context, state.message);
                        return const MyCardLoadingWidget();
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColor.white,
              padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p20, horizontal: AppPadding.p10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: AppPadding.p10, bottom: AppPadding.p10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppStrings.forcastNext5Days.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: AppSize.s18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.black45,
                                  ),
                        ),
                        Icon(
                          Icons.next_plan_outlined,
                          color: AppColor.black45,
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<FiveDaysCubit, FiveDaysState>(
                    builder: (context, state) {
                      if (state is FiveDaysLoading) {
                        return const MyChartLoadingWidget();
                      } else if (state is FiveDaysSuccess) {
                        return MyChartWidget(
                          dataSource: state.fiveDayDataEntity,
                        );
                      } else if (state is FiveDaysError) {
                        return const MyChartLoadingWidget();
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
