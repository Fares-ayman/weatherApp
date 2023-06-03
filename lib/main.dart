import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_gst/modules/home/presentation/bloc/five_days/five_days_cubit.dart';
import 'package:weather_app_gst/modules/home/presentation/bloc/weather/weather_cubit.dart';

import 'core/resourses/routes_manager.dart';
import 'core/resourses/theme_manager.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                di.sl<WeatherCubit>()..getCurrentWeatherData("cairo")),
        BlocProvider(
            create: (_) => di.sl<FiveDaysCubit>()..getFiveDaysData("cairo")),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        initialRoute: AppRoutesName.home,
        onGenerateRoute: AppRoute.generate,
      ),
    );
  }
}
