import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_gst/core/resourses/assets_manager.dart';
import 'package:weather_app_gst/core/resourses/values_manager.dart';
import 'package:weather_app_gst/modules/home/domain/entity/current_weather_data_entity.dart';

import '../../../../core/resourses/color_manager.dart';
import '../../../../core/resourses/constants_manager.dart';

class MyCardWidget extends StatelessWidget {
  final CurrentWeatherDataEntity currentWeatherData;
  const MyCardWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p15, vertical: AppPadding.p20),
      child: Card(
        color: AppColor.white,
        elevation: AppSize.s5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: AppPadding.p15,
                left: AppPadding.p20,
                right: AppPadding.p20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      '${currentWeatherData.name}'.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColor.black45,
                            fontSize: AppSize.s24,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstants.fontFamily,
                          ),
                    ),
                  ),
                  Center(
                    child: Text(
                      DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColor.black45,
                            fontSize: AppSize.s16,
                            fontFamily: AppConstants.fontFamily,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: AppPadding.p20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${currentWeatherData.weather![0].description}',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.black45,
                                    fontSize: AppSize.s22,
                                    fontFamily: AppConstants.fontFamily,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${(currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: AppColor.black45,
                                fontFamily: AppConstants.fontFamily,
                              ),
                        ),
                        Text(
                          'min: ${(currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.black45,
                                    fontSize: AppSize.s14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppConstants.fontFamily,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: AppPadding.p20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LottieBuilder.asset(
                          AppJsonAssets.cloudyAnim,
                          height: AppSize.s50,
                          width: AppSize.s50,
                        ),
                        Text(
                          'wind ${currentWeatherData.wind!.speed} m/s',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.black45,
                                    fontSize: AppSize.s14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppConstants.fontFamily,
                                  ),
                        ),
                      ],
                    ),
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
