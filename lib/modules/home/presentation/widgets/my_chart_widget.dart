import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app_gst/core/resourses/values_manager.dart';
import 'package:weather_app_gst/modules/home/domain/entity/five_days_data_entity.dart';

class MyChartWidget extends StatelessWidget {
  final List<FiveDayDataEntity> dataSource;
  const MyChartWidget({
    super.key,
    required this.dataSource,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: AppSize.s240,
      child: Card(
        elevation: AppSize.s5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<FiveDayDataEntity, String>>[
            SplineSeries<FiveDayDataEntity, String>(
              dataSource: dataSource,
              xValueMapper: (FiveDayDataEntity f, _) => f.dateTime,
              yValueMapper: (FiveDayDataEntity f, _) => f.temp,
            ),
          ],
        ),
      ),
    );
  }
}
