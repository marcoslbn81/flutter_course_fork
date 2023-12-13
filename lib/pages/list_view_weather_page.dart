// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/bloc/forecast_bloc.dart';
import 'package:flutter_course/constants/api_k.dart';

import 'package:flutter_course/models/weather_model.dart';
import 'package:flutter_course/pages/weather_detail_page.dart';
import 'package:flutter_course/pages/widgets/snack_bar_widget.dart';
import 'package:flutter_course/repositories/weather_repository.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListViewWeatherPage extends StatefulWidget {
  const ListViewWeatherPage({super.key});

  @override
  State<ListViewWeatherPage> createState() => _ListViewWeatherPageState();
}

class _ListViewWeatherPageState extends State<ListViewWeatherPage> {
  final WeatherRepository weatherRepository = WeatherRepository();
  List<WeatherModel> weatherList = [];
  bool isLoading = false;

  getWeatherByName(String cityName) async {
    setState(() {
      isLoading = true;
    });
    final res = await weatherRepository.getCurrentWeatherByName(
      [cityName],
    );
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isLoading = false;
    });

    res.fold(
      (l) {
        print(l.toString());
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(l.message));
      },
      (r) {
        setState(() {
          weatherList.add(r);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cityController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: "Lokalizacja",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                //onTap: () => FocusScope.of(context).previousFocus(),
                onEditingComplete: () async {
                  await getWeatherByName(cityController.text);
                  //FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              SizedBox(
                height: 20,
              ),
              isLoading
                  ? Center(
                      child: SpinKitChasingDots(color: Colors.blue),
                    )
                  : weatherList.isEmpty
                      ? Text("Wyszukaj miejscowość")
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: false,
                            itemCount: weatherList.length,
                            itemBuilder: (context, index) => Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) => setState(() {
                                weatherList.removeAt(index);
                              }),
                              background: Container(
                                color: Colors.grey,
                              ),
                              child: CustomWeatherListTile(
                                weather: weatherList[index],
                              ),
                            ),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomWeatherListTile extends StatelessWidget {
  const CustomWeatherListTile({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ForecastBloc()
                  ..add(
                    GetForecastEvent(
                      lat: weather.lat,
                      lon: weather.lon,
                    ),
                  ),
                lazy: false,
                child: WeatherDetailPage(
                  locationName: weather.cityName,
                ),
              ),
            )),
        title: Text(
          weather.cityName,
          textAlign: TextAlign.center,
        ),
        leading: Image.network(ApiK.weatherIcon(weather.iconCode)),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Temperatura ${weather.temperature}°C"),
            Text("Wilgotność ${weather.humidity}%"),
            Text("Ciśnienie ${weather.pressure}hPa"),
          ],
        ),
      ),
    );
  }
}
