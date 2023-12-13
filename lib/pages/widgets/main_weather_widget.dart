import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/bloc/forecast_bloc.dart';
import 'package:flutter_course/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //final forecast = context.read<ForecastBloc>().state;
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        if (state is ForecastLoaded) {
          return Center(
            child: SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width * .8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -10,
                    child: Text(
                      "${state.forecastModel.currentTemp.toStringAsFixed(0)}°C",
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 120,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Image.asset(
                      getImage(state.forecastModel.id),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
